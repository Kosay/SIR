## Load deSolve package
library(deSolve)

## Create an SIR function
sir <- function(time, state, parameters) {
  
  with(as.list(c(state, parameters)), {
    
    dS <- - beta * S * I
    dI <-   beta * S * I - gamma * I
    dR <-                 gamma * I
    
    return(list(c(dS, dI, dR)))
  })
}
### Set parameters
## Proportion in each compartment: Susceptible 0.999999, Infected 0.000001, Recovered 0
init       <- c(S = 0.999, I = 0.001, R = 0.0)

## beta: infection parameter; gamma: recovery parameter
p =0.9
k= 10
k_after = 2
gamma = 0.25
beta = p * k
beta_after = p * k_after
breakTime = 10
end_Time = 20
step_Time_Unit =0.01
parameters <- c(beta , gamma)

times_before     <- seq(0, breakTime, by = step_Time_Unit)

## Finding values for contact number before reducing its value
out_before <- ode(y = init, times = times_before, func = sir, parms = parameters)
out_before <- as.data.frame(out_before)
## Initial values for the second part
init       <- c(S = out_before$S[breakTime/step_Time_Unit+1], 
                I = out_before$I[breakTime/step_Time_Unit+1],
                R = out_before$R[breakTime/step_Time_Unit+1])

parameters <- c(beta_after , gamma)
times_after    <- seq(breakTime, end_Time, by = step_Time_Unit)
out_after <- ode(y = init, times = times_after, func = sir, parms = parameters)
out_after <- as.data.frame(out_after)


out_reduced <- merge(x =out_before , y = out_after, all = TRUE)
out_reduced$time <- NULL
times_reduced    <- seq(0, end_Time, by = step_Time_Unit)
## Plot

matplot(x = times_reduced, y = out_reduced, type = "l",
        xlab = "Time", ylab = "Susceptible and Recovered", 
        main = "SIR Model with two k values",
        lwd = 1, lty = 1, bty = "l", col = 2:4)

