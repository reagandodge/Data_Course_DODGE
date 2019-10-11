library(modelr)
library(ggplot2)


lm(height~ country + parentheight + sex + nutrition) ### these factors can tell us how 
#well we can predict height. this is a model of height 
lm(height ~ age+ gender+ parentheight) ###  how do we know which one is the best one? 
# we can build models that explain. and compare which models are best. 



data("mtcars")

df = mtcars
names(df)


ggplot(df, aes(x=disp,y=mpg)) + ### mpg is our dependent variable where all others explain it 
  geom_point() + geom_smooth(method = "lm") ### this model is wrong because its not cathcing everything. 

mod1 <- lm(data=df,mpg~disp) ### models take the form of lm tell it the data, dependent~ independent 
summary(mod1)


ggplot(df, aes(x=disp,y=mpg)) +
  geom_point() + geom_smooth(method = "lm",formula = y ~ poly(x,2)) ## adding a formula for the smoothing line
#will give us the polynomial version to the second order. (curve line fitted to a linear model)

?poly
# "over-fitting is when your model is picking up the noise instead of the signal"

mod2 = lm(data=df,mpg~poly(disp,2)) # second order polynomial 
mod3 = lm(data=df,mpg~poly(disp,3)) # third order polynomial 

summary(mod1) #y= 29.59 - .04x
summary(mod2)
summary(mod3)# y= 20.0906- 28.44x +9.1524X^2 - 9.7446x^3


### how do we which model is best. which predicitors fall colsest to the lm line. 

# mean squared error function
mse <- function(mod){mean(residuals(mod)^2)} ### we can make functions the exact way we want them 

# use it to calculate how well the data fit each of our models
mse(mod1) # on average this is about 10 mpg worng 
mse(mod2)# abou 7 wrong 
mse(mod3)# about 4 wrong 

# so we know that model 3 is the best omdel 


# use the "best" model to generate predictions

?add_predictions

df2 <- add_predictions(data = df,model = mod3) # our data is df and the model we want tomake predidctions on is mod3

# this will give us a new column by taking the eqatuion from that linear model and used the predictors that we fed it. 

# how well did it do ?

abs(df2$mpg- df2$pred) ### do abs so we dont have negative numbers 
### plot 
plot(x=abs(df2$mpg - df2$pred), y= df$mpg)


ggplot(df2,aes(x=disp,y=mpg)) +
  geom_point() +
  geom_point(aes(y=pred),color="Red")

#### this is how plot our actual data with our predicted data 


# predict mpg based on new arbitrary disp values... predicting for other variables that arent in our data set 
new_disp <- data.frame(disp = c(0,5,10,20,30,40,250)) #### predict wants a data frame . we chose these values becuase they are outside our orginal data frame values for disp

predict(mod3,newdata = new_disp) #  predict use model 3 and use this new data and returns to us mpg
new_disp$mpg <- predict(mod3,newdata = new_disp)
# newdata must have columns with same names as used in your model!

ggplot(new_disp, aes(x=disp, y=mpg))+
  geom_point() #### notice how this plot doesnt tell us anything 


# add these predictions to the main data frame
library(tidyr)
library(tidyverse)

df3 <- df2 %>% 
  select(mpg,disp) %>%
  rbind(new_disp) %>%
  mutate(Source = c(rep("Observed",32),rep("Predicted",7)))

ggplot(df3,aes(x=disp,y=mpg)) + geom_point()

ggplot(df3,aes(x=disp,y=mpg)) + 
  geom_smooth(method = "lm",se=FALSE,formula = y~poly(x,3)) +
  geom_point(aes(color=Source),size=3) +
  scale_color_manual(values = c("Black","Red")) +
  labs(title = mod3$call)
  
mod3$call
mod3$coefficients
summary(mod3)


summary(mod3)





# how to train a model properly ####

# divide your data into random subsets:
# train your model on one subset, test your model on the other!

install.packages("caret",dependencies = TRUE)

library(caret)

set.seed(123)

trainingsamples <- createDataPartition(mtcars$mpg,p=0.5,list=FALSE)

train <- mtcars[trainingsamples,]

test <- mtcars[-trainingsamples,]

mod5 <- lm(data = train,mpg ~ poly(disp,3))
df4<-add_predictions(test,mod5)

#### plotting more real data with predicited data 
ggplot(df4,aes(x=disp,y=mpg)) +
  geom_point() +
  geom_point(aes(y=pred),color="Red")+
  geom_smooth(method= "lm", formula= y~poly(x,3))

# why arent the predicited values right on the line?
#because we used random numbers vs the the first time we trained our model. 
# here we trained the data for the first half of the data and then based our points on new data 
# our model hadnt seen before
# the line is based on using the other half of the data nd testing it on the other half of the data 
# we split the data in half to see that the predictions arent 100%
# we are testing our model on data our model hasnt seen before 

mse(mod5) # lets check accuracy 

df4


mod6<- lm(data= df, mpg~ poly(disp, 3) + cyl) # disp is an x value to consider, cyl is too. to change slope we mutiply see mod7

mse(mod6) ### mse (mean square error) shows the accuracy. lower then number the better the model is at explaining our variables 


mod7<- lm(data=df, mpg~poly(disp, 3)* cyl) ### a smaller mse because we are accouting for more variables. we allow the slope the change for each instant of cyl 
mse(mod7)


df6<-add_predictions(df, mod6)

df7<- add_predictions(df, mod7)

ggplot(df6, aes(x=disp, y=mpg, color= factor(cyl)))+
  geom_point()+geom_smooth(method= "lm", formula = y~ poly(x,3)+x)


ggplot(df7, aes(x=disp, y=mpg, color= factor(cyl)))+
  geom_point()+geom_smooth(method= "lm")







