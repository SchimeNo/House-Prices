####0. Libraries and directories####
pacman::p_load(rstudioapi, shiny, shinydashboard, DT, dplyr, ggplot)

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
