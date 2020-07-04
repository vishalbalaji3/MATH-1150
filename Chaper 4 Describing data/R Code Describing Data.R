###############################################################
## MATH/QMGT-1150                                            ##
## R Code: Chapter 4                                         ##
##                                                           ##
## Field, A. P., Miles, J. N. V., & Field, Z. C. (2012).     ##
## Discovering Statistics Using R                            ##
##                                                           ##
## (c) 2011 Andy P. Field, Jeremy N. V. Miles & Zoe C. Field ##
###############################################################

###############################################################
###############################################################
### Set the working directory 

setwd("M:/My Documents/math1150_stats/Chaper 4 Describing data")

getwd()

###############################################################
###############################################################
### Initiate packages

library(ggplot2)
library(reshape)
library(plyr)


###############################################################
###############################################################
## Create a directory to store your graphs/images.
## First, create a subfolder in stats named "images".

imageDirectory<-"M:/My Documents/math1150_stats/Chaper 4 Describing data/images"


###############################################################
###############################################################
## Create a function to make it quick to save graphs in the image directory

saveInImageDirectory<-function(filename){
  imageFile <- file.path(imageDirectory, filename)
  ggsave(imageFile, width = 30, height = 20, units = "cm", dpi = 300)
}



###############################################################
###############################################################
## Creating graphs with ggplot2

facebookData <- read.delim("FacebookNarcissism.dat.txt",  header = TRUE)

graph <- ggplot(facebookData, aes(NPQC_R_Total, Rating))
graph + geom_point() + ggtitle("geom_point()")
saveInImageDirectory("04 Tutorial Point.png")

graph + geom_point(shape = 17) + ggtitle("geom_point(shape = 17)")
saveInImageDirectory("04 Tutorial Triangle.png")

graph + geom_point(size = 6) + ggtitle("geom_point(size = 6)")
saveInImageDirectory("04 Tutorial Size.png")

graph + geom_point(aes(colour = Rating_Type)) + ggtitle("geom_point(aes(colour = Rating_Type))")
saveInImageDirectory("04 Tutorial Colour Point.png")

graph + geom_point(aes(colour = Rating_Type), position = "jitter") + ggtitle("geom_point(aes(colour = Rating_Type), position = jitter)")
saveInImageDirectory("04 Tutorial Jitter.png")

graph + geom_point(aes(shape = Rating_Type), position = "jitter") + ggtitle("geom_point(aes(shape = Rating_Type), position = jitter)")
saveInImageDirectory("04 Tutorial Jitter2.png")



###############################################################
###############################################################
### Bar Charts

## Download Miles Per Gallon Data to your stats folder & look at it.

mpg = read.csv("Miles_Per_Gallon.csv",  header = TRUE)

## The dataframe contains 38,962 observations.
## Let's subset it to include only the first 100 rows.

mpg1 <- mpg[1:100,]

## Load the ggplot2 package 

library(ggplot2)

##     ggplot2 can be used to build a graph.  
##     With ggplot2, you can independently specify the 
##     building blocks of a graph, including:
##        Data (what data are we using?)
##        Aesthetic mappings (how do we want the graph to appear?)
##        Geometric objects (what type of graph are we creating?)
##        Statistical transformations
##        Scales
##        Coordinate systems
##        Position adjustments
##        Faceting 

bar <- ggplot(mpg1, aes(fuelType))

##     We're using the ggplot function
##     We're using the mpg1 dataframe
##     The x-axis will be the "fuelType" variable
##     The y-axis will be the counts of the "fuelType" variable


##     geom_bar() allows us to create the graph.
##     We add it using "+"

bar + geom_bar()

##     Typically leave them black/white, but you can add color.

bar + geom_bar(fill = "purple")
bar + geom_bar(fill = "red")

##     We can add a title. 

bar + geom_bar(fill = "red") + ggtitle("Plot of MPG")

##     We can format the title. 

bar + geom_bar(fill = "red") + ggtitle("Plot of MPG") + 
  theme(plot.title = element_text(color="black", size=28, face="bold"))

##     We can use the function we created to save
##     the image. 

saveInImageDirectory("Miles Per Gallon Bar.png")

#################################################################
#################################################################
## Exercise 1                                                  ##
##                                                             ##
## Create a bar graph for transmission type (trans)using mpg1. ##
##                                                             ##
## Make the bars green.                                        ##
## Give it a title "Plot of Transmissions" and make it blue.   ##
## Save it as Exercise 1 - Your Last Name.png                  ##
##                                                             ##
#################################################################
#################################################################

