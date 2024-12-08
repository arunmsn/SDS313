# Practice
7*14/3
4.2^4

# How to comment your code
# 4^2

# Functions
log(8) # Finds the natural log (ln) of the input number
sqrt(81) # Finds the square root of the input number
sqrt(-2) # Throws a warning, and then NaNs produced
?sqrt # Helps find out what arguments a function requirements

# Assigning and Indexing a Vector
my_vector <- c(25, -8, 11, 0, -2) # Assign a variable to a value using <-
# Concatenate a vector by using c(...)
mean(my_vector) # Finds the average of all numbers in the vector
my_vector > 0 # Boolean result, returning TRUE if a value is > 0 and FALSE otherwise
my_vector[my_vector > 0] # Indexing a vector, returning the values > 0

# Vectors and Logical Expressions
my_vector[my_vector != 11] # Returns all numbers in the vector not equal to 11
my_vector[my_vector > 20 | my_vector < 10] # Returns all numbers in the vector > 20 OR < 10
my_vector[my_vector > 20 & my_vector < 30] # Returns all numbers in the vector > 20 AND < 30
sum(my_vector > 20 & my_vector < 30) # Returns the sum of Boolean values (TRUE = 1, FALSE = 0) for the input

# Practice 
arun <- runif(20) # Randomly generates 20 numbers between 0 and 1 and assigns it to a vector with my name
arun
mean(arun) # mean of my vector
sum(arun < 0.5) # finds the amount of numbers in my vector of 20 with a value less than 0.5
arun[arun < 0.5] = 0 # sets all numbers with a value less than 0.5 to be 0
arun

rm(my_vector)
rm(arun)
