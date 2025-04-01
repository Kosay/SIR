# SIR
Assumptions,  equations, solutions, plots, discussions for cases.

# Epidemic Models

We assume that the infection depends on contact between infected and susceptible individuals. The infection does not depend on personality factors (age, gender, and race). Also, the model is homogenous mixing in the community, and the population size is fixed (no immigration nor new births). When an individual dies because of the infection, the individual will belong to the removed individuals.

1. $S(t)$ is the number of susceptible individuals at time $t$,
2. $I(t)$ is the number of infectious individuals at time $t$,
3. $R(t)$ is the number of removed (and immune) or deceased individuals at time $t$,
4. N is the community size, and it is fixed. We assume $N$ is big enough to accept the S(t), I(t), and R(t) are differentiatable functions.


We will use fractions of susceptible, infected, and removed individuals. $s(t) = S(t)/N$, $i(t) = I(t)/N$, and $R(t) = r(t)/N$.

- Infection transmissibility $p$ is the probability of infection when a susceptible individual contacts an infected individual,

- An effective contact is a contact between a susceptible and an infected individual, in which the susceptible individual becomes infected,

- The total contact number $k$ is the mean number of contacts, effective or not effective, for an infected individual per unit time, and it is a constant,

- Let $\lambda = kp$. Since not all contacts cause infections, and the transmissibility is $p$, on average, each infected individual infects new $\lambda s(t)$ individuals per time unit.

- $\gamma$ is the rate of newly removed individuals per infected individuals per time unit. It means mathematically:

\begin{equation}
\gamma = \lim_{\Delta t \to 0} \dfrac{R(t+\Delta t)-R(t)}{I(t) \Delta t } \qquad \qquad (1).
\end{equation}


If the conditions do not change (by a treatment or another reason), we can assume $\gamma$ is a constant. We assume $\gamma > 0$ is a constant,

- The expected duration of infection $d$ is the mean number of time units for an infected individual to become removed. If an infected individual needs $d$ time unit to become removed, then $\gamma = \dfrac{1}{d} > 0$, 

