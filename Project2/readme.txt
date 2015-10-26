Denzel Mathew Individual Project 2

1. Make sure the following package is installed:
install.packages("arules")



Please load the entire script before running any of the following variables.


Important Variables:
titanic -------> variable that holds the path to the titanic csv (**** PLEASE CHANGE THE CSV PATH BEFORE LOADING ****)
retail -------> variable that holds the path to the retail csv (**** PLEASE CHANGE THE CSV PATH BEFORE LOADING ****)
GoT -------> variable that holds the path to the game_of_thrones csv (**** PLEASE CHANGE THE CSV PATH BEFORE LOADING ****)

titanic_all     --> holds the entire set of rules for titanic
titanic_filtered --> holds the filtered set of rules (supp = 0.01, conf = 0.9) for titanic
titanic_sorted  --> holds the sorted set of rules from filtered (sorted by lift) for titanic

retail_all     --> holds the entire set of rules for retail
retail_filtered --> holds the filtered set of rules (supp = 0.01, conf = 0.9) for retail
retail_sorted  --> holds the sorted set of rules from filtered (sorted by lift) for retail

GoT_all     --> holds the entire set of rules with supp=0.1 and conf = 0.1 for GoT
GoT_filtered --> holds the filtered set of rules (supp = 0.01, conf = 0.9) for GoT
GoT_sorted  --> holds the sorted set of rules from filtered (sorted by lift) for GoT


##### Titanic Functions #####
1. titanicAll() -----> inspects the titanic_all variable which holds the entire rule set for the titanic dataset
2. titanicFiltered() ----> inspects the titanic_filtered variable which holds the filtered conditions on the data set
3. titanicSorted() ----> inspects the titanic_sorted variable which sorted the titanic_filtered based on lift

##### Retail Functions #####
1. retailAll() -----> inspects the retail_all variable which holds the entire rule set for the retail dataset
2. retailFiltered() ----> inspects the retail_filtered variable which holds the filtered conditions on the data set
3. retailSorted() ----> inspects the retail_sorted variable which sorted the retail_filtered based on lift

##### Game of Thrones Functions #####
1. GoTAll() -----> inspects the GoT_all variable which holds the entire rule set with supp =0.1 and conf = 0.1 as RStudios breaks for 0 and 0 respectively for the game_of_thrones dataset
2. GoTFiltered() ----> inspects the GoT_filtered variable which holds the filtered conditions on the data set
3. GoTSorted() ----> inspects the GoT_sorted variable which sorted the GoT_filtered based on lift