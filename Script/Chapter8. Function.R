###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 8. Function
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

# Function ####
# Writing functions is a core activity of an R programmer
# Functions are often used to encapsulate a sequence of expressions that need to be executed numerous times
# 

# Function in R ####
# Functions in R are “first class objects”, which means that they can be treated much like any other R object
# Functions can be passed as arguments to other functions
# This is very handy for the various apply functions, like lapply() and sapply()
# Functions can be nested, so that you can define a function inside of another function
# 

# Your first function ####
# Functions are defined using the function() directive and are stored as R objects just like anything else
# Here’s a simple function that takes no arguments and does nothing.

f <- function() {
  # empty argument
}
class(f) # Function has their own class
f() # NULL because of missing argument

# create a function that actually has a non-trivial function body.
f <-  function() {
  cat("Hello world\n")
}
f()
# The last aspect of a basic function is the function arguments
# For this basic function, we can add an argument that determines 
# how many times “Hello, world!” is printed to the console.
f <- function(num) {
  for(i in seq_len(num)){
    cat("Hello World\n")
  }
}
f() # Need to assign an argument
f(4)
?num
#  if you find yourself doing a lot of cutting and pasting, 
# that’s usually a good sign that you might need to write a function.

# This next function returns the total number of characters printed to the console.
f <- function(num) {
  hello <- "Hello, world\n"
  for(i in seq_len(num)){
    cat(hello)
  }
  chars <- nchar(hello) * num
  chars
}
# In R, the return value of a function is always the very last expression that is evaluated
# here is a return() function that can be used to return an explicity value from a function
# 
test <- f(3)
test
f() # Error because the default value was not determined
# We can create default value as num = 1 from function above

f <- function(num = 1) {
  hello <- "Hello, world\n"
  for(i in seq_len(num)) {
    cat(hello)
  }
  chars <- nchar(hello) * num
  chars
}
f() # Print default value, that is 1
f(5)
f(2)

