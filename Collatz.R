collatz <- function(input, step = 0, stop = FALSE){
  while(stop == FALSE)
  {
    if(input == 1){
      stop == TRUE
      return(step)
    }else{
      if(input%%2 == 0){
        place <- input/2
      }else{
        place <- 3 * input + 1
      }
      step <- step + 1
      input <- place
    }
  }
}

nums<-sapply(1:5000, Vectorize(collatz))
hist(nums)

help(sapply)
help(Vectorize)
help(hist)


collatz(input = 97)
