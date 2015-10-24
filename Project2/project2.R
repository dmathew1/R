library(arules)

###### Read in Datasets #########
titanic <- read.csv("C://Users//Denzel//Desktop//titanic.csv")
retail  <- read.csv("C://Users//Denzel//Desktop//retail.csv")
GoT     <- read.csv("C://Users//Denzel//Desktop/game_of_thrones.csv")


######  List all rules   #########
titanic_all <- apriori(titanic,parameter=list(support=0,confidence=0));


#####   Filter out rules #########
titanic_filtered <- apriori(titanic,parameter=list(support=0.01,confidence=0.9));


#####   Redundant Rules ########
subset.matrix <- is.subset(titanic_filtered,titanic_filtered)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
redundant <- colSums(subset.matrix,na.rm=T) >= 1
rules <- titanic_filtered[!redundant]
inspect(rules);


####### Game of Thrones ########


######  List all rules   #########
GoT_all <- apriori(titanic,parameter=list(support=0,confidence=0));


#####   Filter out rules #########
GoT_filtered <- apriori(titanic,parameter=list(support=0.01,confidence=0.9));

