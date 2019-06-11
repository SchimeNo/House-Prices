####0. Libraries and directories####
pacman::p_load(DT, dplyr, caret, dplyr, ggplot2, lattice, 
               rstudioapi, Hmisc)

#setting up directory
current_path=getActiveDocumentContext()$path
setwd(dirname(current_path))
setwd("..")
rm(current_path)
list.files("datasets/")

#Loading the data
train<- read.csv("./datasets/train.csv")
test<- read.csv("./datasets/test.csv")


####1.SalePrice ANALYSIS####
#check the Column Names
colnames(train)
summary(train$SalePrice)

#histogram and density plots
hist(train$SalePrice)
plot(density(train$SalePrice))
densityplot(~ SalePrice, data = train)


#Relationship with numerical variables

#GrLivArea
ggplot(train, aes(x=GrLivArea, y=SalePrice)) +
  geom_point(size=1, shape=21) +
  geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95)

#TotalBsmtSF
ggplot(train, aes(x=TotalBsmtSF, y=SalePrice)) +
  geom_point(size=1, shape=21) +
  geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95)


#Relationship with categorical features

#OverallQual
boxplot(SalePrice~OverallQual,data=train, col=train$OverallQual, notch=TRUE)
#YearBuilt
boxplot(SalePrice~YearBuilt,data=train, col=train$YearBuilt, notch=TRUE)


#Correlation matrix 

#sapply(train, class)
train[is.na(train)] <- 0
corr<- train %>% select_if(is.numeric) %>%  cor()
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(corr, col=col, symm=TRUE, na.rm=TRUE, Rowv = NA)
