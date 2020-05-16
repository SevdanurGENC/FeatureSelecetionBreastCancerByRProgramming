# Libraries
install.packages("Boruta")
install.packages("ranger")
install.packages("mlbench")
install.packages("caret") 
library(Boruta)
library(ranger)
library(mlbench)
library(caret) 

getwd() 
setwd("C:/Users/Nano/Desktop")
# Data
dataR2 <- read.csv("dataR2.csv") 
str(dataR2)

# Feature Selection
set.seed(111)
boruta <- Boruta(Classification ~ ., data = dataR2, doTrace = 2, maxRuns = 500)
print(boruta)
plot(boruta, las = 2, cex.axis = 0.7)
plotImpHistory(boruta)

# Tentative Fix
bor <- TentativeRoughFix(boruta)
print(bor)
attStats(boruta)
 
