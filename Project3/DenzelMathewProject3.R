#### Load Packages ####
library(fpc)
library(cluster)
library(scatterplot3d)
library(rgl)
library(kknn)


#### Read in datasets ####
data1 <- read.csv("C:/Users/Denzel/Desktop/DataMining/Project3/dataset1.csv");
#data2 <- read.csv("C:/Users/Denzel/Desktop/DataMining/Project3/dataset2.csv");

##### Data1 density based cluster #####
densityBased <- function(){
  ds <- dbscan(data1,2,5);
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
  plot3d(data1$x, data1$y, data1$z, col = ds$cluster, size = 5)
}

##### Data1 distance based cluster ####
distanceBased <- function(){
  ds <- kmeans(data1, centers=4, nstart=10)
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
  plot3d(data1$x, data1$y, data1$z, col = ds$cluster, size = 5)
}

##### Data1 Graph Based Cluster ######
graphBased <- function(){
  ds <- specClust(data1, centers = 4, nn = 5, method = "symmetric")
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
  plot3d(data1$x, data1$y, data1$z, col = ds$cluster, size = 5)
}


############# Part 2 #################
part2 <- function(){
  data1[,1] <- data1[,1] * 4;
  data1[,2] <- data1[,2] * 2;
  ds <- kmeans(data1, centers=4, nstart=10)
  data1$cluster <- ds$cluster;
  scatterplot3d(data1,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
  plot3d(data1$x, data1$y, data1$z, col = ds$cluster, size = 5)
}


############ Part 3 #################
part3 <- function(){
  ds <- kmeans(data2, centers=5, nstart=50)
  data2$cluster <- ds$cluster;
  plot3d(data2$x, data2$y, data2$z, col = ds$cluster, size = 5)
  scatterplot3d(data2,type="p", xlab="x", ylab="y", zlab="z",box=TRUE);
}




