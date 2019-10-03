# ggplot2 intoduction 

# Load ggplot2 (it is included in the tidyverse package) ####
library(ggplot2)

# Load the data we will work with (built-in to ggplot)
data("midwest", package = "ggplot2")

midwest #### how to open it 

# Intro to ggplot syntax

# The syntax for constructing ggplots could be puzzling if you are a beginner or work primarily with base graphics. 
# The main difference is that, unlike base graphics, ggplot works with dataframes and not individual vectors. 
# All the data needed to make the plot is typically be contained within the dataframe supplied to the ggplot() itself 
# or can be supplied to respective geoms. More on that later.
# The second noticeable feature is that you can keep enhancing the plot by adding more layers (and themes) 
# to an existing plot created using the ggplot() function.


# THE BASIC STEPS FOR CREATING A GRAPH:
  # 1. Initialize the plot by giving ggplot a data.frame to work with 
  # 2. Tell ggplot which "aesthetics" to use, and where (x and y axes, colors, sizes, shapes, transparency, etc)
  # 3. Add "geom" layers to display the aesthetics ... geoms tell ggplot how to deal with the aesthetic layers you chose
  # 4. Add labels, make it pretty
  # 5. Bask in your genious

# Let’s initialize a basic ggplot based on the midwest dataset that we loaded.
ggplot(midwest) # what do you see? NOTHING is there. we said "build a ggplot based on the midwest data frame but we didnt give it any aesthics like our x and y axis

# give it some aesthetics to work with...
ggplot(midwest, aes(x=area, y=poptotal))  # plot midwest, for the aestics (aes) plot x for area and y for poptal area and poptotal are columns in 'midwest'

# A blank ggplot is drawn. Even though the x and y are specified, there are no points or lines in it. 
# This is because, ggplot doesn’t assume that you meant a scatterplot or a line chart to be drawn. 
# I have only told ggplot what dataset to use and what columns should be used for X and Y axis. 
# I haven’t explicitly asked it to draw any points.
# 
# Also note that aes() function is used to specify the X and Y axes. 
# That’s because, any information that is part of the source dataframe has to be specified inside the aes() function.

# Give it a geom (geometric layers) to map to your defined aesthetics... Basic Scatterplot, in this case:
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() # The "+" tells ggplot to add another layer to our base plot

# Add another geom ... a trendline:
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method = "lm") #### lm is linear model 
# The line of best fit is in blue. Can you find out what other method options are available for geom_smooth? 

# Store your plot as an object to add to...
p <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method = "lm")
 #### p$ try this. see how this gives us all the information in category. 
  
# Zoom in
p + lims(x=c(0,0.1),y=c(0,1000000)) # what did this do? this adds limits. where x limits is this value and y is this value to cut off points. digatally removes points from data 
p + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) # how is this different? now add cartesioan coordinates to ZOOM IN. magnefying the data. no removal of points, just a zoom in 

# Store this new zoomed-in plot
p2 <- p + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))

# Add Title and Labels: the command for adding labels is labs
p2 + labs(title="Area Vs Population", 
          subtitle="From midwest dataset", 
          y="Population", 
          x="Area", 
          caption="Midwest Demographics")

# Nifty!  So here's the full function call to make this plot:
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Let's make it pretty ####

# Change color of points and line to static values:
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(color="steelblue",size=3) + #### notice how we added colored points and different size points
  geom_smooth(method="lm",color="firebrick") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
# what else did we change, and how?


# Here's where ggplot gets really cool...
# Suppose if we want the color to change based on another column in the source dataset, 
# we can specify "color" inside the "aesthetic" aes() function. "aes" gives ggplot the things that will be plotted
p3 <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(color=state),size=3) + #### notice the difference here is color=state before we just told geom to make all the points steel blue. here we use the aes function to use the state column to assign color 
  geom_smooth(method="lm",color="firebrick") + #### geom smooth (our smooth line...) if aes(color=state)) we see all linear regression models for all states
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 250000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics", color="State ID") ### "State to capatilize state
p3
#### alpha changes the transparency. how light or dark the points are. 
ggplot(midwest, aes(x=state, y=poptotal))+
  geom_violin(aes(fill=state))+ #### we have to give it an aestetic "aes" if we want them filled in "fill"
  coord_cartesian(ylim=c(0, 250000)) #### notice how we dont need an xlim to "zoom in"

