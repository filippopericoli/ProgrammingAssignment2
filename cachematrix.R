## Put comments here that give an overall description of what your
## functions do
## These functions cache the computation of the inverse of a matrix
## in order to save computation time, to avoid the repetition many
## times of the same computation

## Write a short comment describing this function
## The first computation creates a list containing a function to
## set the value of the matrix, get the value of the matrix,
## set the value of the inverse, get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<- inverse
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Write a short comment describing this function
## The second function calculates the inverse of the matrix
## that is created with the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
}
