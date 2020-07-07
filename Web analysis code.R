library(readxl)
internet_dataset <- read_excel("C:/Users/Einstein/Desktop/Data Science/DataScience Projects/Data Science with R/internet_dataset.xlsx")
View(internet_dataset)

#Task1 
#Provide a summary for the team 
summary(internet_dataset) 
#Summary grouped by continent data 
by(internet_dataset,internet_dataset$Continent, summary) 
##Summary grouped by source group 
by(internet_dataset,internet_dataset$Sourcegroup, summary) 

#Task2 
cor(internet_dataset$Uniquepageviews,internet_dataset$Visits) 

#Task3 
anova<-aov(Exits~.,data = internet_dataset) 
summary(anova) 

#Task4 
anovatime<-aov(Timeinpage~.,data = internet_dataset) 
summary(anovatime)

#Task5 
internet_dataset$Bounces=internet_dataset$Bounces*0.01 
model<-glm(Bounces~Timeinpage+Continent+Exits+Sourcegroup+Uniquepageviews+Visits,data = internet_dataset,family = "binomial") 
#then returns a 2 warnings 
summary(model) 
#The end 