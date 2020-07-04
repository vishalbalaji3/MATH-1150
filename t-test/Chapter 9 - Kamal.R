##############################################################
## MATH/QMGT-1150                                            ##
## R Code: Chapter 9 - Single-Sample t-Tests                 ##
##                                                           ##
## Field, A. P., Miles, J. N. V., & Field, Z. C. (2012).     ##
## Discovering Statistics Using R                            ##
##                                                           ##
## (c) 2011 Andy P. Field, Jeremy N. V. Miles & Zoe C. Field ##
###############################################################

###############################################################
###############################################################
### Set the working directory 

#setwd()

getwd()
setwd("M:/STATS")

###############################################################
###############################################################
### Load packages

library(ggplot2)
library(pastecs)
library(reshape)
library(Hmisc)
library(WRS)
library(psych)


###############################################################
###############################################################
## Create a directory to store your graphs/images.
## First, create a subfolder in stats named "images".

#imageDirectory<-""

imageDirectory<-"M:/STATS/images"

###############################################################
###############################################################
## Import data in long format


satisfaction <- read.csv("Employee_Satisfaction.csv", header =TRUE)

###############################################################
###############################################################
## Single Sample t-Test

###############################################################
###############################################################
## Regular hours for a person who weeks 40 hours per week over
## 4 weeks would be 160 hours.
##
## Is the average hours worked in the satisfaction data 
## statistically significantly different that 160?

t.test(satisfaction$average_monthly_hours, mu=160)





###############################################################
###############################################################
## Interpretation
##

# on average, employees worked more than 160 hours per month (m = 201.05, SE = 0.41), which is 
# significant, t(14999) = 100.67, p < 0.0001
# we are 95% confident that the true average hours worked is btw 200.25 and 201.85


describe(satisfaction$average_monthly_hours) #gives SE and sd

###############################################################
###############################################################
## Each year, the company sets a target for average employee
## evaluation score.  Last year, the average score was 71%.
## This year, the company set a goal of 71.5%
##
## The average employee evaluation score goal is 71.5% (or .715).
##
## Are this year's resulsts statistically significantly 
## different than the goal?


t.test(satisfaction$last_evaluation_score, mu=.715)

describe(satisfaction$last_evaluation_score)

0.17/sqrt(15000) 
#did this because the SE came as 0, which is not true, so you have to divide sd by sqrt of n
# [sd/sqrt(n)]

###############################################################
###############################################################
## Interpretation


# on average, employees scored higher than the average goal of 0.715 (M= 0.716; SE= 0.001)
# however, this difference is not significant, t(14999) = 0.79, p= 0.431
# because it isn't significant, we do not do a confidence interval 



###############################################################
###############################################################
## This year's average employee evaluation score (M = 71.6%) is
## actually higher than 71.5%.
##
## Are this year's results statistically significantly 
## higher than the goal?


t.test(satisfaction$last_evaluation_score, mu=0.715, alternative="greater")

###############################################################
###############################################################
## Interpretation
##

# on average, empoloyees score higher than 0.715 (M = 0.716; SE= 0.001)
# however, it is not signficantly higher, t(14999) = 0.79, p = 0.216
# not significant, so no confidence interval



## Are this year's results statistically significantly 
## higher than 71%? 


t.test(satisfaction$last_evaluation_score, mu=.71, alternative="greater")


###############################################################
###############################################################
## Interpretation
##

# on average, employees score higher than 0.71 (M = 0.716; SE = 0.001)
# which is significantly higher, t(14999) = 4.365, p< 0.001
# we are 95% confident that the true average evalution score is at least 71.4%



## What if I want a 99% confidence interval? 
## What is the interpretation?


t.test(satisfaction$last_evaluation_score, mu=.71, alternative = "greater", conf.level = 0.99)

###############################################################
###############################################################
## Interpretation
##

# on average, employees score higher than 0.71 (M=0.716; SE=0.001)
# which is significanlty higher, t(14999) = 4.365, p < 0.001
# we are 99% confident that the true average evalution score is at least 71.3%



###############################################################
###############################################################
## 
## Your turn.
##
## When data were collected last year, the average years spent
## with the company was 3.475.
##
## Is the higher average years this year statistically significantly 
## higher than last year?
##
## Include a 90% confidence interval?

t.test(satisfaction$years_spent_at_company, mu=3.475, alternative= "greater", conf.level = 0.90)

describe(satisfaction$years_spent_at_company)


###############################################################
###############################################################
## Interpretation
##

# on average, employee time with company (M=3.498; SE= 0.01)
# is signficantly higher than last year's average time, t(1499) = 1.946, p = 0.025
# we are 90% confident that the true average years spent with company is at least 3.483 years


###############################################################
###############################################################
## Homework:
## The csv file '2011_Home_Sales.csv' contains data for 104
## houses across the US.  The "Sale Price" variable represents
## the sales price of the house in 2011.
##
## Assume that the average sales price for homes in those 
## neighborhoods in 2011 was $162,487.
##
## Using an alpha of 0.05, did these homes sell significantly 
## higher than the average selling price for the neighborhood?
##
## If you use an alpha of 0.01, did these homes sell significantly 
## higher than the average selling price for the neighborhood?
##
## Find and interprent a 92% confidence interval for the 2011
## average selling price for these neighborhoods.
##
## Write up your results in a Word document using APA format.
## Include at the end of the document, a copy of your output
## from the console window.

###############################################################
###############################################################