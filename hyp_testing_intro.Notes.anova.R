# Hypothesis testing

library(ggplot2)
library(tidyr)
library(dplyr)

# T-Test ####

# make 3 fake variables with random values from normal distributions

# if we wanted these to be the same each time we ran the code we would have to set seed 

?rnorm
x=rnorm(100)   ### gives a 100 numbers around 0 with a normal dist. centered around x 
y=rnorm(100)
z=rnorm(100,5,.5) ### 100 random numbers with a mean of 5 and a SD of .5

# build a plottable data frame
df = data.frame(x,y,z)
df = gather(df,key = Var,value = Value,1:3)

# plot density (shape of distribution)
ggplot(df,aes(x=Value,fill=Var)) +
  geom_density(alpha=.5)

### notice how similar x and y are. it can be determined that they are probably from the same distrubution. 
### z is not from the same distribution. we use t.tests to determine this 


# t-tests to determine whether the samples likely came from the same distributions
# t.test(vector1, vector2)
t.test(x,y)
t.test(x,z) ### due to the p value i am pretty sure the alternative hypthesis is correct. 

#null hypothesis
#alternative hypthesis : true difference in means is not equal to 0 ie i failed to disprove these came from the same distribution. 
#hypothesis 




# correlation between 2 variables ####

count = c(9,25,15,2,14,25,24,47)
speed = c(2,3,5,9,14,24,29,34)

ggplot(mapping = aes(x=count,y=speed)) +
  geom_point() +
  geom_smooth(method = "lm",se=FALSE)

# correlation coefficients cor gives you the correlation coefficient 
cor(count, speed)
cor(count, speed, method = 'spearman') ### spearman is kind of method to determine correlation 
### both of these are right forms of correlation it only shows us how correlated 



# test for significance
cor.test(count,speed)
### the p value is smaller than .05 so there is significance. we can also add method = spearman if we wanted here 


### CORRELATION DOES NOT EQUAL CAUSATION 


# ANOVA ####

data("iris")

# 1-way anova, special case of linear model but works with cateragorical data 
mod.aov = aov(data=iris, Sepal.Length ~ Species)
summary(mod.aov)
# based on the p value we can determine between sepal.length and species theres a difference 
# p value = i found a difference and its this number  based on species 




#ANCOVA, analysis of co-variance. we can blend our models together to see if variables co-vary with other variables 

mod.acv = aov(data = iris, Sepal.Length ~ Species + Petal.Length)
summary(mod.acv)
TukeyHSD(mod.acv) ### notice the warning message here. petal length is not a factor here so Tukey drops it.
# it cant give us how petal length effects sepal length. so how would we see this?
# go back to ggplot!

ggplot(iris, aes(x= Petal.Length, color = Species, y= Sepal.Length))+
  geom_point()+
  geom_smooth(method= "lm")

# a one way anova is a linear model. here see the lm for each species 

# compare two models using analysis of variance 
anova(mod.aov,mod.acv)


# Multiple comparisons ####

TukeyHSD(mod.aov) ### this is how you find the difference betweens anovas with categorical data 
plot(TukeyHSD(mod.aov))

### if the p value is low, variables are different from eachother. if p value if zero, we report it as "p value is less than .05"

df
aov2<-aov(data = df, Value ~ Var)
TukeyHSD(aov2)
plot(TukeyHSD(aov2))
## notice how y-x hovers around zero on this plot. 
##this means y-x are not significant. notice the p value for y-x as well.
##not significant 



#more tests

wilcox.test() 

kruskal.test()

vegan:: adonis()






