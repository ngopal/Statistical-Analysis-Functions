#!/usr/bin/env R

#gather input
args = commandArgs()
#print(args)

#pinpoint the input file
file <- args[6]
print(file)
data <- read.table(file, header=TRUE)
print(data)

pdf("hcluster.pdf")

# Ward Hierarchical Clustering
d <- dist(data, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward") 
plot(fit) # display dendogram
groups <- cutree(fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=5, border="red")

dev.off()

warnings()
