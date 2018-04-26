#!/bin/bash
#	there will be 3 cases for $1
#	$1=1:	C4-G9 base-pairing ions distribution
#	$1=2:	G3-C10
#	$1=3:	G2-C11

cat <<eof >tmp.sh2R
#!/usr/bin/env Rscript
Args<-commandArgs()
library(ggplot2)
library(grid)
library(easyGgplot2)
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
A1<-melt(a1,id.vars="Frame")
A2<-melt(a2,id.vars="Frame")
A3<-melt(a3,id.vars="Frame")
A4<-melt(a4,id.vars="Frame")
hb<-hb1[,c(1,1,1,1)]
Hb<-melt(hb,id.vars="Frame")
png(pngname,width=960,height=1280)
p1<-ggplot(A1,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("G_O6-Cation") + scale_y_continuous(limits=c(0,10))
p2<-ggplot(A2,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("C_N4-Cation") + scale_y_continuous(limits=c(0,10))
p3<-ggplot(A3,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("G_N2-Cation") + scale_y_continuous(limits=c(0,10))
p4<-ggplot(A4,aes(x=Frame/50,y=value)) + geom_point(size=1,aes(color=variable)) + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),axis.text.x=element_blank(),legend.position="none") + ylab("C_O2-Cation") + scale_y_continuous(limits=c(0,10))
p5<-ggplot(Hb,aes(x=Frame/50,y=value)) + geom_line(aes(color=variable)) + theme(legend.title=element_blank(),legend.position=c(0.9,0.75)) + ylab("Distance") + xlab("Time(ns)") + scale_y_continuous(limits=c(0,10))
ggplot2.multiplot(p1,p2,p3,p4,p5,cols=1)
dev.off()
eof
for i in R*.dat
do
	sed -i 's/#//g' $i
done
	sed -i 's/#//g' hbond_dist.dat

case $1 in
	1) sed -i 's/c(1,1,1,1)/c(1,2,3,4)/g' tmp.sh2R 
	   Rscript ./tmp.sh2R R9O.dat R4N.dat R9N.dat R4O.dat R9_4.png
	;;
	2) sed -i 's/c(1,1,1,1)/c(1,5,6,7)/g' tmp.sh2R 
	   Rscript ./tmp.sh2R R3O.dat R10N.dat R3N.dat R10O.dat R3_10.png
	;;
	3) sed -i 's/c(1,1,1,1)/c(1,8,9,10)/g' tmp.sh2R 
	   Rscript ./tmp.sh2R R2O.dat R11N.dat R2N.dat R11O.dat R2_11.png
	;;
	14) sed -i 's/c(1,1,1,1)/c(1,11,12,13)/g' tmp.sh2R
	    Rscript ./tmp.sh2R R1O.dat R4N.dat R1N.dat R4O.dat R1_4.png
	;;
	16) sed -i 's/c(1,1,1,1)/c(1,14,15,16)/g' tmp.sh2R
            Rscript ./tmp.sh2R R1O.dat R6N.dat R1N.dat R6O.dat R1_6.png
	;;
	26) sed -i 's/c(1,1,1,1)/c(1,17,18,19)/g' tmp.sh2R
            Rscript ./tmp.sh2R R2O.dat R6N.dat R2N.dat R6O.dat R2_6.png
	;;
	36) sed -i 's/c(1,1,1,1)/c(1,20,21,22)/g' tmp.sh2R
            Rscript ./tmp.sh2R R3O.dat R6N.dat R3N.dat R6O.dat R3_6.png
	;;
	96) sed -i 's/c(1,1,1,1)/c(1,23,24,25)/g' tmp.sh2R
            Rscript ./tmp.sh2R R9O.dat R6N.dat R9N.dat R6O.dat R9_6.png
	;;
	110) sed -i 's/c(1,1,1,1)/c(1,26,27,28)/g' tmp.sh2R
            Rscript ./tmp.sh2R R1O.dat R10N.dat R1N.dat R10O.dat R1_10.png
	;;
	210) sed -i 's/c(1,1,1,1)/c(1,29,30,31)/g' tmp.sh2R
            Rscript ./tmp.sh2R R2O.dat R10N.dat R2N.dat R10O.dat R2_10.png
	;;
	510) sed -i 's/c(1,1,1,1)/c(1,32,33,34)/g' tmp.sh2R
            Rscript ./tmp.sh2R R5O.dat R10N.dat R5N.dat R10O.dat R5_10.png
	;;
	111) sed -i 's/c(1,1,1,1)/c(1,35,36,37)/g' tmp.sh2R
            Rscript ./tmp.sh2R R1O.dat R11N.dat R1N.dat R11O.dat R1_11.png
	;;
	311) sed -i 's/c(1,1,1,1)/c(1,38,39,40)/g' tmp.sh2R
            Rscript ./tmp.sh2R R3O.dat R11N.dat R3N.dat R11O.dat R3_11.png
	;;
	511) sed -i 's/c(1,1,1,1)/c(1,41,42,43)/g' tmp.sh2R
            Rscript ./tmp.sh2R R5O.dat R11N.dat R5N.dat R11O.dat R5_11.png
	;;
	712) sed -i 's/c(1,1,1,1)/c(1,44,45)/g' tmp.sh2R
	     sed -i 's/G_O6/A_N1/g' tmp.sh2R
	     sed -i 's/C_N4/U_N3/g' tmp.sh2R
	     sed -i 's/G_N2/A_N6/g' tmp.sh2R
 	     sed -i 's/C_O2/U_O4/g' tmp.sh2R
	    Rscript ./tmp.sh2R R7Na.dat R12N.dat R7Nd.dat R12O.dat R7_12.png
	;;
	812) sed -i 's/c(1,1,1,1)/c(1,46,47)/g' tmp.sh2R
             sed -i 's/G_O6/A_N1/g' tmp.sh2R
             sed -i 's/C_N4/U_N3/g' tmp.sh2R
             sed -i 's/G_N2/A_N6/g' tmp.sh2R
             sed -i 's/C_O2/U_O4/g' tmp.sh2R
            Rscript ./tmp.sh2R R8Na.dat R12N.dat R8Nd.dat R12O.dat R8_12.png
	;;
	*) echo "incorrect parameter,please check the header for help!"
		exit 1	
	;;
esac

# mv tmp.sh2R


