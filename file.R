library(dplyr)
library(caTools)
library(ROCR)


game <- read_delim("C:/Users/Kosasy/Desktop/game.csv", delim = "\t", 
                   escape_double = FALSE, trim_ws = TRUE)



split <- sample.split(game, SplitRatio = 0.8)
split



train_reg = game.iloc[1:51,1:16]
test_reg = game.iloc[5:7,1:16]

logistic_model <- glm(R ~ X1+X2+X3+X4+X5+X9+X10+X11+X12+X13+X14+X15, 
                      data = game, 
                      family = "binomial")

logistic_model

# Summary
summary(logistic_model)

