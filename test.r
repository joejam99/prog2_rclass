library(reshape)
source("cachematrix.R")


# Good tests
x <- rnorm(25)
x

m <- matrix(x, nrow = 5, ncol = 5) 
m

m1 <-makeCacheMatrix(m)

m1

z1 <- cacheSolve(m1)
z1

# repeat to see if cached is taken or does solve again
z2 <- cacheSolve(m1)

# solve should be the same
identical(z1,z2)

# should not allow a 1-d matrix
x1 <- 1
x2 <- makeCacheMatrix(x1)

x1 <- rnorm(20)
x1NQ <- matrix(x1, nrow = 5, ncol = 4) 
x2 <- makeCacheMatrix(x1NQ)

# should not allow a 2-d matrix that is not square

# change matix
x[1,1] <- 1.000001

# solve needs to redo solve since matrix has changed. 
z1 <- cacheSolve(x)

m <- matrix(x, nrow = 5, ncol = 5) 
m1 <-makeCacheMatrix(m)
z1 <- cacheSolve(m1)
# change matix
m[1,1] <- 1.000001
z2 <- cacheSolve(m1)
# can not change m1 value so can not change cache
