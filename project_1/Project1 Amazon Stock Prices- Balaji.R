###############################################################
## MATH/QMGT-1150                                            ##
## Project 1 - Amazon Stock Prices                           ##
##                                                           ##
## Written: 2019-09-04             Last revision: 2019-09-05 ##
## Vishal Balaji                                Revision: 02 ##
###############################################################

###############################################################
##                         Part 1                            ##
###############################################################

## Vishal Balaji's home folder
setwd("M:/My Documents/math1150_stats/project_1")
getwd()

## Import the Amazon stock prices data
stockPrices<-read.csv("Amazon_Stock_Prices.csv", header = TRUE)

## Calculate the differences
openCloseDiff <- stockPrices$open - stockPrices$close
highLowDiff <- stockPrices$high - stockPrices$low

## Subsetting the data
lowerClosingPrices <- subset(stockPrices, close < open)

## Writing the data
write.csv(lowerClosingPrices, "Lower Closing Prices-Balaji.csv")

###############################################################
##                         Part 2                            ##
###############################################################

freshmenFallClasses_Balaji <- c("History of U.S to 1877", "Economics 1000", "Calculus 1", "Elementary Statistics", "Sex, lies and scandals: Corruption in America")
