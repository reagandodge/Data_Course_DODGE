# Ugly GGplot 


library(ggplot2)





#### dataset for ugly ggplot

data(package = .packages(all.available = TRUE))




library(dplyr)




data("diamonds")


library(ggplot2)
library(extrafont)

##loadfonts()

scales::show_col(tvthemes:::rickAndMorty_palette)
tvthemes::import_rickAndMorty()











jpeg("../../Desktop/Data_Course_DODGE/Ugly_ggplot.jpeg")


p<-ggplot(diamonds, aes(carat, price, col="Get Schwifty")) +
  geom_point(alpha= .55, pch= 11) + annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+
  theme(panel.background = element_rect(fill = "#3ADF00", colour = "red"))+
  labs(title = "DaMmIT MORty, YoU KnoW DiAMOnds AreN'T FOrEveR RiGht?",
       x= "Schmeckle", y= "Blemflarck",
       subtitle = "ThEy'Re blOOd diaMonDs, MorTy **burp**",
       caption = "WUBBALUBBADUBDub!")

p<-p+ theme(plot.title=element_text(size=15, 
                                   face="bold", 
                                   family="American Typewriter",
                                   color="tomato",
                                   hjust=0.5,
                                   lineheight=1.2),
         plot.subtitle=element_text(size=10, 
                                    family="American Typewriter",
                                    face="bold",
                                    color = "purple",
                                    hjust=0.5),
         axis.title.x=element_text(vjust=10,  
                                   size=25,
                                   color ="#210B61"),  # X axis title
         axis.title.y=element_text(size=15,
                                   color = "#3ADF00"),  # Y axis title
         axis.text.x=element_text(size=18, 
                                  angle = 45,
                                  vjust =.5,
                                  color = "yellow"),  # X axis text
         axis.text.y=element_text(size=50,
                                  angle = 120))


p + theme(plot.background=element_rect(fill="#E64358"), 
          plot.margin = unit(c(2, 2, 1, 1), "cm"))



dev.off()









install.packages("png")

install.packages("grid")

packs <- c("png","grid")
lapply(packs, require, character.only = TRUE) 


img <- readPNG("../Data_Course_DODGE/rickandmorty copy.png") 


g <- rasterGrob(img, interpolate=TRUE) 


library(jpeg)


readJPEG("../../Data_Course_DODGE/rickandmorty.jpg", native = TRUE)

if(exists("rasterImage")){
  plot(1:2, type='n')
  rasterImage(img,1,1,2,2)
}


ggdraw() +
  draw_image("https://www.dralhazen.com/wp-content/uploads/2017/03/rickandmorty_featured_2.jpg") +
  draw_plot(my_plot)


View(diamonds)




#### images as points

# find image on google 
# save it on desktop as png
## use library tideverse 



#library(tidyverse)
#library(png)
#library(girdgraphics)
#install.packages("girdgraphics")
#mush<- readPNG(then whatever your image file path is)
#g1<-rasterGrob(mush, interpolate = FALSE)

#annotation_custom() comes after geompoint function(then give it the grob and give it the min and max points)

#xmin= dataframe$value
#ymin = dataframe$value 
#xmin= dataframe$value
#ymin = dataframe$value 

#annotation_custom(g1, )
#### IGNORE ABOVE 

#### libarary(magick)
### library (ggimage)

#mtccars$imgae<- assign webaddress path 
#ggplot(
#  mtcars, aes disp mpg+ 
 #   geom image(aes image=image , size = .05 )



install.packages("ggimage", dependencies = TRUE)
library(ggimage)
library(magick)

dnow <- data.frame(x=rnorm(100), y=runif(100))
head(dnow,4)
data(diamonds)

diamonds<-head(diamonds,80)



diamonds$image<-("../../Desktop/Data_Course_DODGE/pickle-rick.png")



jpeg("../../Desktop/Data_Course_DODGE/Ugly_ggplotpicklerick.jpeg")

p<-ggplot(diamonds, aes(carat, price)) +
  geom_image(image=diamonds$image, size=.15) + annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)+
  theme(panel.background = element_rect(fill = "#3ADF00", colour = "red"))+
  labs(title = "DaMmIT MORty, YoU KnoW DiAMOnds AreN'T FOrEveR RiGht?",
       x= "Schmeckle", y= "Blemflarck",
       subtitle = "ThEy'Re blOOd diaMonDs, MorTy **burp**",
       caption = "WUBBALUBBADUBDub!")

p<-p+ theme(plot.title=element_text(size=15, 
                                    face="bold", 
                                    family="American Typewriter",
                                    color="tomato",
                                    hjust=0.5,
                                    lineheight=1.2),
            plot.subtitle=element_text(size=10, 
                                       family="American Typewriter",
                                       face="bold",
                                       color = "purple",
                                       hjust=0.5),
            axis.title.x=element_text(vjust=10,  
                                      size=25,
                                      color ="#210B61"),  # X axis title
            axis.title.y=element_text(size=15,
                                      color = "#3ADF00"),  # Y axis title
            axis.text.x=element_text(size=18, 
                                     angle = 45,
                                     vjust =.5,
                                     color = "yellow"),  # X axis text
            axis.text.y=element_text(size=50,
                                     angle = 120))


p + theme(plot.background=element_rect(fill="#E64358"), 
          plot.margin = unit(c(2, 2, 1, 1), "cm"))




dev.off()


data(mtcars)
mtcars$image<- ("../../Desktop/Data_Course_DODGE/pickle-rick.png")

ggplot(mtcars, aes(x=mpg, y=disp))+
  geom_image(image=mtcars$image, size=.05)

