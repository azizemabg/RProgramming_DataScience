###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 1. R Nuts and Bolts
#            Date: 1 June 2023
#
###############################################################################
###############################################################################
# R Nuts and Bolts ####

# Entering input: This is very basic tutorial regarding how to store a value in variable
# Example as below

c <- 1
text <- "Hello guys"
# Character (#) is comment, this the code will not be executed

# The result will be printed if you either type the name of variable or using print() function
x
print(c) # the result is the same with above

c <- 11:30
c
# When an R vector is printed you will notice that an index for the vector is printed in square brackets

# in R, there are different data type such as charachter, numeric, integers, complex, and logical

# Creating vector ####
# Function c() stands for concacenate can be used to create a vector

x <- c(0.5, 0.6) # Numbers
x <- c(TRUE, FALSE) # Logical 
x <- c(T, F) # Logical
x <- c("a", "b", "c") # Character 
x <- 9:29  # Integers
x <- c(1+0i, 2+4i) # Complex 
# Note that in the above example, T and F are short-hand ways to specify TRUE and FALSE

# You can also use the vector() function to initialize vectors.
x <- vector("numeric", length = 10)

# Mixing Object ####
# There are occasions when different classes of R objects get mixed together. 
# Sometimes this happens by accident but it can also happen on purpose

y <- c(1.7, "a") ## character 
y <- c(TRUE, 2) ## numeric 
y <- c("a", TRUE) ## character
class(y)

# Explicit Coercion ####
#  Objects can be explicitly coerced from one class to another using the as.* functions, if available.
x <- 0:6
x
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# Sometimes, R can’t figure out how to coerce an object and this can result in NAs being produced.
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)
# When nonsensical coercion takes place, you will usually get a warning from R.

# Matrices ####
# Matrices are vectors with a dimension attribute. 
# The dimension attribute is itself an integer vector of length 2 
# (number of rows, number of columns)

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)
# Matrices are constructed column-wise, so entries can be thought of 
# starting in the “upper left” corner and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Matrices can also be created directly from vectors by adding a dimension attribute.
m <- 1:10
m
dim(m) <- c(2, 5)
m

# Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)

# List ####
# Lists are a special type of vector that can contain elements of different classes. 
# Lists are a very important data type in R and you should get to know them well.
# Lists can be explicitly created using the list() function, 
# which takes an arbitrary number of arguments.
x <- list(1, "a", TRUE, 1 + 4i)
x
# We can also create an empty list of a prespecified length with the vector() function
x <- vector("list", length = 5)
x

# Factors ####
# Factors are used to represent categorical data and can be unordered or ordered.
# One can think of a factor as an integer vector where each integer has a label. 
# Factors are important in statistical modeling and are treated 
# specially by modelling functions like lm() and glm().
# Factor objects can be created with the factor() function.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)
# Often factors will be automatically created for you when you read a dataset
# Those functions often default to creating factors when they encounter data that look like characters or strings
# The order of the levels of a factor can be set using the levels argument to factor().
# This can be important in linear modelling because the first level is used as the baseline level.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x # Levels are put in alphabetical order
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

# Missing values (NAs) ####
# Missing values are denoted by NA or NaN for q undefined mathematical operations.
# Missing values are denoted by NA or NaN for q undefined mathematical operations.
# is.nan() is used to test for NaN
# NA values have a class also, so there are integer NA, character NA

## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)
x
is.na(x) # Return a logical vector indicating which elements are NA

## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x) #Detect both NA and NAn
is.nan(x) # Only detect nan

# Dataframes ####
# Data frames are used to store tabular data in R.
# package dplyr5 has an optimized set of functions designed to work efficiently with data frames
# Unlike matrices, data frames can store different classes of objects in each column.
# Matrices must have every element be the same class (e.g. all integers or all numeric).
# data frames have a special attribute called row.names which indicate information about each row of the data frame
# ata frames can also be created explicitly with the data.frame() function
# Data frames can be converted to a matrix by calling data.matrix()
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)

# Names ####
# R objects can have names, which is very useful for writing readable code and self-describing objects. 
# Here is an example of assigning names to an integer vector.
x <- 1:3
x
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles")
x

# Lists can also have names, which is often very useful.
x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x
names(x)

# Matrices can have both column and row names.
m <- matrix(1:4, nrow = 2, ncol = 2)
m
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

# Column names and row names can be set separately using the colnames() and rownames() functions.
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m
# Note that for data frames, there is a separate function for setting the row names, the row.names() function
# data frames do not have column names,
# So to set the column names of a data frame just use the names() function

