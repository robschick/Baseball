rm(list=ls())
library(ggplot2)
wkdir <- '/users/robs/Documents/personal/business/baseball/analysis/'
setwd(wkdir)
datadir <- '/users/robs/Documents/personal/business/baseball/BIS_baseballdata/'
source('/users/robs/Documents/code/rss10/baseball/BaseballFunctions.R')

basedata <- InData(datadir)

# Pull out just the red sox at home
baseRS.home <- MakeDF(hometeam=3,awayteam=3,basedata) 

pixel <- 3.6365
bases <- data.frame(x=c(100*pixel,82.5*pixel,65*pixel,82.5*pixel),
y=c(-103*pixel,-85.5*pixel,-103*pixel,-120.5*pixel))

# plotting in ggplot
#base <- ggplot(data=baseRS.home['BallInPlayType'!=0,],aes(x=BallInPlayX*pixel,y=-BallInPlayY*pixel))+
#		geom_point()				
#		
#base.Result <- base +
#			   geom_point(aes(colour=factor(ResultType)))+
#		geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')
#		
#BIP.type <- base +
#		    geom_point(aes(colour=factor(BallInPlayType,
#		    labels=c("Not in Play",'Fly','Liner','Grounder','Bunt Grounder','Bunt Fly'))))+
#		    labs(colour='BIP Type')+
#		    geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')
#