#### now lets make a histogram but remember histograms only want one aesthetic which needs to be the "x" so we just change the y aes to x 

ggplot(midwest, aes(x=poptotal))+
  geom_histogram(aes(fill=state),bins = 10) + #### dont use color=state, use fill=state to better denote states by color. bins determines width of the histogram 
  facet_wrap(~state) ### if we comma tab geom gives us all our options

#### new kind of graph 
ggplot(midwest, aes(x=poptotal))+
  geom_density(aes(fill=state), alpha=.25) + #### geom density is a smooth line version of a histogram and just like a histogram geomdensity only wants one variable (x)
  coord_cartesian(xlim=c(0, 250000)) +
  facet_wrap(~state) + 
  theme(axis.text.x = element_text(angle = 90), #### "theme" allows us to mess with anthing. hey theme mess with axis text. we have to give it an element which in this case is the text 
  legend.title = element_text(face = "bold", size=50)) ### legend title operates within theme thus comma after "90" 




# Don't like those colors?
p3 + scale_color_brewer(palette = "Set1")

# Want more color choices? You can check them out in the RColorBrewer package, or even make your own
library(RColorBrewer)
brewer.pal.info

# Make your own and take a peek at it:
library(colorblindr)
pal = c("#c4a113","#c1593c","#643d91","#820616","#477887","#688e52",
        "#12aa91","#705f36","#8997b2","#753c2b","#3c3e44","#b3bf2d",
        "#82b2a4","#894e7d","#a17fc1","#262a8e","#abb5b5","#000000")
palette_plot(pal)
# You can even check to see if your color choices would work for someone who has colorblindness...
cvd_grid(palette_plot(pal))

# Our plot with my custom color palette
p3 + scale_color_manual(values=pal)

# Other neat tricks:
p3 + scale_x_reverse() #### reverses the direction of x values 
p3 + theme_minimal()
p3 + theme_dark()
p3 + theme_void()

# You can also transform your data right in ggplot:
p4 = ggplot(midwest, aes(x=area/max(midwest$area), y=log10(poptotal))) + #### a function inside of aes "area divided by the max area.."
  geom_point(aes(color=state),size=3) + 
  geom_smooth(method="lm",color="firebrick") + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", color = "State",
       y="log10 Population", x="Area (proportion of max)", caption="Midwest Demographics") +
  theme_minimal() +
  scale_color_manual(values=pal)

p4


# Want to divide up your plot into multiple ones based on a categorical variable?
p4 + facet_wrap(~ state)
p4 + facet_wrap(~ state, scales = "free") + theme(legend.position = "none") #### "scales= free lets the graphs base scales off of their internal values 
p4 + facet_wrap(~ state) + theme(legend.position = "none", strip.text.x = element_text(size = 12, face="bold"))
p4 + facet_wrap(~ state) + theme(legend.position = "none", 
                                 strip.text.x = element_text(size = 12, face="bold"),
                                 strip.background = element_rect(fill = "lightblue"))


# Some other "geom" types ... for categorical x axis
p5 = ggplot(midwest, aes(x=state,y=percollege, fill=state)) + labs(x="State",y="Percent with college degree")
p5

p5 + geom_boxplot()
p5 + geom_violin()
p5 + geom_bar(stat="identity") # something wrong with this picture!


# Geoms for looking at a single variable's distribution:
#install.packages("carData") #### or you can go to the packages tab to install this. 
library(carData)
data("MplsStops")
MplsStops #### this "opens" the file what is this???? this is a POSIXct data set. POSIXct is the number of seconds since january 1 1970. When the first UNIX machine started tracking time 

MplsStops$date[1]
#### todays date 
 #### date wont deal with posixct. we can covert date to posixct or vice versa 
as.POSIXct(Sys.Date())- MplsStops$date[1]
weekdays(MplsStops$date[1])
weekdays(MplsStops$date) ### gives you all days that a stop occured 
MplsStops$weekdays <-weekdays(MplsStops$date) #### using the column date to find the weekday and assigning it to the variable 
#### now make a bar chart of the x axis is weekdays number of stop is y 

p6<-ggplot(MplsStops,  aes(x=weekdays))+
geom_bar(aes(fill=race))
p6



