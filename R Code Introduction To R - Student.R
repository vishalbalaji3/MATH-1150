###############################################################
## MATH/QMGT-1150                                            ##
## R Code: Chapter 3                                         ##
##                                                           ##
## Field, A. P., Miles, J. N. V., & Field, Z. C. (2012).     ##
## Discovering Statistics Using R                            ##
##                                                           ##
## (c) 2011 Andy P. Field, Jeremy N. V. Miles & Zoe C. Field ##
###############################################################

## Before you start, a couple of important reminders:
## 1.  R is case-sensitive.  That is, Statistics is not the same as statistics.
## 2.  Spelling matters.  If you misspell something, R doesn't know what you're asking for.

###############################################################
###############################################################
## In R, you need to specify the directory where your files are located.
## Use setwd() to do this.  
## You can check to see what your current working directory is using getwd()

#setwd("H:/Personal Folders - FacStaff/thompkl1/stats")
#setwd("M:/stats")

#Vishal Balaji's home folder
setwd("M:/My Documents/math1150_stats")

## Note:  Remember to change all \ to /.  Also, remember to enclose in quotes.
getwd()



###############################################################
###############################################################
## Exercise 1                                                ##
##                                                           ##
## Set your working directory to your home folder            ##
## on the H: drive.                                          ##
##                                                           ##
## Check to ensure you have correctly set the                ##
## working directory.                                        ##
##                                                           ##
###############################################################
###############################################################


###############################################################
###############################################################
## Use R as a Calculator

exp(5)

seq(0, 30, by = 5)

rep("VB", 5)

log(10)

sqrt(5)

mean(4:1)

sequence_test <- 1:5
sequence_test

mean(3256314:4688768)/mean(234:356)

###############################################################
###############################################################
## Although you can do some stuff using base R, you'll need to use expanded
## capabilities you get from using "packages".  
## Packages are modules created for specific purposes.

## To use packages, you need to do two things:
## 1.  Install them  -->> install.packages function
## 2.  Load them  -->> library function

install.packages("reshape")  ## Note:  package must be enclosed in quotes.

## The install.packages function only installs the package.  Before you can use it,
## you must load it.  You only need to install it once, but you must load
## each time you start an R session (if you plan to use it during that session).

library(reshape)  ## Note that quotes are not needed when using the library function.


###############################################################
###############################################################
## Commands in R are made of two parts: Object and Functions.
## Objects and functions are separated by <-

## What is to the left of <- is "created from" whatever is on the right

## Commands take the form:

## Object <- Function


###############################################################
###############################################################
## One way to create objects is through the concatenate function.

instructors <- c("Dance", "Sullivan", "Thompson"); instructors

## We're creating an object "instructors" from Dance, Sullivan, and Thompson
## This object is called a vector.

## To remove one of the instructors from the object:

instructors <- instructors[instructors != "Sullivan"]; instructors

## To add a different instructor

instructors <- c(instructors, "Nicholson"); instructors

## instructors is a string variable.  That is, it is treated like text - even if it includes numbers.
## Variables can also be numeric.

sections <- c(1, 2, 3)
sectionSumm <- summary(sections)

## If the numbers are enclosed in quotes, it becomes a string variable.
## Remember - names were enclosed in text when we created the instructors object.

sections <- c("1", "2", "3")
summary(sections)


###############################################################
###############################################################
## Exercise 2                                                ##
##                                                           ##
## Create a vector containing the names of four friends:     ##
##                                                           ##
## John, Mary, Dave, Anne, Carl                              ##
## Name the vector "friends" (without the quotes)            ##
##                                                           ##
###############################################################
###############################################################
friends <- c("John", "Mary", "Dave", "Anne", "Carl")



