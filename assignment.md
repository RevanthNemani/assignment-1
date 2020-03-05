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

**Answer 1:**

### Question 2: What are the algorithms that could be used to solve each problem?

**Answer 2:**

## Step 2: Identify data sources and acquire data

**Students' Comment:** The data provided is extracted, transformed and given to us on this assignment. This is far from real scenarios, where identifying the data sources is very crucial. Examples for this particular scenario:

1. Gabriel Pereira student database
1. Mousinho da Silveira database
1. Students school survey database
1. National Education Authority published datasets

After the identification and acquisition of data, we read it with the programming language of choice. We have selected R as our programming language with Rstudio as our IDE.

Our project structure is as follows:

```{shell}
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

```

Our R code to read the data will be:

```{r}
# Check if the project folder is our current directory
getwd()

# Read the data set
data <- read.csv("data set.csv")
```

R Console Output

```{r}
> # Check if the project folder is our current directory
> getwd()
[1] "D:/Machine Learning/Assignment: Student Performance Case Study"
>
> # Read the data set
> data <- read.csv("data set.csv")
```

## Step 3: Process/Clean data

### Question 3: Find the number of missing data for each feature.

**Answer 3:**

### Question 4: What is the best way to deal with missing data (delete, calculate the average or the median, etc.)?

**Answer 4:**

### Question 5: Using an outlier detection technique (such as scatter, Z-score, or Box Plot), find if there are any outliers in the data (give these outliers).

**Answer 5:**

## Step 4: Perform exploratory analysis

### Question 6: Discover the relationship between going out and the grades of students (in other words, does, for example, going out so often affect the results of the student?)

**Answer 6:**

### Question 7: Is there a relationship between family size and the result of students?

**Answer 7:**

### Question 8: Does the quality of the family relationship affect students’ results? Explain your answer.

**Answer 8:**

### Question 9: Does the school travel time affect students result? Explain your answer.

**Answer 9:**

### Question 10: What type of relationship does exist between the previous failures and students’ results? (in other words, if a student previously failed does this mean he/she will pass?!)

**Answer 10:**

### Question 11: Do extra activities help to improve student performance?

**Answer 11:**

### Question 12: Does internet home access help to improve student performance?

**Answer 12:**

### Question 13: What is the distribution of students who succeeded over the levels of free time?

**Answer 13:**

### Question 14: What is the relationship between age and student result?

**Answer 14:**

### Question 15: What is the relationship between address and student result?

**Answer 15:**

### Question 16: What is the relationship between study time and student result?

**Answer 16:**

### Question 17: Does absence affect student performance?

**Answer 17:**

### Question 18: Does health affect student performance?

**Answer 18:**

### Question 19: Does mother and father education/job affect student result?

**Answer 19:**

## Step 5: Generate the model

### Question 20: Give the useful variables to perform the clustering and classification. Remove the non-useful variables if there are any.

**Answer 20:**

### Question 21: Are there any features that we need to add to the dataset? Identify and add these features to the dataset?

**Answer 21:**

### Question 22: Is there any data needed to be normalized? What techniques of normalization could be used?

**Answer 22:**

## Step 6: Validate the model

### part 1

> For features: sex, age, address, Pstatus, Medu, Fedu, Mjob, Fjob, studytime, absences.

### Question 23: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Answer 23:**

### Question 24: Calculate the within-cluster variation.

**Answer 24:**

> For features: age, address, Fjob, traveltime, studytime, failures, and absences.

### Question 25: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Answer 25:**

### Question 26: Calculate the within-cluster variation.

**Answer 26:**

> For features: age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob,studytime, traveltime ,failures, internet, famrel, freetime, goout,health, absences.

### Question 27: Do the clustering based on these features with k=7. Showcase your results (plot of clusters).

**Answer 27:**

### Question 28: Calculate the within-cluster variation.

**Answer 28:**

### Question 29: Is this clustering better or worse than the previous ones? Explain your answer.

**Answer 29:**

### Question 30: Find the appropriate number of clusters (k) for the student performance data.

**Answer 30:**

### part 2

> features: age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob, studytime, traveltime, studytime, failures, internet, famrel, freetime, goout, health, absences,G1, G2, G3, Cluster. Where Cluster is the target feature.

### Question 31: Do the classification using KNN algorithm.

**Answer 31:**

### Question 32: Assess the performance of the model for different values of K (number of neighbors) using confusion-matrix and accuracy.

**Answer 32:**

### Question 33: Find the best value of K.

**Answer 33:**

### Question 34: Do the classification using SVM algorithm.

**Answer 34:**

### Question 35: Assess the performance of the model using confusion-matrix and accuracy.

**Answer 35:**

### Question 36: Compare the performance of SVM to the accuracy of KNN.

**Answer 36:**

### part 3

### Question 37: In order to answer this question, show the distribution of the results for each cluster. Explain the results.

**Answer 37:**

## Step 7: Visualize results

### Question 38: Create graphs to present important results concluded from the previous step. Comment on those graphs.

**Answer 38:**
