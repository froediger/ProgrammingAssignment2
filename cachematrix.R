#########################

#### makeCacheMatrix creates a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of inverse of the matrix
## 4.  get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix( , )) {
s <- NULL
  set <- function(y) {
x <<- y
   s <<- NULL
}

get <- function() x
setsolve <- function(solve) s <<- solve
getsolve <- function()s
list(set = set, get = get,setsolve = setsolve,getsolve = getsolve)
}
 
#########################

#### The following function returns the inverse of the matrix 

## 1:check if the inverse has already been computed
## 1a Yes: it gets the result and skips the computation
## 1b No: it computes the inverse, sets value in the cache via setinverse function

## function assumes that the matrix is always invertible
 

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }

        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
	s
}

#########################

## Return a matrix that is the inverse of 'x'
## Sample:
## x = rbind(c(1, -3), c(-3, 1)
## s = makeCacheMatrix(x)
## s$get()

## cacheSolve(s)
