###############################################################
## MATH/QMGT-1150                                            ##
## Independent Samples t-Test Write-Up                       ##
##                                                           ##
## Written: 2019-11-06             Last revision: 2019-11-06 ##
## Vishal Balaji                                Revision: 02 ##
###############################################################

###############################################################
##                         Setup                             ##
###############################################################

setwd("M:/My Documents/math1150_stats/t-test")
getwd()

library(ggplot2)
library(pastecs)
library(reshape)
library(Hmisc)
library(WRS)
library(psych)

hSales <- read.csv("2011_Home_Sales.csv", header = TRUE)

###############################################################
##                 95% Confidence Interval                   ##
###############################################################

t.test(hSales$Sale.Price, mu = 162487, alternative = "greater", conf.level = 0.95)

###############################################################
##                 99% Confidence Interval                   ##
###############################################################

t.test(hSales$Sale.Price, mu = 162487, alternative = "greater", conf.level = 0.99)

###############################################################
##                 92% Confidence Interval                   ##
###############################################################

t.test(hSales$Sale.Price, mu = 162487, conf.level = 0.92)

describe(hSales$Sale.Price)

















