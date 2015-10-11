


#### Partitions the dataset into training and test data sets ######
divideDataSet <- function(orgData){
  set.seed(6542)
  testData <- orgData[sample(nrow(orgData),size=nrow(orgData)*0.2, replace = FALSE),]
  trainData <- orgData[sample(nrow(orgData),size=nrow(orgData)*0.8,replace = FALSE),]
  my_data <- list("train" = trainData, "test" = testData)
  return(my_data)
}

### myC45 function for iris####
myIrisC45 <- function(){
  library(RWeka)
  dataset <- divideDataSet(iris)$train
  fit <- J48(Species~.,data=dataset)
  myC45predict(fit)
}

### my c45 predict function for iris ###
myC45predict <- function(fit){
  library(RWeka)
  testData <- divideDataSet(iris)$test
  predictions <- predict(fit,testData)
  summary(fit,newdata=testData,class=TRUE)
  #table(predictions)
}

#### my iris RIPPER  ######
myIrisRIPPER <- function(){
  library(RWeka)
  dataset <- divideDataSet(iris)$train
  JRipFit <- JRip(Species~.,dataset)
  myC45predict(JRipFit)
}


### My Iris Oblique #####
myIrisOblique <- function(){
  library(oblique.tree)
  dataset <- divideDataSet(iris)$train
  ObliqueShit <- oblique.tree(Species~.,dataset)
  myC45predict(ObliqueShit)
}

### My Iris Naive Bayes ####
myNaiveBayes <- function(){
  library(e1071)
  dataset <- divideDataSet(iris)$train
  naiveShit <- naiveBayes(Species~.,dataset)
  myC45predict(naiveShit)
}



