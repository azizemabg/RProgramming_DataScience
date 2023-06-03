###############################################################################
###############################################################################
#            
#            Name: Muhammad Aziz Muslim
#            Tutorial: Applying R Programming for Data Science
#            Source: This tutorial is adapted from several R Programming Books
#            Chapter: 7. Control Structure
#            Date: 1 June 2023
#
###############################################################################
###############################################################################

# Control Structure ####
# Control structures in R allow you to control the flow of execution of a series of R expressions.
# control structures allow you to put some “logic” into your R code, rather than just always executing the same R code every time
# Commonly used control structures are
# if and else: testing a condition and acting on it
# for: execute a loop a fixed number of times
# while: execute a loop while a condition is true
# repeat: execute an infinite loop (must break out of it to stop)
# break: break the execution of a loop
# next: skip an interation of a loop

# IF-ELSE ####
# The if-else combination is probably the most commonly used control structure in R
# This structure allows you to test a condition and act on it depending on whether it’s true or false.
# For starters, you can just use the if statement.

if() {
  #do something
}
## Continue with the rest of the code
# above code does nothing if the condition is false. 
# If you have an action you want to execute when the condition is false, then you need an else clause

if(<condition>) {
  ## do something (if the condition is true)
} else {
  ## Do something else 
}

# You can have a series of tests by following the initial if with any number of else ifs.

if(condition) {
  # do something (if condition is true)
} else if(condition2) {
  # do something (if condition2 is ture)
} else {
  # do someting different not condition nor condition2
}

# Here is an example of a valid if/else structure.
## Generate a uniform random number
x <- runif(1, 0, 10)
x
?runif

if(x > 3) {
  y <- 10 } else { # Condition is true, therefore, y is executed to create variable 10
    y <- 0 }
# The value of y is set depending on whether x > 3 or not
# This expression can also be written a different, but equivalent, way in R.
y <- if(x > 3) {
  10
} else {
  0
}

# For loops ####
# For loops are pretty much the only looping construct that you will need in R.
# In R, for loops take an interator variable and 
# assign it successive values from a sequence or vector.
# For loops are most commonly used for iterating over the elements of an object (list, vector, etc.)

# For general for loops in R has following syntax:
for (variable in sequence) {
  # code to be executed
}

for(i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}

# The seq_along() function is commonly used in conjunction with for loops 
# in order to generate an integer sequence based on 
# the length of an object (in this case, the object x).

## Generate a sequence based on length of 'x'
x
for(i in seq_along(x)) { # Seq_along create integer sequence, it is equal with 1:4
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(koko in x) {
  print(koko)
}

# For one line loops, the curly braces are not strictly necessary.
for(i in 1:4) print(x[i])

# Nested for Loops ####
# for loops can be nested inside of each other.
x <- matrix(1:6, 2, 3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  } }
?seq_len
seq_len(nrow(x))
seq_len(ncol(x))

for(condition){
  for(condition2) {
    # Do something according to two conditions above if the condition is true
  }
}
# Nested loops are commonly needed for multidimensional or
# hierarchical data structures (e.g. matrices, lists)

# While Loops ####
# While loops begin by testing a condition
# If it is true, then they execute the loop body
# Once the loop body is executed, the condition is tested again
# until the condition is false, after which the loop exits.

count <- 0
while(count < 10) { # Body condition, if count less sthan 10
  print(count) # Action 1
  count <- count + 1 # Action 2, 
} # If loops or repeated action did not fulfil body condition, then action stopped
# While loops can potentially result in infinite loops if not written properly

z <- 5
set.seed(1)
?set.seed

while(z >= 3 && z <= 10) {
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) {
    z <- z + 1
  } else {
    z <- z - 1
  }
  }
print(z)
# Conditions are always evaluated from left to right
# in the above code, if z were less than 3, the second test would not have been evaluated.

# Repeat loops ####
# repeat initiates an infinite loop right from the start.
# The only way to exit a repeat loop is to call break.
# One possible paradigm might be in an iterative algorith 
# where you may be searching for a solution and you don’t want 
# to stop until you’re close enough to the solution

x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate()
  if(abs(x1 - x0) < tol) { ## Close enough? break
  } else {
    x0 <- x1
  } }

# Next, break ####
# next is used to skip an iteration of a loop.
for(in in 1:1000) {
  if(i <= 20) {
    ## skip the first 20 iteration
    next
  }
  # Do something
}

# break is used to exit a loop immediately, regardless of what iteration the loop may be on.
for(i in 1:1000) {
  print(i)
  if(i > 20) {
    ## stop loop after 20 iteration
    break
  }
}

# Summary
# Control structures like if, while, and for allow you to control the flow of an R program
# Infinite loops should generally be avoided, even if (you believe) they are theoretically correct
# Control structures mentioned here are primarily useful for writing programs
# for command-line interactive work, the “apply” functions are more useful.

# Function ####