###############################################################
###############################################################
## Exercise 3                                                ##
##                                                           ##
## The group of friends had the following test scores        ##
## in a class:                                               ## 
##                                                           ##
## John:  56, 67, 68, 73, 72, 64                             ##
## Mary:  73, 82, 80, 78, 79, 80                             ##
## Dave:  45, 42, 51, 46, 60, 54                             ##
## Anne:  78, 85, 92, 83, 77, 89                             ##
## Carl:  51, 49, 58, 54, 62, 68                             ##
##                                                           ##
## Create a vector for each person's scores.                 ##  
##                                                           ##
## Name the vectors:                                         ##
##                                                           ##
## john for John                                             ## 
## mary for Mary                                             ##
## dave for Dave                                             ##
## anne for Anne                                             ##
## carl for Carl                                             ##
##                                                           ##
###############################################################
###############################################################
john <- c(65, 67, 68, 73, 72, 64)
mary <- c(73, 82, 80, 78, 79, 80)
dave <- c(45, 42, 51, 46, 60, 54)
anne <- c(78, 85, 92, 83, 77, 89)
carl <- c(51, 49, 58, 54, 62, 68)



###############################################################
###############################################################
## Exercise 4                                                ##
##                                                           ##
## What is the average grade for each friend?                ##
##                                                           ##
###############################################################
###############################################################
mean(john)
mean(mary)
mean(dave)
mean(anne)
mean(carl)

## We can store the average grade for each student.

avgJohn <- mean(john)

###############################################################
###############################################################
## Exercise 5                                                ##
##                                                           ##
## Store the average grade for each friend.                  ##
## Use variables names of the form avgStudent                ##
##                                                           ##
###############################################################
###############################################################
avgMary <- mean(mary)
avgDave <- mean(dave)
avgAnne <- mean(anne)
avgCarl <- mean(carl)

avgJohn; avgMary; avgDave; avgAnne; avgCarl

###############################################################
###############################################################
## Other types of variables (or objects)



## Date variables
## Default date format is yyyy-mm-dd

## Remember that the friends had six tests.  Suppose the tests were
## taken on the following dates:

## September 12, 2019
## September 26, 2019
## October 8, 2019
## October 22, 2019
## November 5, 2019
## November 19, 2019

## You could create an object to hold those dates

testDate <- as.Date(c("2019-09-12", "2019-09-26", "2019-10-08", "2019-10-22", "2019-11-05", "2019-11-19"))




## Coding variables
## Sometimes we just need to know what category an observation falls into.

## Remember our friends.
##
## John  
## Mary 
## Dave  
## Anne  
## Carl  
##
## Suppose we want to keep up with their sex.
## Further suppose we will use the number 1 to represent female
## and the number 2 to represent male.
##
## The sex of the friends is:
##
## John - Male 
## Mary - Female
## Dave - Male  
## Anne - Female  
## Carl - Male
##
## We can create a variable to track the sex using 1 and 2

sex <- c(2,1,2,1,2) #Remember this creates a numeric variable
Sex <- factor(sex, levels = c(1:2), labels = c("Female", "Male"))




###############################################################
###############################################################
## Exercise 6                                                ##
##                                                           ##
## Create a string variable (vector) for the letter          ## 
## grade for each student:                                   ##
## John:  F, D, D, C-, C-, D                                 ##
## Mary:  C-, B-, B-, C+, C+, B-                             ##
## Dave:  F, F, F, F, D, F                                   ##
## Anne:  C+, B, A-, B-, C, B+                               ##
## Carl:  F, F, F, F, D, D+                                  ##
##                                                           ##
## Create a vector for each person's scores.                 ##  
##                                                           ##
## Name the vectors:                                         ##
##                                                           ##
## jGrade for John                                           ## 
## mGrade for Mary                                           ##
## dGrade for Dave                                           ##
## aGrade for Anne                                           ##
## cGrade for Carl                                           ##
##                                                           ##
## Each of the students are taking the class as either       ##
## a MWF class or a TTh class.                               ##
##                                                           ##
## John:  TTh                                                ##
## Mary:  TTh                                                ##
## Dave:  MWF                                                ##
## Anne:  MWF                                                ##
## Carl:  TTh                                                ##
##                                                           ##
## Create a coding variable for each person's schedule.      ##  
## Let 0 represent MWF and 1 represent TTh                   ##         
##                                                           ##
## Name the variable schedule.                               ##
###############################################################
###############################################################
jGrade <- c("F", "D", "D", "C-", "C-", "D")
mGrade <- c("C-", "B-", "B-", "C+", "C+", "B-")
dGrade <- c("F", "F", "F", "F", "D", "F")
aGrade <- c("C+", "B", "A-", "B-", "C", "B+")
cGrade <- c("F", "F", "F", "F", "D", "D+")

