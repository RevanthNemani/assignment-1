# Student Performance Case Study (Clustering/Clasification)

- [Student Performance Case Study (Clustering/Clasification)](#student-performance-case-study-clusteringclasification)
  - [Step 1: Identify business problem](#step-1-identify-business-problem)
    - [Question 1: What are the problems that we are trying to solve in this assignment?](#question-1-what-are-the-problems-that-we-are-trying-to-solve-in-this-assignment)
    - [Question 2: What are the algorithms that could be used to solve each problem?](#question-2-what-are-the-algorithms-that-could-be-used-to-solve-each-problem)
  - [Step 2: Identify data sources and acquire data](#step-2-identify-data-sources-and-acquire-data)
  - [Step 3: Process/Clean data](#step-3-processclean-data)
    - [Question 3: Find the number of missing data for each feature.](#question-3-find-the-number-of-missing-data-for-each-feature)
    - [Question 4: What is the best way to deal with missing data (delete, calculate the average or the median, etc.)?](#question-4-what-is-the-best-way-to-deal-with-missing-data-delete-calculate-the-average-or-the-median-etc)
    - [Question 5: Using an outlier detection technique (such as scatter, Z-score, or Box Plot), find if there are any outliers in the data (give these outliers).](#question-5-using-an-outlier-detection-technique-such-as-scatter-z-score-or-box-plot-find-if-there-are-any-outliers-in-the-data-give-these-outliers)
  - [Step 4: Perform exploratory analysis](#step-4-perform-exploratory-analysis)
    - [Question 6: Discover the relationship between going out and the grades of students (in other words, does, for example, going out so often affect the results of the student?)](#question-6-discover-the-relationship-between-going-out-and-the-grades-of-students-in-other-words-does-for-example-going-out-so-often-affect-the-results-of-the-student)
    - [Question 7: Is there a relationship between family size and the result of students?](#question-7-is-there-a-relationship-between-family-size-and-the-result-of-students)
    - [Question 8: Does the quality of the family relationship affect students’ results? Explain your answer.](#question-8-does-the-quality-of-the-family-relationship-affect-students-results-explain-your-answer)
    - [Question 9: Does the school travel time affect students result? Explain your answer.](#question-9-does-the-school-travel-time-affect-students-result-explain-your-answer)
    - [Question 10: What type of relationship does exist between the previous failures and students’ results? (in other words, if a student previously failed does this mean he/she will pass?!)](#question-10-what-type-of-relationship-does-exist-between-the-previous-failures-and-students-results-in-other-words-if-a-student-previously-failed-does-this-mean-heshe-will-pass)
    - [Question 11: Do extra activities help to improve student performance?](#question-11-do-extra-activities-help-to-improve-student-performance)
    - [Question 12: Does internet home access help to improve student performance?](#question-12-does-internet-home-access-help-to-improve-student-performance)
    - [Question 13: What is the distribution of students who succeeded over the levels of free time?](#question-13-what-is-the-distribution-of-students-who-succeeded-over-the-levels-of-free-time)
    - [Question 14: What is the relationship between age and student result?](#question-14-what-is-the-relationship-between-age-and-student-result)
    - [Question 15: What is the relationship between address and student result?](#question-15-what-is-the-relationship-between-address-and-student-result)
    - [Question 16: What is the relationship between study time and student result?](#question-16-what-is-the-relationship-between-study-time-and-student-result)
    - [Question 17: Does absence affect student performance?](#question-17-does-absence-affect-student-performance)
    - [Question 18: Does health affect student performance?](#question-18-does-health-affect-student-performance)
    - [Question 19: Does mother and father education/job affect student result?](#question-19-does-mother-and-father-educationjob-affect-student-result)
  - [Step 5: Generate the model](#step-5-generate-the-model)
    - [Question 20: Give the useful variables to perform the clustering and classification. Remove the non-useful variables if there are any.](#question-20-give-the-useful-variables-to-perform-the-clustering-and-classification-remove-the-non-useful-variables-if-there-are-any)
    - [Question 21: Are there any features that we need to add to the dataset? Identify and add these features to the dataset?](#question-21-are-there-any-features-that-we-need-to-add-to-the-dataset-identify-and-add-these-features-to-the-dataset)
    - [Question 22: Is there any data needed to be normalized? What techniques of normalization could be used?](#question-22-is-there-any-data-needed-to-be-normalized-what-techniques-of-normalization-could-be-used)
  - [Step 6: Validate the model](#step-6-validate-the-model)
    - [part 1](#part-1)
    - [Question 23: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).](#question-23-do-the-clustering-based-on-these-features-with-k7-showcase-your-results-plot-of-clusters)
    - [Question 24: Calculate the within-cluster variation.](#question-24-calculate-the-within-cluster-variation)
    - [Question 25: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).](#question-25-do-the-clustering-based-on-these-features-with-k7-showcase-your-results-plot-of-clusters)
    - [Question 26: Calculate the within-cluster variation.](#question-26-calculate-the-within-cluster-variation)
    - [Question 27: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).](#question-27-do-the-clustering-based-on-these-features-with-k7-showcase-your-results-plot-of-clusters)
    - [Question 28: Calculate the within-cluster variation.](#question-28-calculate-the-within-cluster-variation)
    - [Question 29: Is this clustering better or worse than the previous ones? Explain your answer.](#question-29-is-this-clustering-better-or-worse-than-the-previous-ones-explain-your-answer)
    - [Question 30: Find the appropriate number of clusters (k) for the student performance data.](#question-30-find-the-appropriate-number-of-clusters-k-for-the-student-performance-data)
    - [part 2](#part-2)
    - [Question 31: Do the classification using KNN algorithm.](#question-31-do-the-classification-using-knn-algorithm)
    - [Question 32: Assess the performance of the model for different values of K (number of neighbors) using confusion-matrix and accuracy.](#question-32-assess-the-performance-of-the-model-for-different-values-of-k-number-of-neighbors-using-confusion-matrix-and-accuracy)
    - [Question 33: Find the best value of K.](#question-33-find-the-best-value-of-k)
    - [Question 34: Do the classification using SVM algorithm.](#question-34-do-the-classification-using-svm-algorithm)
    - [Question 35: Assess the performance of the model using confusion-matrix and accuracy.](#question-35-assess-the-performance-of-the-model-using-confusion-matrix-and-accuracy)
    - [Question 36: Compare the performance of SVM to the accuracy of KNN.](#question-36-compare-the-performance-of-svm-to-the-accuracy-of-knn)
    - [part 3](#part-3)
    - [Question 37: In order to answer this question, show the distribution of the results for each cluster. Explain the results.](#question-37-in-order-to-answer-this-question-show-the-distribution-of-the-results-for-each-cluster-explain-the-results)
  - [Step 7: Visualize results](#step-7-visualize-results)
    - [Question 38: Create graphs to present important results concluded from the previous step. Comment on those graphs.](#question-38-create-graphs-to-present-important-results-concluded-from-the-previous-step-comment-on-those-graphs)

<div style="page-break-after: always;"></div>

## Step 1: Identify business problem

### Question 1: What are the problems that we are trying to solve in this assignment?

**Solution 1:**

### Question 2: What are the algorithms that could be used to solve each problem?

**Solution 2:**

## Step 2: Identify data sources and acquire data

**Students' Comment:** The data provided is extracted, transformed and given to us on this assignment. This is far from real scenarios, where identifying the data sources is very crucial. Examples for this particular scenario:

1. Gabriel Pereira student database
1. Mousinho da Silveira database
1. Students school survey database
1. National Education Authority published datasets

After the identification and acquisition of data, we read it with the programming language of choice. We have selected R as our programming language with Rstudio as our IDE.

Our project structure is as follows:

```sh
        Assignment: Student Performance Case Study [Project folder] (/)
                |
                |______ assignment-1.Rproj
                |
                |______ assignment.R
                |
                |______ BDA-Assignment-2019.pdf
                |
                |______ data set.csv
                |
                |______ README.md
                |
                |
            Other files

```

Our R code to read the data will be:

```r
# Check if the project folder is our current directory
getwd()

# If this outputs a directory other than the project folder, set the working directory using `setwd()`

# Read the data set
data <- read.csv("data set.csv")
```

R Console Output

```r
> # Check if the project folder is our current directory
> getwd()
[1] "D:/Machine Learning/Assignment: Student Performance Case Study"
>
> # Read the data set
> data <- read.csv("data set.csv")
```

## Step 3: Process/Clean data

### Question 3: Find the number of missing data for each feature.

R code

```r
# counting NAs of each column

# We are applying the function of x defined as sum of na counts
# to each column and returning a matrix of counts of NAs in each column
sapply(data, function(x) sum(is.na(x)))
```

R Console Output

```r
> # counting NAs of each column
>
> # We are applying the function of x defined as sum of na counts
> # to each column and returning a matrix of counts of NAs in each column
> sapply(data, function(x) sum(is.na(x)))
         X     school        sex        age    address    famsize    Pstatus       Medu       Fedu       Mjob
         0          0          0          0          0          0          0          0          1          0
      Fjob     reason   guardian traveltime  studytime   failures  schoolsup     famsup       paid activities
         0          0          0          2          0          1          0          0          0          0
   nursery     higher   internet   romantic     famrel   freetime      goout     health   absences         G1
         0          0          0          0          1          1          0          1          0          1
        G2         G3
         0          1
```

**Solution 3:**

### Question 4: What is the best way to deal with missing data (delete, calculate the average or the median, etc.)?

**Solution 4:** There are many ways to deal with missing data, on a broad level the 3 are the most used: </br>

1. Delete the entire record. </br>
1. Create a seperate model to impute the missing data. </br>
1. Statistical methods like mean, median, mode, etc. </br>

The method to use really depends on the kind of data that is missing. Is it going to skew our results if some records were completly deleted? Or if there are lots of missing records and we assume a mean value for all those records, the deviations from the mean would be far less from the actual reality.

R Code

```r
# Find out all data with one or more NAs
data.incomplete <- data[!complete.cases(data), ]
```

In our scenario, the records with missing values is less (1.25% of the dataset)

As we are trying to predict performance, the records with no grades would be deleted. (Record 397 and 398)

For other missing records the following code should do the trick. We have used mean and median to impute some of the missing values as appropriate to the features.

R Code

```r
# split data between 2 schools and handle missing values.
require(dplyr)  # loading required library for filter and mutate functions

data.GP <- data %>% filter(school == "GP")  # seperate dataset for GP

# Median value inserted in case of NAs were features are most likely the highest occurance
data.GP$Fedu[is.na(data.GP$Fedu)] <- median(data.GP$Fedu, na.rm = T)  # Median father's education
data.GP$famrel[is.na(data.GP$famrel)] <- median(data.GP$famrel, na.rm = T)  # Median of family relation

# Mean value inserted in case of NAs where features are most likely the average
data.GP$traveltime[is.na(data.GP$traveltime)] <- mean(data.GP$traveltime, na.rm = T)  # Mean of Travel time
data.GP$freetime[is.na(data.GP$freetime)] <- mean(data.GP$freetime, na.rm = T)  # Mean of Free time

# Same is being done for MS
data.MS <- data %>% filter(school == "MS")  # seperate dataset for MS

# Median value inserted in case of NAs were features are most likely the highest occurance
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
```

R Console Output

```r
> # Find out all data with one or ore NAs
> data.incomplete <- data[!complete.cases(data), ]
>
> # split data between 2 schools and handle missing values.
> require(dplyr)  # loading required library for filter and mutate functions
>
> data.GP <- data %>% filter(school == "GP")  # seperate dataset for GP
>
> # Median value inserted in case of NAs were features are most likely highest occurance
> data.GP$Fedu[is.na(data.GP$Fedu)] <- median(data.GP$Fedu, na.rm = T)  # Median father's education
> data.GP$famrel[is.na(data.GP$famrel)] <- median(data.GP$famrel, na.rm = T)  # Median of family relation
>
> # Mean value inserted in case of NAs where features are most likely the average
> data.GP$traveltime[is.na(data.GP$traveltime)] <- mean(data.GP$traveltime, na.rm = T)  # Mean of Travel time
> data.GP$freetime[is.na(data.GP$freetime)] <- mean(data.GP$freetime, na.rm = T)  # Mean of Free time
>
> # Same is being done for MS
> data.MS <- data %>% filter(school == "MS")  # seperate dataset for MS
>
> # Median value inserted in case of NAs were features are most likely highest occurance
> data.MS$Fedu[is.na(data.MS$Fedu)] <- median(data.MS$Fedu, na.rm = T)  # Median father's education
> data.MS$famrel[is.na(data.MS$famrel)] <- median(data.MS$famrel, na.rm = T)  # Median of family relation
>
> # Mean value inserted in case of NAs where features are most likely the average
> data.MS$traveltime[is.na(data.MS$traveltime)] <- mean(data.MS$traveltime, na.rm = T)  # Mean of Travel time
> data.MS$freetime[is.na(data.MS$freetime)] <- mean(data.MS$freetime, na.rm = T)  # Mean of Free time
>
> # combining the data together to get back to the original data set with a few missing values imputed.
> data <- rbind(data.GP, data.MS)
>
> # Deleting records with missing values
> data <- na.omit(data)  # 2 records deleted (397 and 398)
>
> # soring based on column X (index numbers)
> data <- data[order(data$X), ]
```

### Question 5: Using an outlier detection technique (such as scatter, Z-score, or Box Plot), find if there are any outliers in the data (give these outliers).

**Solution 5:**

Using the z-scores we could remove all the outliers by filtering out all records where the z-scores are above 3 or below -3.

Formula:
$$
z-score =  \frac{(x - \mu)}{\sigma}
$$

R Code

```r
#Dectecting outlier
# Using z-scores
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
```

Output:

![dataset with z-scores](./Images/zscoresData.png)

![summary of the dataset with z-scores](./Images/zscoreSummary.png)

So clearly, features that have outliers based on z-scores are:

1. age
2. traveltime
3. failures
4. absences

Based on the z-scores 29 records will be dropped as they contain outliers

```r
# Removing outliers
data.z.scores <- data.z.scores %>% filter(ageZScore >= -3 & ageZScore <= 3
                                          & travelZScore >= -3 & travelZScore <= 3
                                          & failuresZScore >= -3 & failuresZScore <= 3
                                          & absencesZScore >= -3 & absencesZScore <= 3)

# Dropping the z scores columns and overwriting the result to data
data <- data.z.scores[, 1:32]
```

## Step 4: Perform exploratory analysis

### Question 6: Discover the relationship between going out and the grades of students (in other words, does, for example, going out so often affect the results of the student?)

**Solution 6:**

R Code:

```r
#loading required library for plots
require(ggplot2)

# finding out the relationship between going out and grades by adding a column `successRate`
result.goout <-
  data %>%
  mutate(success = ifelse(G3 >= 10, 1, 0), fail = ifelse(G3 < 10, 1, 0)) %>%
  group_by(goout) %>%
  summarise(success = sum(success), fail = sum(fail)) %>%
  mutate(successRate = success/(success + fail))
# View result.goout
View(result.goout)
# plot result.goout
result.goout %>%
  ggplot(aes(x = goout, y = successRate)) + geom_bar(stat = "identity")
```

Output:

![data of relationship between going out and grades](./Images/result.goout.png)

![histogram of relationship between going out and grades](./Images/result.gooutPlot.png)

From the histogram, we can safely say that as students go out more often their success Rate starts to decrease.

### Question 7: Is there a relationship between family size and the result of students?

**Solution 7:**

R Code:

```r
# finding out the relationship between family size and grades
result.famsize <-
  data %>%
  mutate(success = ifelse(G3 >= 10, 1, 0), fail = ifelse(G3 < 10, 1, 0)) %>%
  group_by(famsize) %>%
  summarise(success = sum(success), fail = sum(fail)) %>%
  mutate(successRate = success/(success + fail))
# View result.famsize
View(result.famsize)
# plot result.famsize
result.famsize %>%
  ggplot(aes(x = famsize, y = successRate)) + geom_bar(stat = "identity")
```

Output:

![data of relationship between family size and grades](./Images/result.famSize.png)

![histogram of relationship between family size and grades](./Images/result.famSizePlot.png)

From the histogram, we can see that a family size of less or equal to 3 has a slightly better success rate.

### Question 8: Does the quality of the family relationship affect students’ results? Explain your answer.

**Solution 8:**

### Question 9: Does the school travel time affect students result? Explain your answer.

**Solution 9:**

R Code:

```r
# finding out the relationship between family relationship quality and grades
result.famrel <-
  data %>%
  mutate(success = ifelse(G3 >= 10, 1, 0), fail = ifelse(G3 < 10, 1, 0)) %>%
  group_by(famrel) %>%
  summarise(success = sum(success), fail = sum(fail)) %>%
  mutate(successRate = success/(success + fail))
# View result.famrel
View(result.famrel)
# plot result.famrel
result.famrel %>%
  ggplot(aes(x = famrel, y = successRate)) + geom_bar(stat = "identity")
```

Output:

![data of relationship between family relationship and grades](./Images/result.famrel.png)

![histogram of relationship between family relationship and grades](./Images/result.famrelPlot.png)

We have too few data points on lower family relationship quality. But we can observe that success rates increase with higher family relationship quality.

### Question 10: What type of relationship does exist between the previous failures and students’ results? (in other words, if a student previously failed does this mean he/she will pass?!)

**Solution 10:**

### Question 11: Do extra activities help to improve student performance?

**Solution 11:**

### Question 12: Does internet home access help to improve student performance?

**Solution 12:**

### Question 13: What is the distribution of students who succeeded over the levels of free time?

**Solution 13:**

### Question 14: What is the relationship between age and student result?

**Solution 14:**

### Question 15: What is the relationship between address and student result?

**Solution 15:**

### Question 16: What is the relationship between study time and student result?

**Solution 16:**

### Question 17: Does absence affect student performance?

**Solution 17:**

### Question 18: Does health affect student performance?

**Solution 18:**

### Question 19: Does mother and father education/job affect student result?

**Solution 19:**

## Step 5: Generate the model

### Question 20: Give the useful variables to perform the clustering and classification. Remove the non-useful variables if there are any.

**Solution 20:**

### Question 21: Are there any features that we need to add to the dataset? Identify and add these features to the dataset?

**Solution 21:**

### Question 22: Is there any data needed to be normalized? What techniques of normalization could be used?

**Solution 22:**

## Step 6: Validate the model

### part 1

> For features: sex, age, address, Pstatus, Medu, Fedu, Mjob, Fjob, studytime, absences.

### Question 23: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Solution 23:**

### Question 24: Calculate the within-cluster variation.

**Solution 24:**

> For features: age, address, Fjob, traveltime, studytime, failures, and absences.

### Question 25: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Solution 25:**

### Question 26: Calculate the within-cluster variation.

**Solution 26:**

> For features: age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob,studytime, traveltime ,failures, internet, famrel, freetime, goout,health, absences.

### Question 27: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Solution 27:**

### Question 28: Calculate the within-cluster variation.

**Solution 28:**

### Question 29: Is this clustering better or worse than the previous ones? Explain your answer.

**Solution 29:**

### Question 30: Find the appropriate number of clusters (k) for the student performance data.

**Solution 30:**

### part 2

> features: age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob, studytime, traveltime, studytime, failures, internet, famrel, freetime, goout, health, absences,G1, G2, G3, Cluster. Where Cluster is the target feature.

### Question 31: Do the classification using KNN algorithm.

**Solution 31:**

### Question 32: Assess the performance of the model for different values of K (number of neighbors) using confusion-matrix and accuracy.

**Solution 32:**

### Question 33: Find the best value of K.

**Solution 33:**

### Question 34: Do the classification using SVM algorithm.

**Solution 34:**

### Question 35: Assess the performance of the model using confusion-matrix and accuracy.

**Solution 35:**

### Question 36: Compare the performance of SVM to the accuracy of KNN.

**Solution 36:**

### part 3

### Question 37: In order to answer this question, show the distribution of the results for each cluster. Explain the results.

**Solution 37:**

## Step 7: Visualize results

### Question 38: Create graphs to present important results concluded from the previous step. Comment on those graphs.

**Solution 38:**
