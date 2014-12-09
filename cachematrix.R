

# The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
#
#  solve(A) return inverse of A

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the invers
makeCacheMatrix <- function(x = matrix()) {
         # check if matrix is square, otherwise return failure
        dm <-dim(x)
  
        if(length(dm) != 2)
        {
          print("Warning: matrix needs to be 2 dimensions (return NA)")
          return(NA)
        }
  
        if(dm[1] != dm[2])
        {
          print("Warning: matrix is square (return NA) ")
          return(NA)
        }
  
        # matrix is same as original
        #if(identical(m,m))
        #{
        #  print("matrix is identical to cached")
        #}
  
         m <- NULL
         set <- function(y) {
                 x <<- y
                 m <<- NULL
         }
         get <- function() x
         setinverse <- function(solve) m <<- solve(x)
         getinverse <- function() m
         list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse)

}


## Create a cache of matrix inverse - create inverse using solve

cacheSolve <- function(x, ...) {
         #TBD check if matrix is square, otherwise return failure
         #TBD check if matrix is same dimensions as cached inverse
         #TBD check if matrix is same as stored cache
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinverse()
         if(!is.null(m)) {
                 message("getting cached data")
                 return(m)
         }
         data <- x$get()
         m <- solve(data, ...)
         x$setinverse(m)
         m
}


# example to work from
#
## The first function, makeVector creates a special "vector", which is really a list containing a function to
## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean
# makeVector <- function(x = numeric()) {
#         m <- NULL
#         set <- function(y) {
#                 x <<- y
#                 m <<- NULL
#         }
#         get <- function() x
#         setmean <- function(mean) m <<- mean
#         getmean <- function() m
#         list(set = set, get = get,
#              setmean = setmean,
#              getmean = getmean)
# }
## The following function calculates the mean of the special "vector" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.
# 
# cachemean <- function(x, ...) {
#         m <- x$getmean()
#         if(!is.null(m)) {
#                 message("getting cached data")
#                 return(m)
#         }
#         data <- x$get()
#         m <- mean(data, ...)
#         x$setmean(m)
#         m
# }
