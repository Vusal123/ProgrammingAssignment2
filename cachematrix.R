## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the matrix inverse
## get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
	matInv <- NULL
    set <- function(y) {
        x <<- y
        matInv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) matInv <<- solve
    getinverse <- function() matInv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## The following function calculates the inverse of 
## the special "matrix" created with the above function.
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and 
## sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
    matInv <- x$getinverse()
    if(!is.null(matInv)) {
        message("getting cached data")
        return(matInv)
    }
    data <- x$get()
    matInv <- solve(data, ...)
    x$setinverse(matInv)
    matInv		
		
}
