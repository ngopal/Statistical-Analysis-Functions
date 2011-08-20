#!/usr/bin/env R

#gather input
args = commandArgs()
#print(args)

#pinpoint the input file
file <- args[6]
print(file)
data <- read.table(file, header=TRUE)
print(data)

# Model Based Clustering
library(mclust)
fit <- Mclust(data)
plot(fit, data) # plot results 
print(fit) # display the best model

warnings()
