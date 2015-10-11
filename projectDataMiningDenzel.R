


#### Partitions the dataset into training and test data sets ######
divideDataSet <- function(orgData){
  set.seed(1618)
  testData <- sample(nrow(orgData),size=nrow(orgData)*0.8, replace = FALSE)
  trainData <- sample(nrow(orgData),size=nrow(orgData)*0.2,replace = FALSE)
  str(testData)
  str(trainData)
}

### myC45 function for iris####

myIrisC45 <- function(){
  library(RWeka)
  dataset <- divideDataSet(iris)
  fit <- J48(Species~.,data=dataset$testData)
}

### my c45 predict function for iris ####

