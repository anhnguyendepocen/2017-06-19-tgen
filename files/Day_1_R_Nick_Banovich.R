3 + 7
12 / 2
5 * 5

weight_kg <- 55
weight_kg 
weight_kg <- 55

(weight_kg <- 55)

weight_kg <- 55 #Assign value to weight_kg

weight_lb <- weight_kg * 2.2
weight_lb

weight_kg <- 100
weight_kg * 2.2

square_root = sqrt(10)
square_root

sqrt(weight_kg)

round(3.14159)
args(round)
round(3.14159, digits = 1)
round(3.14159, 1)
round(1, 3.14159)
round(digits = 1, x = 3.14159)

weight_g <- c(50, 60, 65, 82)
weight_g

animals <- c("mouse", "rat", "dog")
animals

animals <- c("mouse", rat)
animals

length(weight_g)
length(animals)
class(weight_g)
class(animals)

str(weight_g)
str(animals)

weight_g <- c(weight_g, 90) # add to the end of the vector
weight_g
weight_g <- c(30, weight_g) # add to the beginning of the vector
weight_g
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[3]
animals[c(2,3)]
animals[2:4]

more_animals <- animals[c(1,2,3,2,1,4)]
more_animals

weight_g <- c(21, 34, 54, 55, 75)
weight_g[c(TRUE, T, F, T, F)]
weight_g > 50
big_weight <- weight_g[weight_g > 50]
big_weight
weight_g[weight_g == 55]

weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g <= 30 & weight_g == 21]

animals[animals == "cat"]
animals %in% c("rat", "cat", "dog", "duck", "goat")
animals
animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]

heights <- c(2,4,4,NA,6)
mean(heights)
max(heights)

mean(heights, na.rm = T)
max(heights, na.rm =T )

heights[!is.na(heights)]
heights[complete.cases(heights)]


download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")

surveys <- read.csv("data/portal_data_joined.csv")

head(surveys)
str(surveys)
dim(surveys)
nrow(surveys)
ncol(surveys)
head(surveys, 5)
tail(surveys, 5)
names(surveys)
rownames(surveys)
colnames(surveys)

surveys[1,] # prints the first row
surveys[,1] # prints the first column
surveys[1,1] # prints the first element
head(surveys, 1)
surveys[1:3, 3:5]
surveys[1,-1]
surveys[1,-2]
dim(surveys[-c(7:34786) ,])
surveys[,"species_id"]
surveys$species_id

surveys_200 <- surveys[200,]
nrow(surveys)
surveys[nrow(surveys),]
surveys[nrow(surveys)/2,]
surveys[,nrow(surveys)]

str(surveys)

sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)
sex
sex <- factor(sex, levels = c("male", "female"))
sex

as.character(sex)
class(as.character(sex))

f <- factor(c(1990, 1983, 1998, 1990))
f
as.numeric(f)
as.numeric(as.character(f))
as.numeric(levels(f))[f]
plot(surveys$sex)

sex <- surveys$sex
head(sex)
levels(sex)
levels(sex)[1]
levels(sex)[1] <- "missing"
levels(sex)
plot(sex)

surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = T)
str(surveys)

surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = F)
str(surveys)
