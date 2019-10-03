# Tuesday #
#### load packages
library(ggplot2)
# Git pull all student repos to grade

# Go over assignment 3 (keep it brief)

# practice *exploring* data using ./Data/landdata-states

  # summaries
  # histograms
  # boxplots
  # scatterplots
  # coloring by category
  # subsetting

df = read.csv("./Data/landdata-states.csv", stringsAsFactors = TRUE ) #### true or false this will change those defaulted character strings of factors into characters vectors 
str(df)
summary(df)
df$State[7803] #### shows you the last element in that column 
df$State[7804] ###E wont show you anything because there isnt 7804 units




plot(x=df$Year,y=df$Home.Value,col=df$region) #### color it by region, the string as factors has to be true inorder this to work. 

# summary
summary(df$Home.Value)

# histogram of home value
hist(df$Home.Value,breaks = 50) #### gives you a histogram what about different break values?

# histogram of state
hist(df$State) #### this wont work but it is not numeric  


# histogram of land value
hist(df$Land.Value,breaks=50) #### difference between land value and home value?

plot(df$Home.Value, df$Land.Value) #### this is how we plot the difference... plot(x,y)

# boxplot
plot(x=df$region,df$Home.Value,col="Red")

# boxplot ("quarter" needs to be a factor to get a boxplot)

#### look at year and home value one other variable 
#### make a ggplot 
plot(as.factor(df$Qrtr),df$Home.Value)

plot(x=df$Year, y=df$Home.Value)

ggplot(df, aes(x=Year, y=Home.Value, color=Land.Value)) + #### we are building a cake! 
  geom_point(alpha=.25) + 
  geom_smooth(color="firebrick") +
  labs(title="Home Value over Years", y="Home Value", x= "Year") +
  facet_wrap(~region)+
  theme_bw()


# first give it a data frome 
# then set variables (x and y) and aes
# add the geoms
#these just get stacked upon eachother 
# here our final call was to change the theme to black and white. 






df$ID <- row.names(df)





# just look at homes in the "West" ... these should be the same, but give different results. Why?
west <- subset(df,region=="West")
west2 <- df[df$region == "West",]


plot(west$Year,west$Home.Value,col=west$State)


# Which state is that up at the top!