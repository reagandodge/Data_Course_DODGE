library(tidyverse)
library(gganimate)
library(gapminder)



data("gapminder")

glimpse(gapminder)

hist(gapminder$year)

hist(gapminder$lifeExp)

hist(gapminder$gdpPercap, breaks = 50)
hist(gapminder$pop, breaks= 100)

glimpse(gapminder)

#show which countries belong in each continet 
table(gapminder$country,gapminder$continent)
#or we can do that this way 
xtabs(~ gapminder$continent + gapminder$country)

#list countris only in asia 

gapminder %>%
  filter(continent == "Asia") %>%
  select(country) %>% unique()


names(gapminder)
ggplot(gapminder, aes(x= year, y=lifeExp))+
  geom_point()+ facet_wrap(~continent) +
  geom_smooth(se= FALSE, aes(color= country), show.legend = FALSE)


#africa all by itself 

fig1<-gapminder %>% filter(continent == "Africa") %>%
  ggplot(aes(x= year, y=lifeExp))+
  geom_point() +
  geom_smooth(se= FALSE, aes(color= country), show.legend = FALSE)

library(plotly)

ggplotly(fig1)

#oceania 

fig2<-gapminder %>% filter(continent == "Oceania") %>%
  ggplot(aes(x= year, y=lifeExp))+
  geom_point() +
  geom_smooth(se= FALSE, aes(color= country), show.legend = FALSE)

ggplotly(fig2)

#change the scales 
fig2+ lims(y=c(0,100))

fig3<-ggplot(gapminder, aes(x=year, y=lifeExp, color= continent))+
  geom_smooth(se= FALSE)+
  lims(y=c(0,100))+
  facet_wrap(~continent)
ggplotly(fig3)

fig4<-ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color= continent))+
  geom_smooth(se= FALSE)+
  lims(y=c(0,100))
fig4


ggplot(gapminder, aes(y=gdpPercap, x=year, color= continent))+
  geom_smooth(se= FALSE)



ggplot(gapminder, aes(x=year, y=pop, color= continent))+
  geom_point() + geom_smooth(se=FALSE)



a<-gapminder %>%
  filter(continent== "Asia") %>%
  ggplot( aes(x=year, y=pop, color= country))+
  geom_point() + geom_smooth(se=FALSE)

ggplotly(a)

###lets animate!!!
library(gganimate)
p4 = ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, size=pop, color=country)) +
  geom_point(alpha = .7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range=c(2,12)) +
  scale_x_log10() +
  facet_wrap(~continent) + labs(subtitle = "Points scaled to country population")+
  
  
  
  
  
p4




