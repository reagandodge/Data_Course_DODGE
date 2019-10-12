

#1.  Create a new R script as part of your Assignment 4 R-project. Name it "Assignment_4.R"
#2.  That script should do the following:
 # + Read in the file: "/Data/ITS_mapping.csv"   ...good luck with that, hahaha!
 # + Somehow summarize all of the columns and do a bit of additional exploration (play with some functions)
#+ Make a boxplot where "Ecosystem"" is on the x-axis and "Lat" is on the y-axis
    + Write code to export this boxplot to a new file in your Assignment_4 directory called "silly_boxplot.png"
      Hints on below ...
#3.  Make sure to save your completed script and Rproject and make sure your png file is saved correctly
#4.  Push all these saved changes and new files onto your GitHub repository so I can grade them
#5.  Don't forget the plaintext file with answers to bolded questions needs to go to Canvas as well!      

df<-read.delim("../../../Data_Course/Data/ITS_mapping.csv") ### read.delim because read.csv won't read in data correctly 
# so don't spend hours trying to figure out how to separte data 



library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

names(df)
summary(df)
tbl_df(df) #### some NA values to deal with. 
str(df)


df$BarcodeSequence<- as.numeric(df$BarcodeSequence)
df$LinkerPrimerSequence<- as.numeric(df$LinkerPrimerSequence)
df$Host_Type<- as.numeric(df$Host_Type)
str(df)

df$Host [1:18 ]<- "NA"
df$Host [61:72] <- "NA"
df$Host [98:108]<- "NA"

### hm

boxplot(x= df$Ecosystem, y= df$Lat) ### wrong. 

class(df$Ecosystem)
class(df$Lat)
df$Lat<- as.numeric(df$Lat)
class(df$Lat)
df$Ecosystem<- as.numeric(df$Ecosystem)
class(df$Ecosystem)


png("../Assignment_4/silly_boxplot.png")

silly<-boxplot(x= df$Ecosystem, y=df$Lat, main= "Ecoystems vs. Latitude", xlab= "Ecosystem", ylab= "Latitude") ### changed ecosystem to numeric 

dev.off()

### not sure this is right either
