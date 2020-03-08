# Check if the project folder is our current directory ------------------
getwd()

# Read the data set -------------------
data <- read.csv("data set.csv")


# counting NAs of each column ----------------------

# We are applying the function of x defined as sum of na counts
# to each column and returning a matrix of counts of NAs in each column
sapply(data, function(x) sum(is.na(x)))

# Find out all data with one or ore NAs
data.incomplete <- data[!complete.cases(data), ]

# split data between 2 schools and handle missing values.-----------------
require(dplyr)  # loading required library for filter and mutate functions

data.GP <- data %>% filter(school == "GP")  # seperate dataset for GP

# Median value inserted in case of NAs were features are most likely highest occurance
data.GP$Fedu[is.na(data.GP$Fedu)] <- median(data.GP$Fedu, na.rm = T)  # Median father's education
data.GP$famrel[is.na(data.GP$famrel)] <- median(data.GP$famrel, na.rm = T)  # Median of family relation

# Mean value inserted in case of NAs where features are most likely the average
data.GP$traveltime[is.na(data.GP$traveltime)] <- mean(data.GP$traveltime, na.rm = T)  # Mean of Travel time
data.GP$freetime[is.na(data.GP$freetime)] <- mean(data.GP$freetime, na.rm = T)  # Mean of Free time

# Same is being done for MS
data.MS <- data %>% filter(school == "MS")  # seperate dataset for MS

# Median value inserted in case of NAs were features are most likely highest occurance
data.MS$Fedu[is.na(data.MS$Fedu)] <- median(data.MS$Fedu, na.rm = T)  # Median father's education
data.MS$famrel[is.na(data.MS$famrel)] <- median(data.MS$famrel, na.rm = T)  # Median of family relation

# Mean value inserted in case of NAs where features are most likely the average
data.MS$traveltime[is.na(data.MS$traveltime)] <- mean(data.MS$traveltime, na.rm = T)  # Mean of Travel time
data.MS$freetime[is.na(data.MS$freetime)] <- mean(data.MS$freetime, na.rm = T)  # Mean of Free time

# combining the data together to get back to the original data set with a few missing values imputed.
data <- rbind(data.GP, data.MS)

# Deleting records with missing values
data <- na.omit(data)  # 2 records deleted (397 and 398)

# soring based on column X (index numbers)
data <- data[order(data$X), ]

# Detecting outlier ------------------
# Using Z - scores
data.z.scores <- data %>% mutate(ageZScore = scale(age),
                                 MeduZScore = scale(Medu),
                                 FeduZScore = scale(Fedu),
                                 travelZScore = scale(traveltime),
                                 studyZScore = scale(studytime),
                                 failuresZScore = scale(failures),
                                 famrelZScore = scale(famrel),
                                 freetimeZScore = scale(freetime),
                                 gooutZScore = scale(goout),
                                 healthZScore = scale(health),
                                 absencesZScore = scale(absences),
                                 G1ZScore = scale(G1),
                                 G2ZScore = scale(G2),
                                 G3ZScore = scale(G3))

# Summary of the data
summary(data.z.scores)

# Removing outliers -------------------
data.z.scores <- data.z.scores %>% filter(ageZScore >= -3 & ageZScore <= 3
                                          & travelZScore >= -3 & travelZScore <= 3
                                          & failuresZScore >= -3 & failuresZScore <= 3
                                          & absencesZScore >= -3 & absencesZScore <= 3)

# Dropping the z scores columns and overwriting the result to data
data <- data.z.scores[, 1:32]


# Loading required library for plots -------------
require(ggplot2)

# finding out the relationship between going out and grade -----------------
result.goout <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(goout) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.goout
View(result.goout)

# Plot of the relation between going out and grade with error bars
result.goout %>%
  ggplot(aes(x = goout, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = goout,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")


# finding out the relationship between family size and grade -----------------------
result.famsize <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(famsize) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.famsize
View(result.famsize)

# Plot of the relation between family size and grade with error bars
result.famsize %>%
  ggplot(aes(x = famsize, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = famsize,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the relationship between family relationship quality and grade ------------------
result.famrel <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(famrel) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.famrel
View(result.famrel)

# Plot of the relation between family relationship quality and grade with error bars
result.famrel %>%
  ggplot(aes(x = famrel, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = famrel,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the relationship between travel time and grade ------------------
result.traveltime <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(traveltime) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.traveltime
View(result.traveltime)

# Plot of the relation between travel time and grade with error bars
result.traveltime %>%
  ggplot(aes(x = traveltime, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = traveltime,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the relationship between previous failures and success ---------------------
result.failures <-
  data %>% 
  mutate(success = ifelse(G3 >= 10, 1, 0), fail = ifelse(G3 < 10, 1, 0)) %>% 
  group_by(failures) %>% 
  summarise(success = sum(success), fail = sum(fail)) %>% 
  mutate(successRate = success/(success + fail))
# View result.failures
View(result.failures)
# plot result.failures
result.failures %>% 
  ggplot(aes(x = failures, y = successRate)) + geom_bar(stat = "identity")
