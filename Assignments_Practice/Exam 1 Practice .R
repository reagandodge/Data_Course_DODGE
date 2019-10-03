data("iris")

iris 

iris[iris$Petal.Length > 5,] #### give me where petal length is greater than 5
iris[iris$Sepal.Length >=5 & iris$Sepal.Length <=6 ,] 

iris[iris$Sepal.Length >=5 & iris$Sepal.Length <=6  & iris$Species == "virginica" ,] 
names(iris)
iris$Species
iris$Sepal.Length 

plot(iris$Species, iris$Sepal.Width)
plot(iris$Petal.Length, iris$Sepal.Length)
plot(iris$Species== "viginica")
plot(iris$Species == "virinica", )


iris[iris$Sepal.Length >= 4 & iris$Sepal.Length <= 6 & iris$Species == "setosa" ,]

str(iris)
levels(iris$Species)


which(iris$Species== "setosa")
row=  which(iris$Species== "setosa")
 
setosa=iris[iris$Petal.Length >1 & iris$Species == "setosa" ,]

plot(iris$Species)

plot(iris$Petal.Length)

plot(iris$Species, iris$Petal.Width) # categorical plus quant for box plot

plot(iris$Petal.Length, iris$Petal.Width) # a pair of quantities

plot(iris)


plot(iris$Petal.Length, iris$Petal.Width,
     col="dark red",
     main="Iris: Petal Length vs. Petal Width",
     xlab= "Petal Length",
     ylab= "Petal Width")





mtcars

head(mtcars) # gives me the first few rows of the data set 

cylinder <- table(mtcars$cyl) # take the cyl data in mtcars and covert it to a table form. 
barplot(cylinder)
plot(cylinder)



head(iris)
# now lets make some histograms 
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

par(mfrow = c(3,1))
# Histograms for each species using options 

hist(iris$Petal.Width [iris$Species == "setosa"],
     main = "Petal Width for Setosa",
     xlab= "petal width for setosa",
     col="red") # use petal width variables and select for setosa 

hist(iris$Petal.Width [iris$Species == "versicolor"],
     main= "Petal Width for Versicolor",
     xalb ="petal width for versicolor",
     col="blue")
hist(iris$Petal.Width [iris$Species == "virginica"],
     main= "petal width for virginica",
     xlab= "petal width for virginica",
     col= "purple")



mtcars
head(mtcars)

# associations

hist(mtcars$wt)
hist(mtcars$mpg)


plot(mtcars$wt, mtcars$mpg,
     col="red",
     main= " MPG as a function of weight of cars",
     xlab= "Weight in 1000 lbs",
     ylab= "MPG")


iris
head(iris)


summary(iris$Species)
summary(iris$Sepal.Length)
summary(iris)


hist(iris$Petal.Length)
summary(iris$Petal.Length)
summary(iris$Species)


hist(iris$Petal.Length[iris$Species == "versicolor"],
     main="petal length for versicolor")



summary(iris$Petal.Length[iris$Species == "versicolor"])


summary(iris$Petal.Length[iris$Species == "setosa"])

hist(iris$Petal.Length[iris$Petal.Length <= 2],
     main= "Petal Length < 2")


iris[iris$Petal.Length & iris$Species == "virginica" & iris$Petal.Length < 5.5 ,]

hist(iris$Petal.Length [iris$Species == "virginica" & iris$Petal.Length < 5.5 ],
main= "Petal Length: virginica")    


#Create Subsample#
# format: data [rows, columns]


i.setosa <- iris[iris$Species == "setosa",]
head(i.setosa)
summary(i.setosa$Petal.Length)
summary(i.setosa$Petal.Width)


i.virginica<- iris[iris$Species == "virginica" , ]
head(i.virginica)
summary(i.virginica$Sepal.Length)
summary(i.virginica$Petal.Width)

hist(i.virginica$Petal.Length,
     main= "Petal Length: Virginica",
     col= "red")

#Subsetting 

n1<- 15
n1
typeof(n1)
n2<- 1.5
n2
typeof(n2)


#character 
c1 <- "c"
c1
typeof(c1)

c2<- "a string of text"
c2
typeof(c2)

#logical 

l1 <- TRUE
l1
typeof(l1)


l2<- F
l2
typeof(l2)


# DATA STRUCTURES 


v1<- c(1,2,3,4,5)
v1
is.vector(v1) ### this just asked, is it a vector? the output will be true 



v2<- c("a", "b", "c") ### a vector of characters. 
v2
is.vector(v2)



v3 <- c( TRUE, FALSE, TRUE, TRUE, FALSE)
v3
is.vector(v3)

#### Matrix

m1 <- matrix(c(T, F, T, T, F), nrow= 2)
m1

m2 <- matrix(c("a","b","c","d"), nrow= 2, byrow=T)
m2

### Data Frames 
### combining vectors of the same length 

vNumeric <- c(1,2,3)

vCharacter <- c ("a", "b" ,"c")

vLogical <- c (T,F,T)

