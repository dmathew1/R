#### Load Packages ####
library(fpc)
library(cluster)
library(scatterplot3d)
library(MCL)


#### Read in datasets ####
data1 <- read.csv("/Users/denzel/Documents/R/Project3/dataset1.csv");
data2 <- read.csv("/Users/denzel/Documents/R/Project3/dataset2.csv");

##### Data1 density based cluster #####
densityBased <- function(){
  ds <- dbscan(data1,2,5);
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}

##### Data1 distance based cluster ####
distanceBased <- function(){
  ds <- kmeans(data1, centers=4, nstart=10)
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}


#### Data1 graph based cluster ####
graphBased <- function(){
  ds <- mcl(data1, addLoops = TRUE, expansion = 2, inflation = 2, allow1 = FALSE,
      max.iter = 100, ESM = FALSE)
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}


############# Part 2 #################
part2 <- function(){
  data1[,1] <- data1[,1] * 4;
  data1[,2] <- data1[,2] * 2;
  ds <- kmeans(data1, centers=4, nstart=10)
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}


############ Part 3 #################
part3 <- function(){
  ds <- kmeans(data2, centers=5, nstart=50)
  data2$cluster <- ds$cluster;
  #summary(data2);
  scatterplot3d(data2,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}




