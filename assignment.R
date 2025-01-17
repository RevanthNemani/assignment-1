# Check if the project folder is our current directory ------------------
getwd()

# Read the data set -------------------
data <- read.csv("data set.csv")


# counting NAs of each column ----------------------

# We are applying the function of x defined as the sum of na counts
# to each column and returning a matrix of counts of NAs in each column
sapply(data, function(x) sum(is.na(x)))

# Find out all data with one or ore NAs
data.incomplete <- data[!complete.cases(data), ]

# split data between 2 schools and handle missing values.-----------------
require(dplyr)  # loading required library for filter and mutate functions

data.GP <- data %>% filter(school == "GP")  # seperate dataset for GP

# Create the mode function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# mode value inserted in case of NAs were features are most likely highest occurance
data.GP$Fedu[is.na(data.GP$Fedu)] <- getmode(data.GP$Fedu)  # Mode father's education
data.GP$famrel[is.na(data.GP$famrel)] <- getmode(data.GP$famrel)  # Mode of family relation

# Mean value inserted in case of NAs where features are most likely the average
data.GP$traveltime[is.na(data.GP$traveltime)] <- mean(data.GP$traveltime, na.rm = T)  # Mean of Travel time
data.GP$freetime[is.na(data.GP$freetime)] <- mean(data.GP$freetime, na.rm = T)  # Mean of Free time

# Same is being done for MS
data.MS <- data %>% filter(school == "MS")  # seperate dataset for MS

# mode value inserted in case of NAs were features are most likely highest occurance
data.MS$Fedu[is.na(data.MS$Fedu)] <- getmode(data.MS$Fedu)  # mode father's education
data.MS$famrel[is.na(data.MS$famrel)] <- getmode(data.MS$famrel)  # mode of family relation

# Mean value inserted in case of NAs where features are most likely the average
data.MS$traveltime[is.na(data.MS$traveltime)] <- mean(data.MS$traveltime, na.rm = T)  # Mean of Travel time
data.MS$freetime[is.na(data.MS$freetime)] <- mean(data.MS$freetime, na.rm = T)  # Mean of Free time

# combining the data to get back to the original data set with a few missing values imputed.
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

# Plot of the relationship between travel time and grade with error bars
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

# finding out if extra activities help improve student performance ------------------
result.activities <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(activities) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.activities
View(result.activities)

