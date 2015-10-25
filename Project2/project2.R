library(arules)

###### Read in Datasets #########
titanic <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//titanic.csv")
retail  <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//retail.csv")
GoT     <- read.csv("C://Users//Denzel//Desktop//DataMining//Project2//game_of_thrones.csv")


######  List all rules   #########
titanic_all <- apriori(titanic,parameter=list(support=0,confidence=0),
                       appearance=list(rhs=c("Survived=No","Survived=Yes"),
                                       default="lhs"));


#####   Filter out rules #########
titanic_filtered <- apriori(titanic,parameter=list(support=0.01,confidence=0.9),
                         appearance=list(rhs=c("Survived=Yes","Survived=No"),
                                         default="lhs"));


#####   Redundant Rules ########
subset.matrix <- is.subset(titanic_filtered,titanic_filtered)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
redundant <- colSums(subset.matrix,na.rm=T) >= 1
rules <- titanic_filtered[!redundant]

retailFunc <- function(){
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
redundant <- colSums(subset.matrix,na.rm=T) >= 1
retail_rules <- retail_filtered[!redundant]
return(inspect(retail_rules))
}












####### Game of Thrones ########


######  List all rules   #########
GoT_all <- apriori(titanic,parameter=list(support=0,confidence=0));


#####   Filter out rules #########
GoT_filtered <- apriori(titanic,parameter=list(support=0.01,confidence=0.9));