ggplot(MplsStops, aes(x=lat)) + geom_histogram() + labs(title = "Latitude of police stops in Minneapolis - 2017")
ggplot(MplsStops, aes(x=lat, fill = race)) + geom_density(alpha = .5) + labs(title = "Latitude of police stops in Minneapolis - 2017")


ggplot(MplsStops, aes(x=lat, fill = race)) + geom_histogram() + labs(title = "Latitude of police stops in Minneapolis - 2017") +
  facet_wrap(~race)



# Look at lat AND lon
ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_point() + theme_minimal()

ggplot(MplsStops, aes(x=lat,y=long,color=race)) + 
    geom_point(alpha=.1) + theme_minimal() + facet_wrap(~race)# "overplotting!?" yes very much so. how do we get around it? alpha helps..

max(MplsStops$date)- min(MplsStops$date) #### this gives us the max - the min of the data to give us the span of the time this data was taken 

# Check out the issue with some random data
random_data = data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 11, 4.5) )

# quick look at data
plot(random_data$x)

# Basic scatterplot
ggplot(random_data, aes(x=x, y=y) ) +
  geom_point()

# 2D Density plot, instead
ggplot(random_data, aes(x=x, y=y) ) +
  geom_bin2d() + ### geom bin 2d is meant for overplotting this basically makes a topograph map. contours. etc. 
  theme_bw()


# Back to our over-plotted figure from before...
ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_point(alpha=.05) + theme_minimal() + facet_wrap(~race)

ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_density_2d() + theme_minimal() + facet_wrap(~race)

ggplot(MplsStops, aes(x=lat,y=long)) + geom_bin2d()

ggplot(MplsStops, aes(x=lat,y=long, color=race)) + geom_bin2d() + facet_wrap(~race)


total<-length(MplsStops$gender)


sum(na.omit(MplsStops$gender == "Unknown"))/total ### omit na 
sum(na.omit(MplsStops$gender == "Male"))/total
sum(na.omit(MplsStops$gender == "Female"))/total

ggplot(MplsStops, aes(x=race, fill=race)) +
  geom_bar(position="dodge")+
  facet_wrap(~gender)

#### where were males stopped vs. females

ggplot(MplsStops, aes(x=lat, y=long, color=gender))+
  geom_point(alpha=.2)+
  facet_wrap(~gender)

summary(MplsStops$neighborhood)
neighborrace<-na.omit(table(MplsStops$neighborhood, MplsStops$gender))
neighborrace<-as.data.frame(neighborrace)
names(neighborrace)<- c("Neighborhood", "Gender", "Freq")

pop= neighborrace[neighborrace$Freq > 500 ,]

data("MplsDemo")

MplsDemo
library(dplyr)
?join
full<-full_join(MplsStops, MplsDemo, "neighborhood")

ggplot(full, aes(x=poverty, y=collegeGrad))+
  geom_point() + geom_smooth(method= "lm")





# More advanced understanding of R functions will be required to replicate the following section, but it
# is included as an example follow-up analysis

# Plot using two related data sets
data("MplsDemo") # demographic info by neighborhood can be joined to our police stop dataset

# don't worry about this yet...you'll learn how to do this soon, but I'm just adding mean neighborhood income
# to each row of the police stop data set
income = as.numeric(as.character(plyr::mapvalues(MplsStops$neighborhood, from=MplsDemo$neighborhood, to = MplsDemo$hhIncome)))
MplsStops$income <- income


ggplot(MplsStops, aes(x=lat,y=long,color=income)) + geom_point(alpha=.2)
  
ggplot(MplsStops, aes(x=income)) + geom_histogram(bins = 30)


counts = as.data.frame(table(MplsStops$income))
counts$Var1 <- as.numeric(as.character(counts$Var1))
mod1 = lm(Freq ~ Var1, data = counts)

ggplot(counts, aes(x=Var1,y=Freq)) + geom_point() + geom_smooth(method="lm") +
  labs(x="Mean neighborhood income",y="Numer of police stops",title = "Police stop counts in each neighborhood",
       subtitle = paste0("Adjusted R-sq. value = ",signif(summary(mod1)$adj.r.squared),3)) + 
  theme_minimal()




getwd()
jpeg("../Desktop/practiceplot.jpeg")
hist(MplsStops$income)
dev.off()





