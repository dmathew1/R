library(RWeka)
library(caret)
library(oblique.tree)
library(e1071)

#Make sure the following packages are installed:
# 1. RWeka
# 2. caret
# 3. oblique.tree
# 4. e1071
# 5. BradleyTerry2


#LifeExpectancy variable
lifeExp <- read.csv("C:\\Users\\Denzel\\Desktop\\life_expectancy.csv")


#### Partitions the dataset into training and test data sets ######
divideDataSet <- function(orgData){
  set.seed(1618)
  testData <- orgData[sample(nrow(orgData),size=nrow(orgData)*0.2, replace = FALSE),]
  trainData <- orgData[sample(nrow(orgData),size=nrow(orgData)*0.8,replace = FALSE),]
  my_data <- list("train" = trainData, "test" = testData)
  return(my_data)
}

#################### IRIS FUNCTIONS #########################
myIrisC45 <- function(){
  dataset <- divideDataSet(iris)$train
  fit <- J48(Species~.,data=dataset)
  myC45predict(fit)
}

myC45predict <- function(fit){
  testData <- divideDataSet(iris)$test
  predictions <- predict(fit,testData)
  data <- summary(fit,newdata=testData,class=TRUE)
  stuff <- confusionMatrix(predictions, testData$Species)
  return(data)
}

myIrisRIPPER <- function(){
  dataset <- divideDataSet(iris)$train
  JRipFit <- JRip(Species~.,dataset)
  myC45predict(JRipFit)
}


myIrisOblique <- function(){
  dataset <- divideDataSet(iris)$train
  fit <- oblique.tree(Species~.,dataset,oblique.splits = "only")
  myIrisObliquePrediction(fit)
}

myIrisObliquePrediction <- function(fit){
  testData <- divideDataSet(iris)$test
  predictions <- predict(fit,testData)
  data <- summary(fit,newdata=testData,class=TRUE)
  return(data)
}

myIrisNaiveBayes <- function(){
  dataset <- divideDataSet(iris)$train
  fit <- naiveBayes(Species~.,dataset)
  myIrisNaiveBayesPrediction(fit)
}

myIrisNaiveBayesPrediction <- function(fit){
  testData <- divideDataSet(iris)$test
  predictions <- predict(fit,testData)
  stuff <- confusionMatrix(predictions, testData$Species)
  return(data)
}

myIrisKnn <- function(){
  dataset <- divideDataSet(iris)$train
  fit <- IBk(Species~.,dataset)
  myC45predict(fit)
}



######## My Life Expectancy ########

myLE.C45 <- function(){
  dataset <- divideDataSet(lifeExp)$train
  fit <- J48(dataset$Continent~.,data=dataset)
  myLE.C45Predict(fit)
}


myLE.C45Predict <- function(fit){
  testData <- divideDataSet(lifeExp)$test
  predictions <- predict(fit,testData)
  stuff <- confusionMatrix(predictions, testData$Continent)
  return(stuff)
}

myLE.RIPPER <- function(){
  dataset <- divideDataSet(lifeExp)$train
  fit <- JRip(dataset$Continent~.,data=dataset)
  myLE.C45Predict(fit)
}

myLE.Oblique <- function(){
  dataset <- divideDataSet(lifeExp)$train
  testData <- divideDataSet(lifeExp)$test
  fit <- oblique.tree(formula=Continent~., data=dataset[,3:8], oblique.splits="only")
  predictions <- predict(fit, testData[,3:8], type="class")
  stuff <- confusionMatrix(predictions, testData$Continent)
  return(stuff)
}

myLE.naiveBayes <- function(){
  dataset <- divideDataSet(lifeExp)$train
  fit <- naiveBayes(Continent~.,dataset)
  myLE.naiveBayesPrediction(fit)
}

myLE.naiveBayesPrediction <- function(fit){
  testData <- divideDataSet(lifeExp)$test
  predictions <- predict(fit,testData)
  stuff <- confusionMatrix(predictions, testData$Continent)
  return(stuff)
}

myLE.knn <- function(){
  dataset <- divideDataSet(lifeExp)$train
  fit <- IBk(Continent~.,dataset)
  myLE.C45Predict(fit)
}

removal <- function(){
  detach("package:RWeka",unload=TRUE)
  detach("package:caret",unload=TRUE)
  detach("package:oblique.tree",unload=TRUE)
  detach("package:e1071",unload=TRUE)
}