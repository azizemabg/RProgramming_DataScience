###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 5. Date and Time
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

# Dates and Time ####
#  Dates are represented by the Date class and 
# times are represented by the POSIXct or the POSIXlt class.
# Dates are stored internally as the number of days since 1970-01-01 while 
# times are stored internally as the number of seconds since 1970-01-01.

# Dates in R ####
# Dates are represented by the Date class and can be coerced from a character string using the as.Date() function.
# This is a common way to end up with a Date object in R.
## Coerce a 'Date' object from character
x <- as.Date("1970-01-01")
x
class(x)
# You can see the internal representation of a Date object by using the unclass() function.
unclass(x)
unclass(as.Date("1970-01-02"))

# Times in R ####
# Times are represented by the POSIXct or the POSIXlt class.
# POSIXct is just a very large integer under the hood. It use a useful class when you want to store times in something like a data frame
# POSIXlt is a list underneath and it stores a bunch of other useful information like the day of the week, day of the year, month, day of the month
# There are a number of generic functions that work on dates and times
weekdays() #Give the day of the week
months() # Give the month name
quarters() # give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

# Times can be coerced from a character string using the as.POSIXlt or as.POSIXct function.
x <- Sys.time()
x
class(x)
# The POSIXlt object contains some useful metadata
x
p <- as.POSIXlt(x)
p
names(unclass(p))
unclass(p)
# You can also use the POSIXct format.
x <- Sys.time()
x # In POSIXct format
names(unclass(x))
unclass(x)
x$sec ## Can't do this with 'POSIXct'!
p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec
# there is the strptime() function in case your dates are written in a different format.
# strptime() takes a character vector that has dates and times and converts them into to a POSIXlt object.

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
datestring
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
# weird-looking symbols that start with the % symbol are the formatting strings for dates and times
class(x)
class(x[2]$sec)
names(unclass(x))
x[2]$hour

# Operation on dates and times ####
# You can use mathematical operations on dates and times. Well, really just + and -.
# You can do comparisons too (i.e. ==, <=)
x <- as.Date("2012-01-01")
x
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
y
x-y
x <- as.POSIXlt(x)
x
x - y
# nice thing about the date/time classes is that they keep track of all the annoying things 
# about dates and times, like leap years, leap seconds, daylight savings, and time zones.
# Here’s an example where a leap year gets involved.
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x
y
x - y
# Here’s an example where two different time zones are in play (unless you live in GMT timezone, 
# in which case they will be the same!).

## My local time zone
x <- as.POSIXct("2012-10-25 01:00:00")
x
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y
y - x
# Summary
#  Dates and times have special classes in R that allow for numerical and statistical calculations
# Dates use the Date class
# Times use the POSIXct and POSIXlt class
#  Character strings can be coerced to Date/Time classes using the strptime function
# or using as.Date, as.POSIXlt, or as.POSIXct

