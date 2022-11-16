getVol <- function(length = 11, width = 8.5, height){
  volume <- (length-(2*height))*(width-(2*height))*(height)
  return(volume)
}

heights <- seq(from = 0, to = 4.25, by = .001)
plot(
  x <- heights,
  y <- getVol(height = heights),
  
  type = "l"
)

for (x in heights){
  if (getVol(height = x) == max(getVol(height = heights))){
    return(x)
  }
}

max(getVol(height = 3.4))

