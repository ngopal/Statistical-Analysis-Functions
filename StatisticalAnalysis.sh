#!/usr/bin/env bash
# Written by Nikhil Gopal

FILE=$1;

Rscript hcluster.R $FILE;
Rscript kmeans.R $FILE 2;
Rscript pca.R $FILE;
