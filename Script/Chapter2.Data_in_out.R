###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 2. Getting Data in and Out of the R
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

# Getting data in and out of the R ####
# There are a few principal functions reading data into R.
# read.table, read.csv, for reading tabular data
# readLines, for reading lines of a text file
# source, for reading in R code files (inverse of dump)
#  dget, for reading in R code files (inverse of dput)
# load, for reading in saved workspaces
#  unserialize, for reading single R objects in binary form

# There are analogous functions for writing data to files
# write.table, for writing tabular data to text files (i.e. CSV) or connections
# writeLines, for writing character data line-by-line to a file or connection
# dump, for dumping a textual representation of multiple R objects
# dput, for outputting a textual representation of an R object
# save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
# serialize, for converting an R object into a binary format for outputting to a connection (or file).

# Reading data with read.table ####
# The read.table() function is one of the most commonly used functions for reading data.
# Getting help: help(read.table) or ?read.table
# 

# Textual and Binary format ####
# One can create a more descriptive representation of 
# an R object by using the dput() or dump() functions.
#  One way to pass data around is by deparsing the R object with dput()
# and reading it back in (parsing it) using dget()

## Create a data frame
y <- data.frame(a = 1, b = "a")
y
## Print 'dput' output to console
dput(y)

# The output of dput is can also directly saved it into R file

## Send 'dput' output to a file
dput(y, file = "y.R")
## Read in 'dput' output from a file
new.y <- dget("y.R") 
new.y

# Multiple objects can be deparsed at once using the dump function and read back in using source
x <- "foo"
y <- data.frame(a = 1L, b = "a")
x
y

# We can dump() R objects to a file by passing a character vector of their names.
dump(c("x", "y"), file = "data.R")
?dump      

# The inverse of dump() is source().
source("data.R")
str(y)

# Binary format ####
# The key functions for converting R objects into a binary format are save(), save.image(), and serialize(). 
# Individual R objects can be saved to a file using the save() function.

a <- data.frame(x = rnorm(100), y = runif(100)) 
b <- c(3, 4.4, 1 / 3)
a
b
## Save 'a' and 'b' to a file
save(a, b, file = "mydata.rda")
## Load 'a' and 'b' into your workspace
rm(a)
rm(b)
load("mydata.rda")

# If you have a lot of objects that you want to save to a file, 
# you can save all objects in your workspace using the save.image() function.
## Save everything to a file
save.image(file = "mydata.RData")
rm(list = ls())
## load all objects in this file
load("mydata.RData")
# Notice that I’ve used the .rda extension when using save() and 
# the .RData extension when using save.image().

# serialize() function is used to convert individual R objects
# into a binary format that can be communicated across an arbitrary connection
# When you call serialize() on an R object, the output will be 
# a raw vector coded in hexadecimal format.
x <- list(1, 2, 3)
x
?serialize()
serialize(x, NULL)

# Interfaces to the Outside World ####
# Data are read in using connection interfaces. 
# Connections can be made to files (most common) or to other more exotic things.
#  file, opens a connection to a file
# gzfile, opens a connection to a file compressed with gzip 
# bzfile, opens a connection to a file compressed with bzip2 
# url, opens a connection to a webpage
# connections are powerful tools that let you navigate files or other external objects.
# Those outside objects could be anything from a data base, a simple text file, or a a web service API.
#

# File connection ####
# Connections to text files can be created with the file() function
str(file)
args(file)

# For example, if one were to explicitly use connections to read a CSV file in to R, 
# it might look like this,

## Create a connection to 'foo.txt'
con <- file("foo.txt")
## Open connection to 'foo.txt' in read-only mode 
open(con, "r")
## Read from the connection 
data <- read.csv(con)
## Close the connection
close(con)
# Which is same as 
data <- read.csv("foo.txt")

# Reading Lines of a Text File ####
# Text files can be read line by line using the readLines() function.
# This function is useful for reading text files that may be unstructured or contain non-standard data.
## Open connection to gz-compressed text file
con <- gzfile("words.gz")
x <- readLines(con, 10)
# above example used the gzfile() function which is used to create a 
# connection to files compressed using the gzip algorithm
# it allows you to read from a file without having to uncompress the file first,

# Reading From a URL Connection ####
# readLines() function can be useful for reading in lines of webpages.
# web pages are basically text files that are stored on a remote server, there is conceptually 
# not much difference between a web page and a local text file

## Open a URL connection for reading
str(url)
con <- url("https://www.jhu.edu", "r")
## Read the web page
x <- readLines(con)
## Print out the first few lines
head(x)
