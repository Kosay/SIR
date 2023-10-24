## Load deSolve package
library(pracma)

p = 0.95
gamma <- 0.9
Y <- 1
X <- 1
s0 <- 1-1e-4
j = seq(0, 8 , by = 0.1)
for (k in j) {
  beta <- k*p
  R0 = beta / gamma
  S <- -(lambertWp(-s0 * R0 * exp(-R0)))/R0
  Y <- c(Y,S)
  X <- c(X, k)
}
X <- X[-1]
Y <- Y[-1]
plot(X, Y, type = "l", ylab = "Fraction of never infected individuals", 
     xlab = "Contact number")

