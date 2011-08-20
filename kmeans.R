#!/usr/bin/env R

#gather input
args = commandArgs()
#print(args)

#pinpoint the input file
file <- args[6]
NUMclusters <- as.integer(args[7])

print(file)
data <- read.table(file, header=TRUE)
print(data)

pdf("kmeans.pdf")

# perform PCA
fit <- kmeans(data, NUMclusters)
print(fit)

# control plot
plot(data)

# quick cluster plot
plot(data, col=fit$cluster)

# cluster plot with guidelines
library(cluster)
clusplot(data, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

dev.off()

warnings()
