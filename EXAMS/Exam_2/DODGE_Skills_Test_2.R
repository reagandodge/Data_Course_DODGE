
library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)
library(modelr)

I. 	Simple tidying exercise

1.  Read in salaries.csv (needs some tidying)
This is faculty salary information from 1995 - Split up by university, state, faculty rank, and university tier
Faculty "Rank" progresses from "AssistProf" to "AssocProf" to "FullProf"

df<- read.csv("salaries.csv")

df.1<-gather(df, key = "Faculty_Rank", value = "Salary", c("AssistProf","AssocProf","FullProf"))


2.  Convert to a usable tidy format so we can look at "Salary" as a dependent variable (10 points)

glimpse(df.1)
class("Salary") 

df.1$Salary<- as.numeric(df.1$Salary)
glimpse(df.1) 

3.  Using ggplot, create boxplot of salary (y-axis) by University Tier (x-axis), filled by Faculty Rank (10 points)
x-axis = Tier
y-axis = Salary
Boxplot fill color = Rank
Title = "Faculty Salaries - 1995"

p1<- ggplot(df.1, aes(x= Tier, y= Salary,fill= Faculty_Rank))+
  geom_boxplot()+
  labs(title = "Faculty Salaries - 1995")

p1

4.  Export this delightful boxplot to a file named "LASTNAME_exam2_plot1.jpeg" (10 points)
ggsave("../Exam_2/DODGE_exam2_plot1.jpeg")


II. Linear modeling and predictions

1.  Read in atmosphere.csv (pretty clean data set)
These are observations of fungal diversity (number of different species) found in air samples along a time series
SampleID - The unique sample ID for the observation (dd-mm-YYYY)
Year - What do you think?
  Quarter - Q1 = Jan/Feb/Mar, Q2 = Apr/May/Jun, etc
#Month - This stands for "Magpie ovulation number..." no, it's just Month
        Mday - Day of the month
        BarcodeSequence - Not important
        Aerosol_Density - Number of detectable particles in the air sample per cubic cm
        CO2_Concentration - CO2 ppm on the day the sample was taken
        Diversity - Number of different fungal species found in the air sample
        Precip - Precipitation on the sampling day (mm)
        
        
dat<- read.csv("atmosphere.csv")        
glimpse(dat)       
        
        
 2.  Create three different linear models with Diversity as the dependent variable. The three models should have different
	predictors, or at least different numbers of predictors, with or without interaction terms. (10 points)
	

glimpse(dat)
	
mod1<- lm(Diversity~CO2_Concentration, data = dat)
summary(mod1)
#save this
mp1<-plot(dat$Diversity~dat$CO2_Concentration, data = dat)
abline(mod1, col= "Red")



mod2<- lm(data = dat, Diversity~Aerosol_Density * Precip)
summary(mod2)
#save this
mp2<- plot(dat$Diversity ~dat$Aerosol_Density, data= dat)
abline(mod2, col="Red")



mod3<-lm(data = dat, Diversity~Mday * Precip)
summary(mod3)
#save this 
mp3<- plot(dat$Diversity ~ dat$Mday, data = dat)
abline(mod3, col= "Red")

	
3. Compare the residuals of the three models and somehow document which has best explanatory power for the data (10 points)
    
mse <- function(mod){mean(residuals(mod)^2)}
mse(mod1) # 370504.3, lowest residual mean when compared to mod2 and mod3 thus mod1 has the best explanatory power. 
mse(mod2) # 40912.34
mse(mod3) # 43919.7

 
4.  Use all your models to predict Diversity values in the data set (10 points)

predmod1<-add_predictions(data=dat, mod1)

predmod2<- add_predictions(data = dat, mod2)

predmod3<- add_predictions(data= dat, mod3)



#nope. addpreds<- gather_predictions(dat, predmod1, predmod2, predmod3)




 5.Make a plot showing actual Diversity values, along with the three models predicted Diversity values.
Use color or some other aesthetic to differentiate the actual values and all three predictions (20 points)
Hint: gather_predictions()   ...wait, what is this magical function!? Maybe this hint should be for #4 ???


ggplot(predmod1,aes(x=CO2_Concentration,y=Diversity)) +
  geom_point() +
  geom_point(aes(y=predmod1$pred),color="Red")+
  geom_point(aes(y=predmod2$pred), color= "Blue")+
  geom_point(aes(y=predmod3$pred), color= "Yellow")











6.  Write code to show the predicted values of Diversity for each model using the hypothetical new data 
found in hyp_data.csv (10 points)


df.3<- read.csv("hyp_data.csv")

glimpse(df.3)

predict(mod1,newdata = df.3)
df.3$mod1pred <- predict(mod1,newdata = df.3)


predict(mod2,newdata = df.3)
df.3$mod2pred <- predict(mod2,newdata = df.3)

predict(mod3,newdata = df.3)
df.3$mod3pred <- predict(mod3,newdata = df.3)

7.  Export a text file that contains the summary output from *both* your models to "model_summaries.txt" (10 points)
(Hint: use the sink() function)


?sink
#thanks youtube


sink(file = "model_summaries.txt")
summary(mod1)
summary(mod2)
summary(mod3)
sink()


*Bonus*
  8.  Add these hypothetical predicted values (from hypothetical data - Part II, Step 6) to a plot of actual data 
and differentiate them by color. (10 bonus points possible for a pretty graph)

*Bonus*
  9.  Split the atmosphere.csv data into training and testing sets, randomly. Train your single best model on 50% of the data and 
test it on the remaining 50% of the data. Find some way to show how well it fits the data.
This is the only cross-validation part of the exam. (10 bonus points for proper code)


Push the following to your github web page in your new Exam_2 directory:
  1.  Your complete R script for ALL the above tasks, saved as LASTNAME_Skills_Test_2.R
2.  Your plot from Part I
3.  Any plots generated from Part II
4.  model_summaries.txt





