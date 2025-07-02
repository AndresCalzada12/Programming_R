#1. Clean:####
rm(list = ls(all = T)) #clear all;
graphics.off() # close all;
gc() # Clear memory (residuals of operations, cache)

#2. Load packages

library(openxlsx)
library(data.table)
library(dplyr)
library(ggplot2)
library(ggpubr)

#3. Load data birdflucases y birdfludeaths and include and id column of each data frame
BFC<-read.table("BirdFluCases.txt", header = TRUE,sep="")
BFC$ID<-rep("Cases",length(BFC$Year))
BFD<-read.table("BirdFluDeaths.txt", header = TRUE,sep="")
BFD$ID<-rep("Deaths",length(BFD$Year))

#4. Estimate the total cases and total deaths by year. Use rowSums to get the sum of columns
YC<-rowSums(BFC[,c(2:16)])
YD<-rowSums(BFD[,c(2:16)])

#5. Create two data frames (use function data frame) with 3 columns the 1st will be the "year", the second the "total" of cases/ deaths and the 3 will be the "id" of the data frames
BTC<-data.frame(Year=BFC$Year,Total=YC,ID=BFC$ID)
BTF<-data.frame(Year=BFD$Year,Total=YD,ID=BFD$ID)

#6. Bind the data frames in a single one
allD<-rbind(BTC,BTF)

#7create a geom_col plot by ID using facet_wrap and using the a bw theme (theme_bw). Axis x title named "Year" and y axis "Total"
ggplot(allD,aes(x=Year,y=Total,fill=ID))+
	geom_col(aes(x=Year,y=Total,fill=ID))+
	scale_x_continuous(name="Year",breaks=seq(2003,2008,1))+
	scale_y_continuous(name="Total",breaks=seq(0,max(allD$Total)+10,10),limits=c(0,max(allD$Total)+10),expand=c(0,0))+
	theme_bw()+
	facet_wrap(~ID)

#8. theme 
the_theme<-theme(plot.title = element_text(size=20,face="bold",hjust=0.5),
           axis.title.x = element_text(size=14,face="bold"),
		   axis.title.y = element_text(size=14,face="bold"),
           axis.text.x=element_text(angle=90,vjust=0.5),
           axis.text=element_text(size=12),
		   legend.position="none",
		   strip.text = element_text(size=20))

#9. grafica con theme
ggplot(allD,aes(x=Year,y=Total,fill=ID))+
    geom_col(aes(x=Year,y=Total,fill=ID))+
    scale_x_continuous(name="Year",breaks=seq(2003,2008,1))+
    scale_y_continuous(name="Total",breaks=seq(0,max(allD$Total)+10,10),limits=c(0,max(allD$Total)+10),expand=c(0,0))+
    scale_colour_manual(values=c("#003c30","#01665e","#35978f","#80cdc1","#c7eae5","#dfc27d"))+
	theme_bw()+the_theme+
    facet_wrap(~ID)

#10 color year 
kk<-ggplot(allD,aes(x=Year,y=Total))+
    geom_col(aes(x=Year,y=Total,fill=as.factor(Year),colour=as.factor(Year)))+
    scale_x_continuous(name="Year",breaks=seq(2003,2008,1))+
    scale_y_continuous(name="Total",breaks=seq(0,max(allD$Total)+10,10),limits=c(0,max(allD$Total)+10),expand=c(0,0))+
    scale_fill_manual(values=c("#003c30","#01665e","#35978f","#80cdc1","#c7eae5","#dfc27d"))+
    theme_bw()+the_theme+
    facet_wrap(~ID)


#11 save the plot
png("Grafica.png")
kk
dev.off()