barExer <- ggplot(mpg1, aes(trans))
barExer + geom_bar(fill = "green4") + ggtitle("Plot of Transmissions") + 
  theme(plot.title = element_text(color = "dodgerblue3", size = 24, face = "bold"))
saveInImageDirectory("Exercise 1 - Balaji.png")












###########################################################################
###########################################################################
## Exercise 1 Solution                                       

bar <- ggplot(mpg1, aes(trans))                                             
bar + geom_bar(fill = "green") + ggtitle("Plot of Transmissions") +         
  theme(plot.title = element_text(color="blue", size=28, face="bold"))  
saveInImageDirectory("Exercise 1 - Thompson.png")

###########################################################################
###########################################################################








###############################################################
###############################################################
### Pie Charts

summary(mpg1)

slices <- c(17,8,8,7,5,5,50)
lbls <- c("Dodge", "Ford", "Oldsmobile","Buick","Chevrolet","Mazda","Other")

pie(slices, labels = lbls, main="Pie Chart of Auto Makes")

pie(slices, labels = lbls, col=rainbow(length(lbls)), main="Pie Chart of Auto Makes")

# saveInImageDirectory("Miles Per Gallon Pie.png") works only for ggplot bcz made with ggplot
# pie charts are made using base R, hence requires base R code

# png(file="M:/My Documents/math1150_stats/Chaper 4 Describing data/images/pie chart.png") ahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh




# 3D Exploded Pie Chart
library(plotrix)

pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Auto Makes")

saveInImageDirectory("Miles Per Gallon Pie 3D.png")


















###############################################################
###############################################################
## Exercise 2                                                ##
##                                                           ##
## Create a pie chart for class of car (vClass) using mpg1.  ##
##                                                           ##
## Only include categories with non-zero counts.             ##
## Use col=rainbow to color the slices.                      ##
## Give it a title "Pie Chart of Auto Classes".              ##
## Save it as Exercise 2 - Your Last Name.png                ##
##                                                           ##
###############################################################
###############################################################
summary(mpg1)

slices <- c(75,13,9,2,1)
lbls <- c("Midsize Cars", "Compact Cars", "Vans","Two Seaters","Subcompact Cars")

pie(slices, labels = lbls, col=rainbow(length(lbls)), main="Pie Chart of Auto Classes")

saveInImageDirectory("Exercise 2 - Balaji.png")







###############################################################
###############################################################
## Exercise 2 Solution

summary(mpg1)

slices <- c(75,13,9,2,1)
lbls <- c("Midsize Cars", "Compact Cars", "Vans","Two Seaters","Subcompact Cars")

pie(slices, labels = lbls, col=rainbow(length(lbls)), main="Pie Chart of Auto Classes")

saveInImageDirectory("Exercise 2 - Thompson.png")

###############################################################
###############################################################
library(ggplot2)

df = data.frame("class" = c("Midsize Cars", "Compact Cars", "Vans","Two Seaters","Subcompact Cars"),
                "share" = c(75,13,9,2,1))

# Create a basic bar
pie = ggplot(mpg1, aes(x="", y=share, fill=brand)) + geom_bar(stat="identity", width=1)

# Convert to pie (polar coordinates) and add labels
pie = pie + coord_polar("y", start=0) + geom_text(aes(label = paste0(round(value*100), "%")), position = position_stack(vjust = 0.5))

# Add color scale (hex colors)
pie = pie + scale_fill_manual(values=c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419", "#999999")) 

# Remove labels and add title
pie = pie + labs(x = NULL, y = NULL, fill = NULL, title = "Phones - Market Share")

# Tidy up the theme
pie = pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust = 0.5, color = "#666666"))












###############################################################
###############################################################
### Side-by-Side and Segmented Bar Charts

## Download Cereal Data to your stats folder & look at it.

cereal = read.csv("Cereal_Data.csv",  header = TRUE)


bar <- ggplot(cereal, aes(Manufacturer, fill=Type))

bar + geom_bar()

## If we want them side-by-side

bar <- ggplot(cereal, aes(Manufacturer, fill=Type))

bar + geom_bar(position = "dodge2")
saveInImageDirectory("Cereal Side by Side Bar.png")

