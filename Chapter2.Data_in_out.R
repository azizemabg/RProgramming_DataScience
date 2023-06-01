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