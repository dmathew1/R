
##### Make sure arules is installed #####
library(arules)



###### Read in Datasets #########
titanic <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//titanic.csv")
retail  <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//retail.csv")
GoT     <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//Game_of_Thrones.csv")



                              ####### Titanic #######


######  List all rules   #########
titanic_all <- apriori(titanic,parameter=list(support=0,confidence=0),
                       appearance=list(rhs=c("Survived=No","Survived=Yes"),
                                       default="lhs"))


#####   Filter out rules #########
titanic_filtered <- apriori(titanic,parameter=list(support=0.01,confidence=0.9),
                         appearance=list(rhs=c("Survived=Yes","Survived=No"),
                                         default="lhs"));


#####   Redundant Rules ########
subset.matrix <- is.subset(titanic_filtered,titanic_filtered)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
titanic_redundant <- colSums(subset.matrix,na.rm=T) >= 1
titanic_unique <- titanic_filtered[!titanic_redundant]

##### Sort by life #####
titanic_sorted <- sort(titanic_unique,by="lift")





#######   Retail PreProcessing  #############
retail$TransactionNo <- NULL
retail <- sapply(retail,as.logical)


######  List all rules   #########
retail_all <- apriori(retail,parameter = list(support=0,confidence=0),
                           appearance = list(rhs=c("Beverage","PersonalCare","Meat"),
                                             default="lhs"));

#####   Filtered Rules  #########
retail_filtered <- apriori(retail,parameter = list(support=0.01,confidence=0.9),
                           appearance = list(rhs=c("Beverage","Meat","PersonalCare"),
                                             default="lhs"));


#####   Redundant Rules ########
subset.matrix <- is.subset(retail_filtered,retail_filtered)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
retail_redundant <- colSums(subset.matrix,na.rm=T) >= 1
retail_unique <- retail_filtered[!retail_redundant]


##### Sort by lift #########
retail_sorted <- sort(retail_unique,by="lift")




                                     ####### Game of Thrones ########

#######   GoT PreProcessing  #############
GoT <- GoT[,-1,drop=FALSE]
GoT$House <- as.factor(GoT$House)
GoT$Gender <- as.factor(GoT$Gender)
GoT$Survives <- as.factor(GoT$Survives)
GoT[3] <- sapply(GoT[3], as.logical)
GoT[,5:9] <- sapply(GoT[,5:9], as.logical)


######  List all rules   ########
GoT_all <- apriori(GoT,parameter = list(supp=0.1,confidence=0.1))



##### Filter rules  #######
GoT_filtered <- apriori(GoT,
                        parameter = list(support=0.01, confidence=0.9),
                        appearance = list(rhs=c("Survives=1"),
                                          default="lhs"))


##### Removing Redundant Rules #####
subset.matrix <- is.subset(GoT_filtered,GoT_filtered)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
GoT_redundant <- colSums(subset.matrix,na.rm=T) >= 1
GoT_unique <- GoT_filtered[!GoT_redundant]

##### Sorting by Lift #########
GoT_sorted <- sort(GoT_unique,by="lift")


################## TITANIC FUNCTIONS ########################
titanicAll <- function(){
  inspect(titanic_all)
}
titanicFiltered <- function(){
  inspect(titanic_filtered)
}
titanicSorted <- function(){
  inspect(titanic_sorted)
}

################## RETAIL FUNCTIONS ########################
retailAll <- function(){
  inspect(retail_all)
}
retailFiltered <- function(){
  inspect(retail_filtered)
}
retailSorted <- function(){
  inspect(retail_sorted)
}

################## SORTED FUNCTIONS ########################
GoTAll <- function(){
  inspect(GoT_all)
}
GoTFiltered <- function(){
  inspect(GoT_filtered)
}
GoTSorted <- function(){
  inspect(GoT_sorted)
}

#### Removes Arules package if installed ######
removal <- function(){
  detach("package:arules",unload=TRUE)
}