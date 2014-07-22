## This function will develop a set of functions that will store and retrieve
## the inverted matrix in to and from higher level variables.


##set - this function sets s and x to higher level variables
##get - retrieves the var x - which is the matrix
##setScore - sets s to the vaule of then inverted matrix, assigns it to a higher level var
##getScore - returns the var s - which is the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL ## sets s(local variable) to NULL
        set <- function (y){ ##this function sets s and x to higher level variables
                x<<-y 
                s<<-NULL
        }
        get <- function(){ 
                x
        }
        setScore <- function(score){ 
                s<<-score
        }
        getScore <- function(){##returns the var s
                s
        }
        ## populates a list with the functions developed above
        list(set = set, get = get, setScore = setScore, getScore = getScore)

}


## This function will check to see if the score has already been calculated, 
## if it has, it will retrieve it, if not it will calcultate it and store it for
## later use.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s<- x$getScore ##assigns the inverse matrix to S by calling the getScore function
        if(!is.null(m)){##checks to see that m has been assigned a value
                message("Getting cached data.") ##If m has been assinged a value then 
                return(s)                       ##the function just retrieves the already
                                                ##calculated value            
        }
        data <- x$get() ##if the if loop fails (score has not been calculate
                        ## previously), the function puts the matrix in 'data'
        
        s <- score(data) ##calculates the score and assigns it to s
        x$setScore(s)   ##Sets the newly calculated score to x by calling the 
                        ##setScore function       
}
