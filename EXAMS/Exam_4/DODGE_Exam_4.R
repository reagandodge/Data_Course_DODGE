

dat<- read.csv("DNA_Conc_by_Extraction_Date.csv")


# plots and stuff 

hist(dat$DNA_Concentration_Katy, xlab = "DNA Concentration", main = "Katy")

hist(dat$DNA_Concentration_Ben, xlab = "DNA Concentration", main = "Ben")

# take a look 
names(dat)

class(dat$Year_Collected)

#convert 
dat$Year_Collected<- as.factor(dat$Year_Collected)

#plot and save 

jpeg("DODGE_plot1.jpeg")
plot(x=dat$Year_Collected, y= dat$DNA_Concentration_Katy, xlab= "YEAR", ylab= "DNA concentrations", main= "Katy's Extractions" )
dev.off()

jpeg("DODGE_plot2.jpeg")
plot(x=dat$Year_Collected, y= dat$DNA_Concentration_Ben, xlab= "YEAR", ylab= "DNA concentrations", main= "Ben's Extractions" )
dev.off()

# differences 

dif <- dat$DNA_Concentration_Ben - dat$DNA_Concentration_Katy

max.dif<- which(dif == max(dif))
dat[max.dif, "Year_Collected"]

# subset to downstairs lab

down<- dat[dat$Lab == "Downstairs",]

class(down$Date_Collected)

# convert to POSIXct 

down$Date_Collected<- as.POSIXct(down$Date_Collected)

class(down$Date_Collected)

# plot and save 
jpeg("Ben_DNA_Over_Time.jpeg")
plot(x= down$Date_Collected, y= down$DNA_Concentration_Ben, ylab = "DNA_Concentration_Ben", xlab = "Date_Collected")
dev.off()


