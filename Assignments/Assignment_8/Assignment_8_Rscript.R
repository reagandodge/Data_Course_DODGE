# At last, your assignment!

+ Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
+ Write a script that:
  1.  loads the "/Data/mushroom_growth.csv" data set
2.  creates several plots exploring relationships between the response and predictors
3.  defines at least 2 models that explain the **dependent variable "GrowthRate"**
  + One must be a lm() and 
+ one must be an aov()
4.  calculates the mean sq. error of each model
5.  selects the best model you tried
6.  adds predictions based on new values for the independent variables used in your model
7.  plots these predictions alongside the real data
+ Upload responses to the following as a numbered plaintext document to Canvas:
  1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.
2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link 
to at least one resource explaining how to deal with this in R


#1.
mush<-read.csv("../../../Data_Course/Data/mushroom_growth.csv")

#2: Predictor(explanatory, independent) variables on x-axis, Response variables on y-axis
# Light:Independent , Growth:Dependent 
# Temperature: Independent, Humidity:Dependent 

library(ggplot2)

ggplot(mush, aes(mush$Species , mush$GrowthRate ))+
  geom_point()+
  geom_smooth(method="lm")


ggplot(mush, aes(mush$Light , mush$GrowthRate ))+
  geom_point()+
  geom_smooth(method="lm")


ggplot(mush, aes(mush$Temperature , mush$GrowthRate ))+
  geom_point()+
  geom_smooth(method="lm")


ggplot(mush, aes(mush$Humidity , mush$GrowthRate ))+
  geom_point()+
  geom_smooth(method="lm")
  

ggplot(mush, aes(mush$Nitrogen , mush$GrowthRate))+
  geom_point()+
  geom_smooth(method="lm")


#3.define at least 2 models that explain the **dependent variable "GrowthRate"**
#+ One must be a lm() and 
#+ one must be an aov()


nit<-ggplot(mush, aes(mush$Nitrogen , mush$GrowthRate))+
  geom_point()+
  geom_smooth(method="lm")

nit2<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Humidity)

summary(nit2)

hum<- aov(GrowthRate ~ Humidity, data = mush)
summary(hum)
plot(mush$GrowthRate ~ mush$Humidity)




#4.  calculate the mean sq. error of each model

mean(residuals(nit2)^2) 
mean(residuals(hum)^2)


#5. selects the best model you tried


nit<-ggplot(mush, aes(mush$Nitrogen , mush$GrowthRate))+
  geom_point()+
  geom_smooth(method="lm")
nit
nit2<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Humidity)
summary(nit2) 

#6. adds predictions based on new values for the independent variables 
#used in your model

nit3<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Species)

summary(nit3)

nit4<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Temperature)

summary(nit4)

nit5<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Humidity)

summary(nit5)

nit6<-lm(data = mush, mush$Nitrogen ~ mush$GrowthRate * Light)

summary(nit6)

nit7<-lm(data = mush, mush$Temperature ~ mush$GrowthRate * Species)
summary(nit7)

nit8<-lm(data = mush, mush$Temperature ~ mush$GrowthRate * Humidity)

summary(nit8)

nit9<-lm(data = mush, mush$Nitrogen ~ mush$Temperature * Species)

summary(nit9)

nit10<-lm(data = mush, mush$Light ~ mush$GrowthRate * Nitrogen)

summary(nit10)

library(modelr)

predone<-add_predictions(mush, nit3)
predone
predtwo<-add_predictions(mush, nit4)
predtwo
predthree<- add_predictions(mush, nit5)
predthree

#7.  plots these predictions alongside the real data

ggplot(data = mush, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point() +
  stat_smooth(method = "lm", col = "red") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

install.packages("scatterplot3d")
library(scatterplot3d)

fit_1_sp <- scatterplot3d(mush$Nitrogen, 
                          mush$GrowthRate, mush$Temperature, angle = 60, 
                          color = "dodgerblue", pch = 1, 
                          ylab = "GrowthRate", xlab = "Nitrogen", zlab = "Temperature")



fit_2_sp <- scatterplot3d(mush$Nitrogen, 
                          mush$GrowthRate, mush$Spcies, angle = 60, 
                          color = "dodgerblue", pch = 1, 
                          ylab = "GrowthRate", xlab = "Nitrogen", zlab = "Species")


fit_3_sp <- scatterplot3d(mush$Nitrogen, 
                          mush$GrowthRate, mush$Humidity, angle = 60, 
                          color = "dodgerblue", pch = 1, 
                          ylab = "GrowthRate", xlab = "Nitrogen", zlab = "Humidity")

# used the first 3 predictors here 
# hmmmmmmm 
# ???????
# i tried 