schedule <- c(1, 1, 0, 0, 1)
schedule <- factor(schedule, levels = c(0:1), labels = c("MWF", "TTh"))

###############################################################
###############################################################
## Manipulating variables

## Suppose we have 4 married couples with the following birthdates:

husband<-as.Date(c("1973-06-21", "1970-07-16", "1949-10-08", "1969-05-24"))
wife<-as.Date(c("1984-11-12", "1973-08-02", "1948-11-11", "1983-07-23"))

## We can determine the difference in age between the husband and wife

ageGap <- husband-wife

## The result is in number of days.  Divide by 365.25 to get the number of years.
ageGap <- ageGap/365.25

test1 <- as.Date("1973-06-21")
test2 <- as.Date("1984-11-12")
diff <- test1 - test2
###############################################################
###############################################################
## Importing files

## Most often, you have data in other formats that you need 
## to import into R rather than entering it directly.

## Set directory
setwd("M:/My Documents/math1150_stats")
getwd()


## Importing CSV files
lecturerData<-read.csv("Lecturer Data.csv", header = TRUE)
lecturerData$job<-factor(lecturerData$job, levels = c(1:2), labels = c("Lecturer", "Student"))

## Importing delimited files
# lecturerData<-read.delim("Lecturer Data.dat", header = TRUE)
# lecturerData<-read.delim("Lecturer Data.txt", header = TRUE)

## Although we won't have a need to import them, you can import files
## from other statistical software packages.

library(foreign)
lecturerData<- read.spss("S10Fall.sav",use.value.labels=TRUE, to.data.frame=TRUE)


###############################################################
###############################################################
## Exporting files

write.table(lecturerData, "Lecture Data.txt", sep="\t", row.names = FALSE)
write.csv(lecturerData, "project_1/Class Lecture Data.csv")



###############################################################
###############################################################
## Exercise 7                                                ##
##                                                           ##
## Save the three Lecturer Data files to your home folder.   ## 
##                                                           ##
## Import the CSV file as csvLecturer                        ##
## Import the DAT file as datLecturer                        ##
## Import the TXT file as txtLecturer                        ##
##                                                           ##
##                                                           ##
## Save the Metallica Data csv file to your home folder.     ##
## Import the csv file as metallica                          ##
## Export metallica as a txt file named Metalica Text.       ##
## Export metallica as a csv file named Metalica CSV.        ##       
##                                                           ##
###############################################################
###############################################################
csvLecturer <- read.csv("Lecturer Data.csv", header = TRUE)
datLecturer <- read.delim("Lecturer Data.dat", header = TRUE)
txtLecturer <- read.delim("Lecturer Data.txt", header = TRUE)

metallica <- read.csv("Metallica Data.csv", header = TRUE)
write.table(metallica, "Metalica Text.txt", sep = "\t", row.names = FALSE)
write.csv(metallica, "Metalica CSV.csv")


###############################################################
###############################################################
## Selecting and Subsetting Data

lecturerPersonality <- lecturerData[, c("friends", "alcohol", "neurotic")]
lecturerPersonality
lecturerOnly <- lecturerData[lecturerData$job=="Lecturer",]
lecturerOnly
alcoholPersonality <- lecturerData[lecturerData$alcohol > 10, c("friends", "alcohol", "neurotic")]
alcoholPersonality


## Subsetting
# Subsetting is the way I prefer!
lecturerOnly <- subset(lecturerData, job=="Lecturer")
alcoholPersonality <- subset(lecturerData, alcohol > 10, select = c("friends", "alcohol", "neurotic"))


#################################################################
#################################################################
## Exercise 8                                                  ##
##                                                             ##
## Use metallica data  for exercise 8.                         ## 
##                                                             ##
## Create a subset containing members less than 47 years old.  ##
## Create a subset containing members who became a father in   ##                        
## their 40s.                                                  ##
##                                                             ##
#################################################################
#################################################################

metallica <- read.csv("Metallica Data.csv", header = TRUE)

lessThan47 <- subset(metallica, Age < 47)
fatherhoodInFourties <- subset(metallica, fatherhoodAge < 50 & fatherhoodAge >= 40)

