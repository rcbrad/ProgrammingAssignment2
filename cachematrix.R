## These functions will cache an inverted matrix for later use. 
## when called, it will return the the cached matrix if it exists
## or calculate the inverse and then return it. 

## this function caches the matrix

makeCacheMatrix <- function(x = matrix()) {

   m <- NULL 
   
   set <- function(y) {
      x <<- y 
      m <<- NULL 
   }
   
   get <- function () x 
      
   
   setmatrix <- function(solve) m <<- solve
   getmatrix <- function() m
   
   list (set = set, get = get, 
         setmatrix = setmatrix, 
         getmatrix = getmatrix)
}


## returns cached matrix if it exists or inverts matrix then returns it

cacheSolve <- function(x = matrix(), ...) {
      ## Return a matrix that is the inverse of 'x'
      m <- x$getmatrix()
      
      if(!is.null(m)) {
         message("getting cached data")
         return(m)
      }
      matrix <- x$get()
      m <-solve(matrix,...)
      x$setmatrix(m)
      m
}
