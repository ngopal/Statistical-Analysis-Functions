#!/usr/bin/env R

#gather input
args = commandArgs()
#print(args)

#pinpoint the input file
file <- args[6]
print(file)
data <- read.table(file, header=TRUE)
print(data)

pdf("PCA.pdf")

# perform PCA
pca <- prcomp(data, retx=TRUE, center=TRUE, scale. = TRUE)
print(pca)

# general PCA variance plot
plot(pca, main="PCA")
# special PCA variance plot
barplot(pca$sdev/pca$sdev[1], main="PCA (Normalized) to standard deviation")

#plot variance1 vs variance2
plot(pca$rotation[,1], pca$rotation[,2], main="PC1 Rotation vs PC2 Rotation")

#plot variance1 vs variance2
plot(pca$x[,1], pca$x[,2], main="PC1 X vs PC2 X")


cldata <- kmeans(pca$x, 2)
print(cldata)
plot(pca$x, col=cldata$cluster, main="(Cluster Colored) PC1 vs PC2")

biplot(pca)

summary(pca) #summary
cor(data, pca$x[,1:2]) # contributions of variables to 2 PC's

dev.off()

warnings()
