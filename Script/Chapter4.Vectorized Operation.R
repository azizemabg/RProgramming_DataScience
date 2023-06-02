###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 3. Vectorized Operation
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

# Vectorized operation ####
# Many operations in R are vectorized, meaning that operations occur in parallel in certain R objects
x <- 1:4 
y <- 6:9
z <- x + y
z

# Without vectorization, you’d have to do something like
z <- numeric(length(x))
for(i in seq_along(x)) {
  z[i] <- x[i] + y[i]
}
z
# Another operation you can do in a vectorized manner is logical comparisons
# suppose you wanted to know which elements of a vector were greater than 2
x
x > 2
x >= 2
x < 2
y == 8
# Notice that these logical operations return a logical vector of TRUE and FALSE.
# subtraction, multiplication and division are also vectorized.
x - y
x * y
x / y

# Vectorized Matrix Operation ####
