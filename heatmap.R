#!/bin/env Rscript

library(ggplot2)
library(reshape2)
require(scales)
require(plyr)
# import data
nba<-read.csv("http://datasets.flowingdata.com/ppg2008.csv")
nba$name<-with(nba,reorder(Name,PTS))

# merge data
b=nba.m<-melt(nba)

# scale
nba.m<-ddply(nba.m,.(variable),transform,rescale=rescale(value))

# plot
p<-ggplot(nba.m,aes(variable,Name)) + geom_tile(aes(fill=rescale),colour="white") + scale_fill_gradient(low="white",high="steelblue")
p
