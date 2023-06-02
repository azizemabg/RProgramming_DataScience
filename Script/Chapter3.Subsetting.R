###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 3. Subsetting
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

rm(list = ls())

#  Subsetting R Objects ####
# There are three operators that can be used to extract subsets of R objects.
# The [ operator always returns an object of the same class as the original. It can be used to select multiple elements of an object
# The [[ operator is used to extract elements of a list or a data frame. It can only be used to extract a single element 
# The $ operator is used to extract elements of a list or data frame by literal name. Its semantics are similar to that of [[.

# Subsetting Vector ####
# Vectors are basic objects in R and they can be subsetted using the [ operator.
x <- c("a", "b", "c", "c", "d", "a")
x[1] # Extract the first element
x[2] # Extract the second element

# The [ operator can be used to extract multiple elements of a vector by passing the operator an integer sequence
x[1:4] # Extract from first untill fourth elements in the vector
# The sequence does not have to be in order; you can specify any arbitrary integer vec
x[c(1, 3, 4)]
# We can also pass a logical sequence to the [ operator to extract elements of a vector that satisfy a given condition
# For example, here we want the elements of x that come lexicographically after the letter “a”.
u <- x > "a" # Not a
u # Indicate position in vector x that is not a by letter
x[u] # subsetting the non a in the vector
# Another, more compact, way to do this would be to skip the 
# creation of a logical vector and just subset the vector directly with the logical expression
x[x > "a"]

# Subsetting a matrix ####
# Matrices can be subsetted in the usual way with (i,j) type indices
x <- matrix(1:6, 2, 3)
x
# We can access the (1, 2) or the (2, 1) element of this matrix using the appropriate indices.
x[1, 2] #first is row, second is column of the matrix
x[2, 1]
# Indices can also be missing. This behavior is used to access entire rows or columns of a matrix
x[1, ] ## Extract the first row
x[, 2] ## Extract the second column

# Dropping matrix dimention
# By default, when a single element of a matrix is retrieved, 
# it is returned as a vector of length 1 rather than a 1×1 matrix. 
# Often, this is exactly what we want, but this behavior can be turned off by setting drop = FALSE.
x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[1, 2, drop = FALSE] # Instead of getting single vector number, it gives us the matrix form (i,j)

# Similarly, when we extract a single row or column of a matrix,
x <- matrix(1:6, 2, 3)
x
x[1, ]
x[1, , drop = FALSE] # Matrix with 1 x 3 dimention

# Subsetting list ####
# Lists in R can be subsetted using all three of the operators mentioned above, 
# and all three are used for different purposes.
x <- list(foo = 1:4, bar = 0.6)
x
# The [[ operator can be used to extract single elements from a list
x[[1]]
# The [[ operator can also use named indices so that you don’t have to remember the
# exact ordering of every element of the list
# You can also use the $ operator to extract elements by name
x[["bar"]]
x$bar # Notice you don’t need the quotes when you use the $ operator.
# One thing that differentiates the [[ operator from the $ is that 
# the [[ operator can be used with computed indices. 
# The $ operator can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
name <- "foo"
## computed index for "foo"
x[[name]]
## element "name" doesnâ€TMt exist! (but no error here)
x$name # Give NULL
## element "foo" does exist
x$foo

# ubsetting Nested Elements of a List ####
# The [[ operator can take an integer sequence if you want to extract a nested element of a list.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
## Get the 3rd element of the 1st element
x[[c(1, 3)]]
## Same as above
x[[1]][[3]]
## 1st element of the 2nd element
x[[c(2, 1)]]
x[[2]][[1]]

# Extracting Multiple Elements of a List ####
# The [ operator can be used to extract multiple elements from a list.
# extract the first and third elements of a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
x[c(1, 3)]  # Note that x[c(1, 3)] is NOT the same as x[[c(1, 3)]].
# Remember that the [ operator always returns an object of the same class as the original

# Partial Matching ####
# Partial matching of names is allowed with [[ and $
x <- list(aardvark = 1:5)
x
x$a
x[["a"]]
x[["a", exact = FALSE]]

# Removing NAs Vaue ####
# A common task in data analysis is removing missing values (NAs).
x <- c(1, 2, NA, 4, NA, 5)
x
bad <- is.na(x) # To find the NA in vector x (NA will be true)
bad
x[bad] # it will give the NAs
x[!bad] # It will print out non NAs element

# What if there are multiple R objects and you want 
# to take the subset with no missing values in any of those objects? 
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
x
y
?complete.cases
good <- complete.cases(x, y)
good
x[good]
y[good]

# You can use complete.cases on data frames too.
attach(airquality)
head(airquality)
good <- complete.cases(airquality)
good
head(airquality[good, ]) # Extract using head function of observaton that does not contain NA
airquality[good, ] # Full observation without NAs