###############################################################
###############################################################
## Exercise 3                                                ##
##                                                           ##
## Create a Side-by-Side Bar Chart using cereal.             ##
## I'm interested in whether each company has products       ##
## displayed on the top, middle, or bottom shelves.          ##
##                                                           ##
## Make a chart of counts by manufacturer but subsets based  ##
## on shelf location.                                        ##
## Save it as Exercise 3 - Your Last Name.png                ##
##                                                           ##
###############################################################
###############################################################


###############################################################
###############################################################
## Exercise 3 Solution

bar <- ggplot(cereal, aes(Manufacturer, fill=Shelf))

bar + geom_bar(position = "dodge2")
saveInImageDirectory("Exercise 3 - Thompson.png")

###############################################################
###############################################################
### Dot Plots

# Basic dot plot
dot <- ggplot(cereal, aes(x = Manufacturer))

dot  + geom_dotplot(stackratio=1.5,binwidth=.1)
dot

saveInImageDirectory("Cereal Manufacturer Dot.png")


###############################################################
###############################################################
### Histograms
festival <- read.delim("Festival.dat",  header = TRUE)

hist <- ggplot(festival, aes(x = day1))

hist + geom_histogram(color = "black", fill = "gray")
hist + geom_histogram(color = "black", fill = "red", binwidth=.25) 

saveInImageDirectory("Hygiene Rating - Day 1 Histogram.png")


hist <- ggplot(festival, aes(x = day2))
hist + geom_histogram(color = "black", fill = "blue", binwidth=.25)

saveInImageDirectory("Hygiene Rating - Day 2 Histogram.png")

hist <- ggplot(festival, aes(x = day3))
hist + geom_histogram(color = "black", fill = "green", binwidth=.2)

saveInImageDirectory("Hygiene Rating - Day 3 Histogram.png")


hist <- ggplot(festival, aes(x = day1))
hist + geom_histogram(aes(color = gender), fill="white",position = "identity", binwidth=.2) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))

hist <- ggplot(festival, aes(x = day2))
hist + geom_histogram(aes(color = gender), fill="white",position = "identity", binwidth=.2) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))

hist <- ggplot(festival, aes(x = day3))
hist + geom_histogram(aes(color = gender), fill="white",position = "identity", binwidth=.2) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))






















###############################################################
###############################################################
## Exercise 4                                                ##
##                                                           ##
## Create a histogram using cereal.                          ##
##                                                           ##
## Make a histogram of Protein counts (Protein).             ##
## Make the bars any color you choose.                       ##
## Set binwidth=1                                            ##
## Save it as Exercise 4 - Your Last Name.png                ##
##                                                           ##
###############################################################
###############################################################





###############################################################
###############################################################
## Exercise 4 Solution

hist <- ggplot(cereal, aes(x = Protein))

hist + geom_histogram(color = "black", fill = "gray")
hist + geom_histogram(color = "black", fill = "red", binwidth=1) 

###############################################################
###############################################################



###############################################################
###############################################################
### Box Plots

box <- ggplot(cereal, aes(x = factor(1), y = Sodium)) 

box + geom_boxplot(width = 0.4, fill = "white") 

box + geom_boxplot(width = 0.4, fill = "white") +
  geom_jitter(width = 0.1, size = 1) # Add a dot for each observation

box + geom_boxplot(width = 0.4, fill = "white") +
  geom_jitter(width = 0.1, size = 1) +
  labs(x = NULL)   # Remove x axis label






###############################################################
###############################################################
### Scatterplots

scatter <- ggplot(cereal, aes(x=Calories, y=Sugars)) 

scatter + geom_point()



###############################################################
###############################################################
## Exercise 5                                                ##
##                                                           ##
## Create a scatter plot using festival.                     ##
##                                                           ##
## Put day2 on the x-axis and day3 on the y-axis.            ##
## Make the bars any color you choose.                       ##
## Save it as Exercise 4 - Your Last Name.png                ##
##                                                           ##
###############################################################
###############################################################


















###############################################################
###############################################################
## Exercise 5 Solution

scatter <- ggplot(festival, aes(x=day2, y=day3)) 

scatter + geom_point()

###############################################################
###############################################################


smpl1 <- c(8,12,3,18,15)
smpl1Mean <- mean(smpl1)
smpl1Median <- median(smpl1)

smpl2 <- c(110,112,118,119,122,125,129,135,138,140)
smpl2Mean <- mean(smpl2)
smpl2Median <-median(smpl2)




