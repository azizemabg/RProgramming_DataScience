###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 6. Managing dataframe with dplyr package
#            Date: 1 June 2023
#
###############################################################################
###############################################################################
install.packages("tidyverse")
library(tidyverse)

# Dataframe ####
# The data frame is a key data structure in statistics and in R.
# The basic structure of a data frame is that there is one observation per row and each column represents a variable,
# some tools like the subset() function and 
# the use of [ and $ operators can be used to extract subsets of data frames
# However, other operations, like filtering, re-ordering, and collapsing, 
# can often be tedious operations in R whose syntax is not very intuitive. 
# The dplyr package is designed to mitigate a lot of these problems 

# dplyr package ####
# One important contribution of the dplyr package is that it provides a “grammar” 
# (in particular, verbs) for data manipulation and for operating on data frames

# dplyr grammar ####
# Some of the key “verbs” provided by the dplyr package are
select() # select the columns of a data frame
filter() # extract the rows of a data frame
arrange() # reorder rows of a data frame
rename() # rename variables in a data frame
mutate() # add new variables/columns or transform existing variables
summarise() # generate summary statistics of different variables in the data frame
# %>%  # The “pipe” operator is used to connect multiple verb actions together into a pipeline

# select ####
