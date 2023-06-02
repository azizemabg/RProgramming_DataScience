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
getwd()
setwd("/Volumes/DNAZIZ/RProgramming_DataScience/Data")

chicago <- readRDS("chicago.rds")
View(chicago)
dim(chicago)
str(chicago)
# select() function can be used to select columns of a data frame that you want to focus on
# any given analysis might only use a subset of variables or observations. 
# The select() function allows you to get the few columns you might need
# Suppose we wanted to take the first 3 columns only.
names(chicago)[1:3]
subset <- select(chicago, city:dptp)
head(subset)
# Select normally cannot be used with names or strings, 
# but inside the select() function you can use it to specify a range of variable names.
# You can also omit variables using the select() function by using the negative sign.
names(chicago)
head(select(chicago, -(city:dptp))) # Extracting all of the variables excluding the negative sign
#  indicates that we should include every variable except the variables city through dptp.
i <- match("city", names(chicago))
i
j <- match("dptp", names(chicago))
j # Give the position of the variabe name
names(chicago)
head(chicago[, -(i:j)]) # Extracting all variables excluding from city till dptp
# select() function also allows a special syntax that allows you to specify variable names based on patterns
# for example, if you wanted to keep every variable that ends with a “2”,
subset <- select(chicago, ends_with("2"))
head(subset)
str(subset)

# Or if we wanted to keep every variable that starts with a “d”, 
subset <- select(chicago, starts_with("d"))
head(subset)
str(subset)

# Filter ####
# The filter() function is used to extract subsets of rows from a data frame
# This function is similar to the existing subset() function in R but is quite a bit faster in my experience.
# Suppose we wanted to extract the rows of the chicago data frame 
# where the levels of PM2.5 are greater than 30
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)
dim(chic.f)
summary(chic.f$pm25tmean2)
# We can place an arbitrarily complex logical sequence inside of filter()
# for example extract the rows where PM2.5 is greater than 30 and 
# temperature is greater than 80 degrees Fahrenheit.

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80) # Using a logical order
head(chic.f)
dim(chic.f)

# Arrange ####
# e arrange() function is used to reorder rows of a data frame 
# according to one of the variables/- columns
# Reordering rows of a data frame (while preserving corresponding order of other columns) 
# is normally a pain to do in R. The arrange() function simplifies the process quite a bit.
# Here we can order the rows of the data frame by date, so that the first row is the earliest (oldest) observation
chicago <- arrange(chicago, date)
head(chicago)

# We can now check the first few rows
head(select(chicago, date, pm25tmean2), 3)
# and the last few rows.
tail(select(chicago, date, pm25tmean2), 3)
# Columns can be arranged in descending order too by useing the special desc() operator.
chicago <- arrange(chicago, desc(date)) # ordering the date column in descending way
head(chicago)
# Looking at the first three and last three rows shows the dates in descending order.
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

# Rename ####
# Renaming a variable in a data frame in R is surprisingly hard to do! 
# The rename() function is designed to make this process easier.
# Here you can see the names of the first five variables in the chicago data frame.
head(chicago[, 1:5], 3)
# dptp column is supposed to represent the dew point temperature adn 
# the pm25tmean2 column provides the PM2.5 data
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)
# The syntax inside the rename() function is to have the new name on the left-hand side 
# of the = sign and the old name on the right-hand side.

# Mutate ####
# The mutate() function exists to compute transformations of variables in a data frame.
# Often, you want to create new variables that are derived from existing variables and mutate() provides a clean interface for doing that
# Here we create a pm25detrend variable that subtracts the mean from the pm25 variable.
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)
# There is also the related transmute() function, which does the same thing as mutate()
# but then drops all non-transformed variables.
# Here we detrend the PM10 and ozone (O3) variables.
head(transmute(chicago,
               pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE), 
               o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE))) # Transfmute drop the rest of variables
# Note that there are only two columns in the transmuted data frame.

# Group_by ####
# The group_by() function is used to generate summary statistics from the data frame within strata defined by a variabl
# you might want to know what the average annual level of PM2.5 is.
# In conjunction with the group_by() function we often use the summarize() function (or summarise() for some parts of the world).
#  general operation here is a combination of splitting a data frame into separate pieces defined by a variable or group of variables (group_by())
# then applying a summary function across those subsets (summarize()).

# First, we can create a year varible using as.POSIXlt().
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
head(chicago)
# Now we can create a separate data frame that splits the original data frame by year
years <- group_by(chicago, year)
head(years)
dim(years)
dim(chicago)
# Finally, we compute summary statistics for each year in the data frame with the summarize() function.
summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE),
                     .groups = "drop")
# summarize() returns a data frame with year as the first column, and then the annual averages of pm25, o3, and no2.

# In a slightly more complicated example, we might want to know 
# what are the average levels of ozone (o3) and nitrogen dioxide (no2) within quintiles of pm25.
# we can actually do this quickly with group_by() and summarize().
# First, we can create a categorical variable of pm25 divided into quintiles.
qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE)
qq
chicago <- mutate(chicago, pm25.quint = cut(pm25, qq))
head(chicago)
# Now we can group the data frame by the pm25.quint variable
quint <- group_by(chicago, pm25.quint)
head(quint)
# Finally, we can compute the mean of o3 and no2 within quintiles of pm25.
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),
          no2 = mean(no2tmean2, na.rm = TRUE),
          .groups = "drop")
# From the table, it seems there isn’t a strong relationship between pm25 and o3, 
# but there appears to be a positive correlation between pm25 and no2. 

# Pipe operators %>% 
# The pipeline operater %>% is very handy for stringing together multiple dplyr functions in a sequence of operations. 
# every time we wanted to apply more than one function, 
# the sequence gets buried in a sequence of nested function calls that is difficult to read, i.e.
third(second(first(x)))
#  The %>% operator allows you to string operations in a left-to-right fashion,
first(x) %>% second %>% third

# Take the example that we just did in the last section 
# where we computed the mean of o3 and no2 within quintiles of pm25.
# 1. create a new variable pm25.quint
# 2. split the data frame by that new variable
# 3. compute the mean of o3 and no2 in the sub-groups defined by pm25.quint
# That can be done with the following sequence in a single R expression.

mutate(chicago, pm25.quint = cut(pm25, qq)) %>% 
  group_by(pm25.quint) %>%
  summarize(o3 = mean(o3tmean2, na.rm = TRUE),
  no2 = mean(no2tmean2, na.rm = TRUE), .groups = "drop") # the result is the same as the prvious code
# This way we don’t have to create a set of temporary variables along the way or create a massive nested sequence of function calls.
#  Once you travel down the pipeline with %>%, the first argument is taken to be the output of the previous element in the pipeline.

# Another example might be computing the average pollutant level by month.
# This could be useful to see if there are any seasonal trends in the data.
mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month) %>%
  summarize(pm25 = mean(pm25, na.rm = TRUE),
            o3 = max(o3tmean2, na.rm = TRUE),
            no2 = median(no2tmean2, na.rm = TRUE), .groups = "drop")
# Summary 
# dplyr package provides a concise set of operations for managing data frames.
# we can often conduct the beginnings of an exploratory analysis with the powerful combination of group_by() and summarize().
# dplyr can work with other data frame “backends” such as SQL databases
# There is an SQL interface for relational databases via the DBI package
# dplyr can be integrated with the data.table package for large fast tables
# 