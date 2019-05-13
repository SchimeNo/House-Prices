####0. Libraries and directories####
pacman::p_load(DT, dplyr, caret, dplyr,
               ggplot2, lattice)

#setting up directory
current_path=getActiveDocumentContext()$path
setwd(dirname(current_path))
setwd("..")
rm(current_path)
list.files("datasets/")

#Loading the data

tests<- read.csv("./datasets/test.csv")
train<- read.csv("./datasets/train.csv")

#check the Column Names
colnames(train)

####1.SalePrice ANALYSIS####

summary(train$SalePrice)

#histogram and density plots
hist(train$SalePrice)
plot(density(train$SalePrice))
densityplot(~ SalePrice, data = train)
