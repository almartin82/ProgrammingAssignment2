## makeCacheMatrix and cacheSolve are utilities that 
## allow for the state of a matrix (the matrix, and related calculations)
## to be moved around in R.  
## if we have matrix `jobs` (a product of makeCacheMatrix),
## we can calculate its inverse by calling cacheSolve(jobs)
## the first time through, cacheSolve will see that jobs$getinverse() returns
## NULL, so it will calculate and store the inverse using jobs$setinverse().
## every subsequent call to cacheSolve(jobs) will use that cached computation,
## speeding computation.

## makeCacheMatrix initializes an empty 'matrix', which is really a list
## containing functions to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  #initialize the inverse as NULL to begin
  inverse <- NULL
  
  #given value y, set overwrites x with y, and resets inverse to NULL.
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  #get returns x unchanged
  get <- function() x
  
  #a function to store the inverse of the matrix on our special 'matrix'
  setinverse <- function(inverse_in) inverse <<- inverse_in
  
  #getinverse simply returns inverse unchanged
  getinverse <- function() inverse
  
  #returns a 'matrix' (list with 4 named entries)
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}




## cacheSolve calculates the inverse of the special 'matrix' created with
## makeCacheMatrix.  It first checks to see if the inverse has been
## calculated, and if so, gets the inverse from the cache and
## skips computation.  If not, it calculates the inverse of the matrix
## and sets the value in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}