# Plot of the relation between extra activities and grade with error bars
result.activities %>%
  ggplot(aes(x = activities, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = activities,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")


# finding out if home internet access help improve student performance ------------------
result.internet <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(internet) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.internet
View(result.internet)

# Plot of the relation between home internet access and grade with error bars
result.internet %>%
  ggplot(aes(x = internet, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = internet,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the free time distribution over and success cases ---------------------
result.freetime <-
  data %>%
  mutate(success = ifelse(G3 >= 10, 1, 0), fail = ifelse(G3 < 10, 1, 0)) %>%
  group_by(freetime) %>%
  summarise(success = sum(success), fail = sum(fail)) %>%
  mutate(successRate = success / (success + fail))
# View result.freetime
View(result.freetime)
# plot result.freetime
result.freetime %>%
  ggplot(aes(x = freetime, y = successRate)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5)

# finding out the relationship between age and student performance ------------------
result.age <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(age) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.age
View(result.age)

# Plot of the relation between home age access and grade with error bars
result.age %>%
  ggplot(aes(x = age, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = age,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")
# finding out the relationship between address and student performance ------------------
result.address <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(address) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.address
View(result.address)

# Plot of the relation between home address access and grade with error bars
result.address %>%
  ggplot(aes(x = address, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = address,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the relationship between study time and student performance ------------------
result.studytime <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(studytime) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.studytime
View(result.studytime)

# Plot of the relation between home study time access and grade with error bars
result.studytime %>%
  ggplot(aes(x = studytime, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = studytime,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# finding out the relationship between absences and student performance ------------------
result.absences <- data 

# Plot of the relation between home absences access and grade
result.absences %>%
  ggplot(aes(x = absences, y = G3)) +
  geom_point() +
  theme(legend.position = "none") +
  geom_smooth(method='lm', formula= y~x)

# Correaltion test
cor.test(x = data$absences, y = data$G3)

# finding out the relationship between health and student performance ------------------
result.health <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(health) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.health
View(result.health)

# Plot of the relation between home health access and grade with error bars
result.health %>%
  ggplot(aes(x = health, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = health,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# Correaltion test
cor.test(x = data$health, y = data$G3)

# finding out the relationship between mother, father education/job and student performance ------------------
result.parents <- data[, c(1, 8:11, 32)]

# correlation test mother's education
cor.test(result.parents$Medu, y = result.parents$G3)

# correlation test father's education
cor.test(result.parents$Fedu, y = result.parents$G3)

# Plot of the relation between the father's job and grade
result.Fjob <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(Fjob) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.Fjob
View(result.Fjob)

# Plot of the relation between Fjob and grade with error bars
result.Fjob %>%
  ggplot(aes(x = Fjob, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = Fjob,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")

# Plot of the relation between mothers' job and grades
result.Mjob <- data %>%
  mutate(sdG3 = G3) %>%
  group_by(Mjob) %>%
  summarise(G3 = mean(G3), sdG3 = sd(sdG3))

# View result.Mjob
View(result.Mjob)

# Plot of the relation between Mothers' job and grades with error bars
result.Mjob %>%
  ggplot(aes(x = Mjob, y = G3)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           alpha = 0.5) +
  geom_pointrange(aes(
    x = Mjob,
    y = G3,
    ymin = G3 - sdG3,
    ymax = G3 + sdG3,
    colour = "orange"
  )) +
  theme(legend.position = "none")


# Feature selection
data.fs <- data %>% transmute(X = X,
                           school = school,
                           sex = sex,
                           age = age,
                           address = address,
                           famsize = famsize,
                           Pstatus = Pstatus,
                           Medu = Medu,
                           Fedu = Fedu,
                           Mjob = Mjob,
                           Fjob =  Fjob,
                           studytime =  studytime,
                           traveltime =  traveltime,
                           failures =  failures,
                           internet =  internet,
                           famrel =  famrel,
                           freetime =  freetime,
                           goout =  goout,
                           health =  health,
                           absences =  absences,
                           G1 =  G1,
                           G2 =  G2,
                           G3 =  G3)

# Feature Engineering
# Label encoding
  # Feature Famsize
data.fs$famsize.encoded <- as.numeric(data.fs$famsize)
  # Feature internet
data.fs$internet.binary <- ifelse(data.fs$internet == "yes", 1, 0)

# Hot encoding
columns.to.one.hot.encode <-
  c("school", "sex", "address", "Pstatus", "Mjob", "Fjob")

for (i in columns.to.one.hot.encode) {
  x <- unique(data.fs[i])
  for (uv in levels(x[, 1])) {
    data.fs[paste(i, uv, sep = ".")] <- ifelse(data.fs[i][, 1] == uv, 1, 0)
  }
}

# data.fs summary
str(data.fs)

# Feature selected and engineered data set
data.final <- data.fs[, c(1, 4, 8, 9, 12:14, 16:43)]

# data.final summary
str(data.final)


# normalizing data
data.final.scaled <- data.final [, c(1:14, 16:35, 15)]

data.final.scaled[, c(2:34)] <- sapply(data.final.scaled[, c(2:34)], scale)

cor.matrix.data.final.scaled <- round(cor(data.final.scaled[, 2:35]), 3)


# Corellation matrix (plot)------------------------------------
# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}
reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}
# Reorder Correlation Matrix
cor.matrix.data.final.scaled <- reorder_cormat(cor.matrix.data.final.scaled)
upper_tri <- get_upper_tri(cor.matrix.data.final.scaled)

# Melt the correlation matrix
library(reshape2)
melted_cormat <- melt(upper_tri, na.rm = TRUE)
# Heatmap
library(ggplot2)
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed() +
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.6, 0.7),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))

# ------------------
set.seed(123)
data.select <- sample(1:nrow(data.final.scaled), size = nrow(data.final.scaled) * 0.7, replace = F)

data.train <- data.final.scaled[data.select, ]
data.test <- data.final.scaled[-data.select, ]



require(cluster)

# Part 1.1 ----------------

data.train.p1.1 <- data.final.scaled[, c(2:5, 12, 19:34)]
#data.test.p1.1 <- data.test[, c(2:5, 12, 19:34)]

cluster <- kmeans(x = data.train.p1.1, centers = 7)

clusplot(x = data.train.p1.1, cluster$cluster)


# within-cluster sum of square -------------------
(cluster$betweenss/cluster$totss) * 100



# Part1.2 ------------
data.train.p1.2 <- data.final.scaled[, c(2, 6, 9, 7, 12, 21, 22, 30:34)]

cluster <- kmeans(x = data.train.p1.2, centers = 7)

clusplot(x = data.train.p1.2, cluster$cluster, cex=1.0)

# within-cluster sum of square -------------------
(cluster$betweenss/cluster$totss) * 100


# Part 1.3 ----------------------

data.train.p1.3 <- data.final.scaled[, c(2:12, 15:16, 21:34)]
cluster <- kmeans(x = data.train.p1.3, centers = 7)
clusplot(x = data.train.p1.3, cluster$cluster, cex=1.0)

# within-cluster sum of square -------------------
(cluster$betweenss/cluster$totss) * 100


# Average silhouette for different values of K -------------------

# function to compute average silhouette for k clusters
avg_sil <- function(k) {
  km.res <- kmeans(data.train.p1.3, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(data.train.p1.3))
  mean(ss[, 3])
}

# Compute and plot wss for k = 2 to k = 30
k.values <- 2:30

# extract avg silhouette for 2-30 clusters
avg_sil_values <- purrr::map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

require(factoextra)
fviz_nbclust(data.train.p1.3, kmeans, method = "silhouette")

# trying k-means clustering with k = 2 ---------------
data.train.p1.3 <- data.final.scaled[, c(2:12, 15:16, 21:34)]
cluster <- kmeans(x = data.train.p1.3, centers = 2)
clusplot(x = data.train.p1.3, cluster$cluster, cex=1.0)

# within-cluster sum of square -------------------
(cluster$betweenss/cluster$totss) * 100


# Part 2 -----------------
# KNN
# Adding the predicted cluster to each student
data.final.scaled$cluster <- cluster$cluster
# normalising G3 Column as it is now a input
data.final.scaled$G3 <- scale(data.final.scaled$G3)
# spliting the dataset to training and testing sets
set.seed(123)
data.select <- sample(1:nrow(data.final.scaled), size = nrow(data.final.scaled) * 0.7, replace = F)

data.train <- data.final.scaled[data.select, ]
data.test <- data.final.scaled[-data.select, ]

# feature selection
data.train.p2 <- data.train[, c(2:16, 21:36)]
data.test.p2 <- data.test[, c(2:16, 21:36)]

data.train.p2[, -31] <- as.data.frame(sapply(data.train.p2[, -31], as.numeric))
data.test.p2[, -31] <- as.data.frame(sapply(data.test.p2[, -31], as.numeric))

data.train.p2$cluster <- as.factor(data.train.p2$cluster)
data.test.p2$cluster <- as.factor(data.test.p2$cluster)

require(class)
knn.7 <- knn(train = data.train.p2[, -31], test = data.test.p2[, -31], cl = data.train.p2[, 31], k = 7)
# Accuracy in %
100 * sum(data.test.p2[, 31] == knn.7)/NROW(data.test.p2[, 31])
require(caret)
# taking a union of all levels in test and training data set
u <- union(data.train.p2$cluster, data.train.p2$cluster)
t <- table(factor(knn.7, u), factor(data.test.p2$cluster, u))
confusionMatrix(t)

i=1
k.optm=1
for (i in 1:30){
  knn.mod <- knn(data.train.p2[, -31], test = data.test.p2[, -31], cl = data.train.p2[, 31], k=i)
  k.optm[i] <- 100 * sum(data.test.p2[, 31] == knn.mod)/NROW(data.test.p2[, 31])
  k=i
  cat(k,'=',k.optm[i],'
      ')
}

#Accuracy plot
plot(k.optm, type="b", xlab="K- Value",ylab="Accuracy level")

# k = 11
knn.11 <- knn(train = data.train.p2[, -31], test = data.test.p2[, -31], cl = data.train.p2[, 31], k = 11)
# Accuracy in %
100 * sum(data.test.p2[, 31] == knn.11)/NROW(data.test.p2[, 31])
require(caret)
# taking a union of all levels in test and training data set
u <- union(data.train.p2$cluster, data.train.p2$cluster)
t <- table(factor(knn.11, u), factor(data.test.p2$cluster, u))
confusionMatrix(t)


# SVM -------------------


