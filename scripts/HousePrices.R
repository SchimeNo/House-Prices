####0. Libraries and directories####
pacman::p_load(DT, dplyr, caret, dplyr, ggplot2, lattice, 
               rstudioapi, Hmisc, corrplot)

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

#High correlation variables
corr_names<-findCorrelation(corr, cutoff = .6, exact = TRUE, names = TRUE)
corr_high<- cor(train[corr_names])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#FE9929"))
corrplot(corr_high, method = "color", col = col(200), order = "hclust", number.cex = .7,
         addCoef.col = "black", tl.col = "black", tl.srt = 80, diag = FALSE)

# OverallQual', 'GrLivArea' and 'TotalBsmtSF' are strongly correlated with 'SalePrice'.
# 'GarageCars' and 'GarageArea' are also some of the most strongly correlated variables.
# we just need one of these  (we can keep 'GarageCars' since its correlation with 'SalePrice' is higher).

#scatter plot of the variables
plot(train[corr_names],  col  = rainbow(25) )
# between 'TotalBsmtSF' and 'GrLiveArea the dots draw a linear line, like a border


