#!/usr/bin/env R

#gather input
args = commandArgs()
#print(args)

#pinpoint the input file
file <- args[6]
print(file)
data <- read.table(file, header=TRUE)
print(data)

# Ward Hierarchical Clustering with Bootstrapped p values
library(pvclust)
fit <- pvclust(data, method.hclust="ward",
   method.dist="euclidean")
plot(fit) # dendogram with p values
# add rectangles around groups highly supported by the data
pvrect(fit, alpha=.95)

warnings()
