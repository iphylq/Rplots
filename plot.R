#!/usr/bin/env Rscript
Args<-commandArgs()
library(ggplot2)
library(grid)
library(easyGgplot2)
#library(splines)
library(reshape2)
f1<-Args[6]
f2<-Args[7]
f3<-Args[8]
f4<-Args[9]
pngname<-Args[10]
a1<-read.table(f1,header=TRUE)
a2<-read.table(f2,header=TRUE)
a3<-read.table(f3,header=TRUE)
a4<-read.table(f4,header=TRUE)
hb1<-read.table("hbond_dist.dat",header=TRUE)
#hb<-hb1[,c(1,2,3,4)]
#hb<-hb1[,c(1,5,6,7)]
hb<-hb1[,c(1,8,9,10)]
A1<-melt(a1,id.vars="Frame")
A2<-melt(a2,id.vars="Frame")
A3<-melt(a3,id.vars="Frame")
A4<-melt(a4,id.vars="Frame")
Hb<-melt(hb,id.vars="Frame")
#b<-names(a)
#n1<-b[2]
#n2<-b[3]
#a1<-a[,c(1,2)]
#a2<-a[,c(1,3)]
#a3<-a[,c(1,4,5,6)]
#d<-melt(a3,id.vars="Frame")

png(pngname,res=200,width=1280,height=1960)
#p1<-ggplot(a,aes(x=Frame/50,y=a[2])) + geom_point(size=1) + theme(axis.title.x=element_blank()) + ylab(b[2]) + scale_y_continuous(limits=c(0,15)) + geom_hline(aes(yintercept=5),colour="cyan",linetype="dashed")
#p2<-ggplot(a,aes(x=Frame/50,y=a[3])) + geom_point(size=1) + theme(axis.title.x=element_blank()) + ylab(b[3]) + scale_y_continuous(limits=c(0,15)) + geom_hline(aes(yintercept=5),colour="cyan",linetype="dashed")
#p1<-ggplot(a)+geom_point(aes)
p1<-ggplot(A1,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("G_O6-Na+") + scale_y_continuous(limits=c(0,10))
p2<-ggplot(A2,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("C_N4-Na+") + scale_y_continuous(limits=c(0,10))
p3<-ggplot(A3,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("G_N2-Na+") + scale_y_continuous(limits=c(0,10))
p4<-ggplot(A4,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("C_O2-Na+") + scale_y_continuous(limits=c(0,10))
#p3<-ggplot(a,aes(x=a[1]/50,y=a[4])) + geom_line(size=1,colour="red") + geom_smooth(method="loess") + theme_gray() + xlab("Time(ns)") + ylab(b[4])
#p3<-p3 + ggplot(a,aes(x=a[1]/50,y=a[5])) + geom_point(size=1,colour="blue")
#p3<-qplot(V1,V4,data=a,geom=c("line","point","smooth"))
p5<-ggplot(Hb,aes(x=Frame/50,y=value)) + geom_line(aes(color=variable)) + theme(legend.title=element_blank(),legend.position=c(0.9,0.75)) + ylab("Distance") + xlab("Time(ns)") + scale_y_continuous(limits=c(0,10))
#grid.newpage()
#pushViewport(viewport(layout=grid.layout(5,1)))
#vplayout=function(x,y) viewport(layout.pos.row=x,layout.pos.col=y)
#print(p1,vp=vplayout(1,1))
#print(p2,vp=vplayout(2,1))
#print(p3,vp=vplayout(3,1))
#print(p4,vp=vplayout(4,1))
#print(p5,vp=vplayout(5,1))
ggplot2.multiplot(p1,p2,p3,p4,p5,cols=1)
dev.off()
