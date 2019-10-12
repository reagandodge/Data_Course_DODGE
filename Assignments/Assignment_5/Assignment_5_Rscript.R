data("iris")
View(iris)
library(ggplot2)

#### simple scatter plot with linear regression line 


png("../Assignment_5/iris_fig1.png")

ggplot(iris, aes(x= Sepal.Length, y= Petal.Length, col= Species))+
  geom_point()+
  geom_smooth(method = lm)+
  labs(title = "Sepal Length vs petal length",
       subtitle = "for three iris species")
dev.off()

#### Density plot 

png("../Assignment_5/iris_fig2.png")

ggplot(iris, aes(Petal.Width, fill= Species))+
  geom_density(alpha= .5)+
  labs(title = "Distribution of Petal Widths",
       subtitle = "for three iris species",
       x= "Petal Width")

dev.off()

### boxplot 
### sepal to petal width ratio....
### make a new "ratio" column between petal and sepal widths? 

iris$Ratio <- with(iris, Petal.Width / Sepal.Width)


png("../Assignment_5/iris_fig3.png")

ggplot(iris, aes(x=Species, y=Ratio, fill=Species)) +
  geom_boxplot() +
  labs(title = "Sepal- to Petal-Width Ratio", 
       x="Species",
       y="Ratio of Sepal Width to Petal Width", 
       subtitle = "for three iris species")


dev.off()


#### diverging bars... this was freaking tough 

### find mean of sepal length 
meansepal<-mean(iris$Sepal.Length)

### find the difference between the normal sepal lengths and the mean of sepal length?
dev <-iris$Sepal.Length - mean(iris$Sepal.Length)
### create new column with this info
iris$dev <- dev

iris$id <- factor(1:nrow(iris), levels = 1:nrow(iris)) 
 

png("../Assignment_5/iris_fig4.png")

ggplot(iris, aes(x=reorder(id, dev), y=dev,fill=Species)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme(axis.text.y.left = element_blank(), axis.title.y = element_blank(), axis.ticks = element_blank()) +
  labs(title = "Sepal Length Deviance from the Mean of all Observations", 
       caption = "Note: Deviance = Sepal.Length - mean(Sepal.Length)", y = "Deviance from the Mean")

dev.off()




