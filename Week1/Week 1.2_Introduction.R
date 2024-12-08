#--------------------------------------------------#
# Title: SDS 313 Introduction to R
# Last date modified: 8/28/2024
#--------------------------------------------------#

# This file is called an R script (a file containing R code)
# Notice that this script is called "getstaRted.R" (see tab above)
# Think of R files (.R) as text files that contain R code

# Hashtags are used before text comments to explain what the code is for 
## You can put more than one if you want!

###############  Let's get staRted! ###############

# To submit code, put your cursor *anywhere on the line* and either:
# - hit ctrl + enter for PC or cmd+enter for Mac users
# - click "Run" on the top right of this pane
print("Welcome to R!")

# Note: the output popped out on the bottom pane, the Console!


#--------------------------------------------#
## R is a calculator -----------------------##
#--------------------------------------------#

6*6 # 6 times 6
6/2 # 6 divided by 2
6^2 # 6 squared

##### Try it! #####
# Multiply 6 by all previous whole numbers (except 0). 
# Note: This is called the factorial of 6.
6*5*4*3*2*1


#--------------------------------------------#
## Built-in functions and Documentation ----##
#--------------------------------------------#

# Base R comes with many built-in functions:
factorial(6) # better to use this function for calculating factorials!
log(10) # surprising?

# If you would like to know more about a function: 
# Put a `?` in front of the function name
?log

# Note: the documentation appears in the Output pane!

##### Try it! #####
# In the documentation you can read about the function that computes log base 10.
# What is log base 10 of 100?
log10(100)


#--------------------------------------------#
## Objects ---------------------------------##
#--------------------------------------------#

# The pane in the top right is the Environment. 
# This is where objects (like datasets) will go!
# There's nothing there yet because we haven't created any objects

# By convention, the notation "<-" is an assignment operator
# Note: You can also use "=" but it is not common to do so in the R community

## Values
# Let's consider some values and save them as objects
variety <- "Gala"
sweetness <- 3
red <- TRUE

# Object names... 
# ...start with a letter, 
# ...shouldn’t contain spaces, 
# ...should not be predefined in R (e.g., do not label an object "log")

# Use class() to check what type of data we saved in the environment
class(variety)
class(sweetness)
class(red)


## Vectors / Variables
# We can save several values in one object called a vector
# Combine elements with c() which stands for concatenate

# Vector with character values
varieties <- c("Fuji", 'Gala', 'Golden Delicious', 'Granny Smith') 
# Note that either ' ' or " " can be used to define character values
# Quick Note!!! R starts with 1, not 0, for counting.

# Vector with numeric values
sweetness <- c(1,2,3,4)
# or in this case
sweetness <- 1:4

# Vector with logical values
red <- c(TRUE,TRUE,FALSE,FALSE)

# We can apply functions to vectors, for example the sum() function
sum(varieties) # CANNOT SUM CHARS
sum(sweetness)
sum(red) # CAN ADD TRUE/FALSE AS TRUE = 1 AND FALSE = 0, SO RESULT IS 2

# Note: the values of a vector must be of the same type
c(1,2,3,4, "very sweet")

# Find how many values a vector contains
length(sweetness)

##### Try it! #####
# What is the mean value of sweetness? 
sum(sweetness)/length(sweetness)
mean(sweetness)

## Data frames
# We can save several vectors in one object called a data frame
sweet_apples <- data.frame(
  variety = c('Fuji', 'Granny Smith', 'Gala', 'Golden Delicious'),
  sweetness = c(1, 4, 3, 3),
  red = c(TRUE,FALSE,TRUE,FALSE)
)
sweet_apples

# Rows represent different observations, columns represent different variables
str(sweet_apples) # Use str() to get more information about a data frame

# You can access the different variables with $
sweet_apples$variety

##### Try it! #####
# Calculate the mean sweetness in this data frame
mean(sweet_apples$sweetness)


###############  Your turn! ###############

# In a group of 5-6 participants, there is:
# - a facilitator: participant with first first name in alphabetical order
# - a reporter: participant with last first name in alphabetical order
# The Team: me, Brendan Ryan, Kavya Malgi, Sofia Vaquera

# Part 1: Icebreaker questions
# Each participant selects one question below and answers it
# a. How has your first week of classes been so far?
# b. If you were a wrestler, what would be your entrance theme song?
# c. What is your spirit animal?

# Part 2: Collect and analyze data!
# a. Each participant creates a data frame containing the following information
# - the names of each participant in the group (including yourself)
# - their age: all 18, avg = 18
# - their height: 66, 62, 68, 67, avg = 65.75


# b. Find the mean age and height of students in your group. 
# Reporter, fills in the following spreadsheet (copy/paste link in browser):
# https://docs.google.com/spreadsheets/d/1t7xwSI4u_EVrxg6sVf_hk6J_ABpG4jOBT_1bx4F2Kbk/edit?usp=sharing

# c. Do you think all groups will get the same mean age? mean height? Why/Why not?
# Reporter, get ready to share with the rest of the class
room8 <- data.frame(
  names = c('Arun', 'Brendan', 'Kavya', 'Sofia'),
  age = c(18, 18, 18, 18),
  height = c(66, 62, 68, 67)
)
room8
mean(room8$age)
mean(room8$height)


#--------------------------------------------#
## Basic logic -----------------------------##
#--------------------------------------------#

# We can use logic to test if some statements are TRUE or FALSE
# Here are a few examples:
# == means "equal"
2 == 2
2 == 3

# != means "not equal"
2 != 3

# < means "less than" while <= means "less than or equal to"
2 < 2
2 <= 2

# and > means "greater than" while >= means "greater than or equal to"


#--------------------------------------------#
## Indexing --------------------------------##
#--------------------------------------------#

# We can focus on some parts of a vector or data frame by indexing some values 
# Using brackets [ ] for some indices
varieties # recall this object
varieties[2]
varieties[2:4]

# We can also do some logical indexing (based on logic criteria)
sweetness # recall this object
sweetness > 2 # shows logical indexing (so 1, 2 would be FALSE and 3, 4 would be TRUE)

# And only keep the values of the object for which the logic is TRUE
sweetness[sweetness > 2]

# Indices for a data frame refer to row, column 
sweet_apples # recall this object
sweet_apples[2,1]
sweet_apples[2,]
sweet_apples[,1]
sweet_apples[2] # why?

# Let's try some logical indexing with a data frame
# sweet_apples$variety == 'gala' # R is Case-Sensitive, so g has to be G
sweet_apples$variety == 'Gala'

# Only consider apples with a sweetness greater than 2
sweet_apples[sweet_apples$sweetness > 2,]

##### Try it! #####
# Save a new object, called red_apples, with only red apples in it
red_apples <- sweet_apples[sweet_apples$red == TRUE,] # HAVE TO USE THE COMMA TO DENOTE A SUBSET
red_apples

#--------------------------------------------#
## Get ready for next week -----------------##
#--------------------------------------------#

## Importing data
# See what the current working directory is
getwd()

# Change the working directory if needed - must use quotes!
setwd('../desired path/')

# Import data from the working directory: use .csv format if possible
BikeData <- read.csv("BikeData.csv")


## Installing packages
# Install the package (only need to do this once)
install.packages('ggplot2')
install.packages('RColorBrewer')
install.packages('rmarkdown')

# Upload the library (must do so with every new session of R)
library(ggplot2)
library(RColorBrewer)
library(rmarkdown)


## Avoid cluttering the environment and do some regular cleaning
# Removes a specific object from the environment
rm(room8)
rm(red_apples)

# Or clear the entire environment (you can also use the broom)
rm(list=ls())
