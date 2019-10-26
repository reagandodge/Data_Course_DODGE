library(datasets)
data("iris")
iris
library(dplyr)
tbl_df(iris)


glimpse(iris)
View(iris)



iris %>% 
  group_by(Species) %>%
  summarise(avg= mean(Sepal.Width)) %>%
  arrange(avg)


library(tidyr)
library(readxl)

dat<- read.csv("../../../../Data_Course/Data/Utah_Religions_by_County.csv")
dat
tbl_df(dat)

dat2 <- read_xls("../../../../Data_Course/Data/Utah_Religions_by_County.xlsx")




data("iris")
tbl_df(iris)
#### find min mean and max lengths and widths for sepals and petals by species 

iris %>%
  group_by(Species) %>%
  summarise(minsepallength=min(Sepal.Length),
            maxsepallength= max(Sepal.Length),
            avsepallength= mean(Sepal.Length),
            minsepalwidth= min(Sepal.Width),
            maxsepalwidth = max(Sepal.Width),
            avsepalwidth= mean(Sepal.Width),
            minpetlength= min(Petal.Length),
            maxpetlength= max(Petal.Length),
            avpetlength= mean(Petal.Length),
            minpetwidth= min(Petal.Width),
            maxpetwidth= max(Petal.Width),
            avpetwidth= mean(Petal.Width)) 


#### reaarrange rows of sepal lenfth by decreasing order and then keep rows where sepal length is greater than 7 and then select species with unique 


iris %>%
  arrange(desc(Sepal.Length)) %>%
  filter(Sepal.Length >= 7) %>%
  select(Species) %>%
  unique()




dat3<- iris %>%
  group_by(Species) %>%
  mutate(TOTALLENGTH = Sepal.Length + Petal.Length) ### mutate adds new collumns 
dat3
View(dat3)




dat<- read.csv("../../../../Data_Course/Data/Utah_Religions_by_County.csv")
tbl_df(dat)
View(dat)


dat2 <- read_xlsx("../../../../Data_Course/Data/Utah_Religions_by_County.xlsx")
View(dat2)
tbl_df(dat2)  



dat4<- read_xlsx("../../../../Data_Course/Data/wide_data_example.xlsx")
View(dat4)

# notoice how this data set follows an incorrect format. we are to fix this. 
datlong<-gather(dat4,key = Treatment, value = Mass, 2:3 )   #### key is some name that makes sense to you to use value 
View(datlong)

#### before we can start plotting we have to deal with that funky   question mark 
dat4$`Treatment 1`[1]<- "NA"

dat4$`Treatment 1`<- as.numeric(dat4$`Treatment 1`)

str(dat4)

ggplot(dat4, aes(x=SampleID, y=`Treatment 1` ))+
  geom_bar(stat="identity")  #### we use stat idenity to use the idenityt of the cells instead of counting the number of times. I want the identity of those cells to determine those values 

### now take out the NA value 

ggplot(dat4, aes(x=SampleID)) +
  geom_bar(stat="identity", aes(y=`Treatment 1` ), fill= "Blue") +
  geom_bar(stat="identity", aes(y=`Treatment 2`),fill="Red") 


### we again to convert that question mark to NA

datlong$Mass == "?"
datlong$Mass[1]<- "NA"
datlong$Mass<- as.numeric(datlong$Mass)


datlong %>%
  ggplot(aes(x=SampleID,y=Mass, fill=Treatment))+
  geom_bar(stat="identity")




#### now lets look at religion by county data AND FIX THIS DATA 


long=dat %>%
  gather(key= Religion, value= Proportion, 4:17)
# or gather(dat, key =Religion, value = Propotion , -c(1:4))
# or gather(dat, key =Religion, value= proption, -c("County, ....etc))

View(long)


### now show a plot by county of proportion of religion 

ggplot(long, aes(x=County, y=Proportion, fill=Religion))+
  geom_bar(stat="identity")+
  theme(axis.text.x=element_text(angle=90))



#### which religion is the second most and then slect mean proption sum gives us the percentage of all religios 

long %>%
  group_by(Religion) %>%
  summarize(MeanProption= mean(Proportion)) %>%
  arrange(desc(MeanProption)) 
  
  









