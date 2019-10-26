library(carData)
library(tidyverse)

data("MplsDemo")
data("MplsStops")


names(MplsDemo)
names(MplsStops)
#### notice how these have a collumn in common, we can link them together

full<-full_join(MplsStops, MplsDemo, "neighborhood")

anti<-anti_join(MplsStops, MplsDemo, "neighborhood")

#### are these neighborhoods found in this other data set?
unique(anti$neighborhood) %in% unique(MplsDemo$neighborhood) #### found all the nunique neighborhoods in demo and then looked in the neigboorhodds of anti and is determining if those are in that list 

### any neighborhood in demo will be added in stops. if they arent in stops they are NA values 
left<-left_join(MplsStops, MplsDemo, "neighborhood")

### anything that was in mplsstops not in mplsdemo was thrown out. 
left2<- left_join(MplsDemo, MplsStops, "neighborhood")

#### praciticing cleaning data 


crappy<- read.csv("../../../../Data_Course/Data/Bird_Measurements.csv")

names(crappy)
# get rid of N columns 


crappy2<-crappy %>%
  select(-ends_with("_N")) ### select all the columns excpet those that end with N

names(crappy2)

# create new subsets for each gender 
Male<- crappy2 %>%
  select(c("Family","Species_number", "Species_name" ,  "English_name",
           "Clutch_size","Egg_mass","Mating_System"), starts_with("M_"))


Female<- crappy2 %>%
  select(c("Family","Species_number", "Species_name" ,  "English_name",
           "Clutch_size","Egg_mass","Mating_System"), starts_with("F_"))


Unsexed <- crappy2 %>%
  select(c("Family","Species_number", "Species_name" ,  "English_name",
           "Clutch_size","Egg_mass","Mating_System"), contains("nsexed_"))

#### we need to make a new column named gender and fill with appropriate values 

Male$Gender <- "Male"
Female$Gender <- "Female"
Unsexed$Gender<- "Unsexed"


names(Male)
names(Female )

# rename all columns

names(Male)<-str_replace(names(Male), "M_", "")

names(Female)<-str_replace(names(Female), "F_", "")


names(Unsexed) <- str_replace(names(Unsexed), "unsexed", "Unsexed")

names(Unsexed)<-str_replace(names(Unsexed), "Unsexed_", "")
names(Unsexed)

## re-join them 

full<- rbind(Male, Female, Unsexed) 


write.csv(full,"../../../../Data_Course_DODGE/CLEANING DATA practice.R",quote = FALSE, row.names=FALSE)



