###############################################################
## MATH/QMGT-1150                                            ##
## Project 2 - Describing data                               ##
##                                                           ##
## Written: 2019-10-07             Last revision: 2019-10-09 ##
## Vishal Balaji                                Revision: 02 ##
###############################################################

###############################################################
##                         Setup                             ##
###############################################################

## Vishal Balaji's home folder
setwd("M:/My Documents/math1150_stats/Chaper 4 Describing data/project_2")
getwd()

## Initiate packages
library(ggplot2)
library(reshape)
library(plyr)


## Import the Cetinkaya Domjan data
CDdata <- read.delim("Cetinkaya  Domjan.dat", header = TRUE)

## Image directory
imageDirectory <- "M:/My Documents/math1150_stats/Chaper 4 Describing data/project_2/images"

## Image save function
saveInImageDirectory <- function(filename){
  imageFile <- file.path(imageDirectory, filename)
  ggsave(imageFile, width = 30, height = 20, units = "cm", dpi = 300)
}

###############################################################
##                 Part 1 - Bar Graph                        ##
###############################################################

bar <- ggplot(CDdata, aes(Groups))
bar + geom_bar(fill = "coral2") + ggtitle("Cetinkaya & Domjan - Balaji") + 
  theme(plot.title = element_text(color = "dodgerblue3", size = 24, face = "bold"))
saveInImageDirectory("Bar Graph - Balaji.png")

###############################################################
##            Part 2 - Side by Side Bar Graph                ##
###############################################################

ssbar <- ggplot(CDdata, aes(Paired, fill=Groups))
ssbar + geom_bar(position = "dodge2") + ggtitle("Cetinkaya & Domjan - Balaji")
saveInImageDirectory("Side by Side - Balaji.png")

###############################################################
##                   Part 3a - Histogram                     ##
###############################################################

effBar <- ggplot(CDdata, aes(x = Efficiency))
effBar + geom_histogram(color = "black", fill = "gray") + ggtitle("Cetinkaya & Domjan - Balaji") + 
  theme(plot.title = element_text(color = "grey20", size = 24, face = "bold"))
saveInImageDirectory("Histogram - Balaji.png")

###############################################################
##                  Part 3b - Scatterplot                    ##
###############################################################

scatter <- ggplot(CDdata, aes(x=Latency, y=Duration))
scatter + ggtitle("Cetinkaya & Domjan - Balaji") + geom_point()
saveInImageDirectory("Scatterplot - Balaji.png")

###############################################################
##               Part 4 - Five-Number summary                ##
###############################################################

## Duration
duration <- CDdata$Duration 
durationSumm <- summary(duration)
durationSumm

## Latency
latency <- CDdata$Latency
latencySumm <- summary(latency)
latencySumm

## Efficiency
efficiency <- CDdata$Efficiency 
efficiencySumm <- summary(efficiency)
efficiencySumm

###############################################################
##           Part 5 - Mean and standard deviation            ##
###############################################################

### Mean ###

## Duration
durationMean <- mean(duration)
durationMean

## Latency
latencyMean <- mean(latency)
latencyMean

## Efficiency
efficiencyMean <- mean(efficiency)
efficiencyMean

### Standard Deviation ###

## Duration
durationSD <- sd(duration)
durationSD

## Latency
latencySD <- sd(latency)
latencySD

## Efficiency
efficiencySD <- sd(efficiency)
efficiencySD

###############################################################
##         Part 6 - 88th Percentile for efficiency           ##
###############################################################

percentile_88 <- quantile(efficiency, .88)
percentile_88