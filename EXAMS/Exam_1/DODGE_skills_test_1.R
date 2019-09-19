library(readr)
DNA_Conc_by_Extraction_Date <- read_csv("~/Desktop/Data_Course_DODGE/EXAMS/Exam_1/DNA_Conc_by_Extraction_Date.csv")
View(DNA_Conc_by_Extraction_Date)

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



 