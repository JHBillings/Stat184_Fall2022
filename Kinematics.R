#Function for determining points on a parabola
#Accel due to earth's gravity: -980.665 cm/sec2
#Initial Height: 200 cm
#Initial Velocity: 350 cm/sec

getHeight <- function(time, intVel, intHeight, grav = -980.665){
  result <- .5*grav*(time^2) + intVel*time + intHeight
  return(result)
}
times <- seq(from = 0, to = 2, by = .1)
plot(
  x = times,
  y = getHeight(time = times),
  type = "l"
)