#### if we use the function cbind we are able to combine these vectors into a single data frame 
dfa <- cbind(vNumeric, vCharacter, vLogical)
dfa

#### notice how cbind converted all our data into the same kind of data. in our case it was character 
#### we adjust for this by making a data frame 

df<- as.data.frame(dfa)
df


### coercing numeric to integer etc...

coerce1 <- c(1, "b", TRUE)
coerce1
typeof(coerce1)

coerce2<- 5
typeof(coerce2)

coerce3 <- as.integer(5)
coerce3
typeof(coerce3)

#### character to numeric 
coerce4<- c("1", "2", "3")
coerce4
typeof(coerce4)


coerce5<- as.numeric(coerce4)
coerce5
typeof(coerce5)


#### matrix to data.frame 


coerce6 <- matrix(1:9, nrow=3)
is.matrix(coerce6)
coerce6
as.data.frame(coerce6)
####


x1 <- 1:3
y <- 1:9
 
#### combine these variables 
?cbind.data.frame
df1<- cbind.data.frame(x1,y) ### here we are just Combining our data into a data frame. cbind is our combine function and data frame etc...

df1
#### now change x to a factor 

x2<- as.factor(x1)
x2
typeof(x2) #### notice how x2 is still an integer
df2<- cbind.data.frame(x2,y)
df2
typeof(df2$x2)
str(df2) #### notice how x2 shows up as a factor here 
 


#### define an exisiting variable as a factor

x3<- c(1:3)

df3<- cbind.data.frame(x3,y)
df3

x1 <- c(0:10)
x1


#### selecting and removing columns

library(ggplot2)
my.data<- diamonds
str(my.data)


ncol(my.data) # how many columns do I have?
nrow(my.data) # how many rows
names(my.data) # what are the names of the columns?

my.data[my.data$carat,]
str(my.data$carat)

my.data.new<- my.data[1,2] # selects the variable for the first row and second column 
my.data.new
names(my.data.new) ### this is going to return to you the name of the that in the first row and the second column 

my.data.new <- my.data[1:3] # this says for the my.data index (return to me) columns 1:3
my.data.new
names(my.data.new)


my.data.new <- my.data[c(1, 5:10)] # this addresses the first column, skips the 2-4 and goes to the 5th through the 10 
my.data.new
names(my.data.new)
my.data.new<- my.data[ , ]
names(my.data.new)

ncol(my.data.new)

my.data.new <- my.data[1:50, 1:3] ### return to me the first 50 rows and the first 3 columns 
nrow(my.data.new)
ncol(my.data.new)
my.data.new


#selecting and removing rows



my.data
my.data.1<- my.data[c(1:5, 25, 29,50) , ] # notice how the table doesnt have variable as the row numbers. its chronological. but it will still contain the right information from the selected row
my.data.1
my.data[25,] # compare row "6" with row 25. 




my.data.big.diamons<- subset(my.data, x>4)
my.data.big.diamons
nrow(my.data.big.diamons)
mean(my.data.big.diamons)
typeof(my.data.big.diamons)

a<-mean(my.data$x)
b<-mean(my.data$y)
c<-mean(my.data$z)
d<-mean(my.data$carat)
e <- mean(my.data$price)
plot(a, b)



plot(my.data$carat, my.data$price)

# Converting Variables 

vec1<- 1:10
vec2<- letters[1:10]
vec3<- factor(1:10)


class(vec1)
class(vec2)
class(vec3)


vec4<- as.numeric (vec1)
class(vec4)


vec5<- as.character(vec1)
class(vec5)

vec6<- c(2, "d")
class(vec6)


vec7<- c(2, TRUE)
vec7
class(vec7)

vec3
vec8<-as.numeric(vec3)
class(vec8)


vec8 == vec3

vec9<- as.character(vec3)
class(vec9)
vec9

#### Jpeg file 

jpeg("../../../../Desktop/Data_Course_DODGE/Assignments/Assignment_3/testimage2.jpg")
plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")

dev.off()

#### csv file 


save_path = "/Users/reagandodge/Desktop/Data_Course_DODGE/Assignments/Assignment_3/DODGE_Reagan_file.csv"
write.csv(dat3, file = save_path)



#### Removing NA

#na.omit(data.frame) .... this is how you would amit NA from your data frame 


#### changing values 

airquality ### this is a dataset with some NA values 
str(airquality)

test<- airquality$Ozone[1:30] ### rows one through thirty because smaller data set to work with 

test

is.na(test) ### is.na will return a logical function with True or False telling you if NA is in the data at all. 

which(is.na(test)) ### tells you which indexes have NA in them 

test[which(is.na(test))] <- 100  #### this is our format for replacing variables. 

test
#### more practice 

str(airquality)

test2<-airquality$Solar.R[1:30]
test2
is.na(test2)

NaCol<-which(is.na(test2))

test2[NaCol]<-500
test2
is.na(test2)

#### more practice 

str(airquality)


test3<-airquality[airquality$Temp >= 70 & airquality$Temp <= 80 ,]

Eight<-which(test3 == 80)
Eight







