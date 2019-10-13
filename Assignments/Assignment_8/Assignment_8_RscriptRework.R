
Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
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
  1.  Are any of your predicted response values from your best model scientifically meaningless? Explain. ### thnk about when 
# model numbers are outside of reality 
2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link 
to at least one resource explaining how to deal with this in R


shroom <- read.csv("../../../Data_Course/Data/mushroom_growth.csv")
glimpse(shroom)


modlight = aov(GrowthRate ~ Light * Species, data = shroom)
plot(shroom$GrowthRate ~ shroom$Light)
abline(modlight, col="Red")
summary(modlight)

modN = lm(GrowthRate ~ Nitrogen * Species, data = shroom)
plot(shroom$GrowthRate ~ shroom$Nitrogen)
abline(modN, col="Red")
summary(modN)


modHum<- lm(GrowthRate~Humidity * Species, data = shroom)
plot(shroom$GrowthRate ~shroom$Humidity)
abline(modHum, col= "Red")
summary(modHum) ### should this be an aov? 

# modHum as aov

modHumaov<- aov(GrowthRate~Humidity * Species, data = shroom)
plot(shroom$GrowthRate ~shroom$Humidity)
abline(modHum, col= "Red")
summary(modHum) 

modTemp<- lm(GrowthRate~ Temperature * Species, data = shroom)
plot(shroom$GrowthRate ~ shroom$Temperature)
abline(modTemp, col= "Red")
summary(modTemp)

### determining mse 
mean(residuals(modlight)^2)
mean(residuals(modN)^2)
mean(residuals(modHum)^2)
mean(residuals(modTemp)^2)
#### or determine using mse function
mse <- function(mod){mean(residuals(mod)^2)}
mse(modlight) # 6927.956 
mse(modN) # 9130.487
mse(modHum) # 6429.059
mse(modTemp) # 8868.286

# mse for modHum is the least. but so is light 
# modHum is the best model to use. 

df <- add_predictions(data = shroom,model = modHum)
glimpse(df)
plot(df$GrowthRate ~ df$Humidity)

df1<- add_predictions(data = shroom, model = modlight)

### plot real data against predicted data 

ggplot(df, aes(x=as.factor(Humidity), y=GrowthRate)) +
  geom_point() + facet_wrap(~Humidity) + geom_point(aes(y=pred), color = "Red") +
  labs(title = "Growth Rate as a Function of Light and Humidity", y="Growth Rate", x="Light")
       





