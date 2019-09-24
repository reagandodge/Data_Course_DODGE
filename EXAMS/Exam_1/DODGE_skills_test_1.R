library(readr)
DNA_Conc_by_Extraction_Date <- read_csv("~/Desktop/Data_Course_DODGE/EXAMS/Exam_1/DNA_Conc_by_Extraction_Date.csv")
DNA_Conc_by_Extraction_Date

summary(DNA_Conc_by_Extraction_Date)


k<- summary(DNA_Conc_by_Extraction_Date$DNA_Concentration_Katy)
k
hist(k, 
     xlab="DNA Concentration",
     main= "Katy DNA Concentration")


b<- summary(DNA_Conc_by_Extraction_Date$DNA_Concentration_Ben)
b
hist(b,
     xlab= "DNA Concentration",
     main = "Ben DNA Concentration")



yearchar<-as.character(DNA_Conc_by_Extraction_Date$Year_Collected)
DNA_Conc_by_Extraction_Date$Year_Collected<- yearchar

DNA_Conc_by_Extraction_Date$Year_Collected

boxplot(DNA_Conc_by_Extraction_Date$DNA_Concentration_Katy~ DNA_Conc_by_Extraction_Date$Year_Collected)


jpeg("~/Desktop/Data_Course_DODGE/EXAMS/Exam_1/DODGE_plotkaty.jpeg")
plotkaty<-boxplot(DNA_Conc_by_Extraction_Date$DNA_Concentration_Katy~ DNA_Conc_by_Extraction_Date$Year_Collected,
               xlab="YEAR",
               ylab="DNA Concentrations",
               main= "Katy Concenctrations")
dev.off()


jpeg("~/Desktop/Data_Course_DODGE/EXAMS/Exam_1/DODGE_plotben.jpeg")
plotben<-boxplot(DNA_Conc_by_Extraction_Date$DNA_Concentration_Ben ~ DNA_Conc_by_Extraction_Date$Year_Collected,
              xlab = "YEAR",
              ylab = "DNA Concentrations",
              main="Bens Concentrations")
dev.off()




summary(DNA_Conc_by_Extraction_Date$DNA_Concentration_Katy)


summary(DNA_Conc_by_Extraction_Date$DNA_Concentration_Ben) 

Downstairs<-DNA_Conc_by_Extraction_Date[DNA_Conc_by_Extraction_Date$Lab == "Downstairs" ,]

Downstairs
library(ggplot2)

ggplot(Downstairs, aes(x=Date_Collected, y=DNA_Concentration_Ben))+
  geom_point()


jpeg("~/Desktop/Data_Course_DODGE/EXAMS/Exam_1/Ben_DNA_over_time.jpg")

ggplot(Downstairs, aes(x=Date_Collected, y=DNA_Concentration_Ben))+
  geom_point()

dev.off()

### question four 



library(dplyr)


dat %>%
  filter(Lab =="Upstairs") %>%
  select(starts_with("D"))

dat= read.csv("/Users/reagandodge/Desktop/Data_Course/Exam_1/DNA_Conc_by_Extraction_Date.csv")






df = dat %>%
  group_by(Year_Collected) %>%
  summarize(mean(DNA_Concentration_Ben))



dat %>% 
  group_by(Lab) %>%
  summarize(MeanBen = mean(DNA_Concentration_Ben),
            MeanKaty = mean(DNA_Concentration_Katy))


table(dat$Year_Collected, dat$Lab)  









df= read.csv("../Data/GradSchool_Admissions.csv")
df

### find the averagae GPA based on the rank 

GPA_RANK<-df %>% 
 group_by(rank) %>%
  summarize(AV_GPA=mean(gpa))
GPA_RANK  





 