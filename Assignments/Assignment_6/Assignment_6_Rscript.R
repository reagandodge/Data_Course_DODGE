1.  loads the mtcars data set
2.  subsets the mtcars dataframe to include only **automatic transmissions**
3.  saves this new subset as a new file called "automatic_mtcars.csv" in your Assignment_5 directory
4.  plots the effect of horsepower on miles-per-gallon (update plot to have meaningful labels and title)
5.  saves this plot as a png image called "mpg_vs_hp_auto.png" in your Assignment_5 directory
6.  plots the effect of weight on miles-per-gallon (with improved labels, again)
7.  saves this second plot as a **tiff** image called "mpg_vs_wt_auto.tiff" in your Assignment_5 directory
8.  subsets the original mtcars dataframe to include only cars with displacements less than or equal to 200 cu.in.
9.  saves that new subset as a csv file called mtcars_max200_displ.csv
10. includes code to calculate the maximum horsepower for each of the three dataframes (original, automatic, max200)
11. prints these calculations (from task 10) in a readable format to a new plaintext file called hp_maximums.txt

data(mtcars)

View(mtcars)
?mtcars



mtcars1<- mtcars[ which(mtcars$am == "0"),]

write.csv(mtcars, file = "../Assignment_6/automatic_mtcars.csv")
### check it
df1<- read.csv("../Assignment_6/automatic_mtcars.csv")

library(ggplot2)

png("../Assignment_6/mpg_vs_hp_auto.png")

ggplot(mtcars, aes(x= mtcars$hp, y= mtcars$mpg, col= mpg))+
  geom_point()+
  geom_smooth(method = "lm")+
  labs(title = "Effect of Horsepower on miles/gallon",
       x= "horsepower",
       y= "mpg")
dev.off()


?tiff

tiff("../Assignment_6/mpg_vs_wt_auto.tiff", units="in", width=5, height=5, res=300)

ggplot(mtcars, aes(x= mtcars$wt, y= mtcars$mpg, col= mpg))+
  geom_point()+
  geom_smooth(method = "lm")+
  labs(title = "Effect of weight on miles/gallon",
       x= "weight",
       y= "mpg")

dev.off()


data(mtcars)
mtcars2<- subset(mtcars, disp <= 200) 
####or 
####mtcars2<- mtcars[ which(mtcars$disp <= 200),]
write.csv(mtcars1, file = "mtcars_max200_displ.csv")

#check it 
df<-read.csv("../Assignment_6/mtcars_max200_displ.csv")


library(dplyr)


#original
maxhp<-mtcars %>%
  summarise(maxhorsepower=max(hp))

#automatic
maxhp1<- mtcars1 %>%
  summarise(maxhorsepower1=max(hp))
#max200
maxhp2<- mtcars2 %>%
  summarise(maxhorsepower2= max(hp))



maxhp<-as.numeric(maxhp)
class(maxhp)

maxhp1<- as.numeric(maxhp1)
class(maxhp1)


maxhp2<- as.numeric(maxhp2)
class(maxhp2)

all<- c(maxhp, maxhp1, maxhp2)

View(all)


write.table(all, file= "../Assignment_6/hp_maximum.txt", sep = ",", quote = FALSE)
names(all)<-c("Original", "Automatic", "Max200")






