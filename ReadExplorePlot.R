# Just first version to read in the data & 
# plot some results
rm(list=ls())
library(ggplot2)
wkdir <- '/users/robs/Documents/personal/business/baseball/analysis'
setwd(wkdir)
base.dat <- read.delim(file='../BIS_baseballdata/playbyplay.txt')

# Pull out just the red sox at home
baseRS.home    <- base.dat[base.dat$HomeTeamId==3,] # dim: 7482 x 46
baseRS.flyOut  <- baseRS.home[baseRS.home$ResultType==46,]

pixel <- 1#3.6365 # changing this based on an email from Jeff Spoljaric (2/10/11)
bases <- data.frame(x=c(100*pixel,82.5*pixel,65*pixel,82.5*pixel),
y=c(-103*pixel,-85.5*pixel,-103*pixel,-120.5*pixel))
base <- ggplot(data=baseRS.home['BallInPlayType'!=0,],aes(x=BallInPlayX,y=-BallInPlayY))
base.px <- ggplot(data=baseRS.home['BallInPlayType'!=0,],aes(x=BallInPlayX*pixel,y=-BallInPlayY*pixel))	
		
base.Result <- base +
			   geom_point(aes(colour=factor(ResultType)))+
		geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')
		
pdf(file="../images/Grid_PixelCompare.pdf")		
base.Result <-    base +
			      geom_point(aes(colour=factor(BallInPlayType,
		    	  labels=c("Not in Play",'Fly','Liner','Grounder','Bunt Grounder','Bunt Fly'))))+
	  		      labs(colour='BIP Type')+
		    	  scale_colour_brewer(palette="Paired")+
		    	  geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')+
		    	  opts(title="Fenway Park, 2004")
		    		
base.Result.px <- base.px +
			      geom_point(aes(colour=factor(BallInPlayType,
		    	  labels=c("Not in Play",'Fly','Liner','Grounder','Bunt Grounder','Bunt Fly'))))+
		    	  labs(colour='BIP Type')+
		    	  scale_colour_brewer(palette="Paired")+
		    	  geom_point(data=bases.pix,aes(x=x,y=y),pch=23,size=3,bg='red')+
		    	  opts(title="Fenway Park, 2004")
print(base.Result)
print(base.Result.px)
dev.off()
		    
pdf(file="../images/DataSnapshot.pdf")		
base.Result <-    base +
			      geom_point(aes(colour=factor(BallInPlayType,
		    	  labels=c("Not in Play",'Fly','Liner','Grounder','Bunt Grounder','Bunt Fly'))))+
	  		      labs(colour='BIP Type')+
		    	  scale_colour_brewer(palette="Paired")+
		    	  geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')+
		    	  opts(title="Fenway Park, 2004")
		    		
print(base.Result)
dev.off()

# just plotting out one hit from a game		    
BIP.type.one <- ggplot(data=base.dat[50,],aes(x=BallInPlayX*pixel,y=-BallInPlayY*pixel))+
		        geom_point()+
		        geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')
		        
BIP.type.two <- ggplot(data=base.dat[c(50,55),],aes(x=BallInPlayX*pixel,y=-BallInPlayY*pixel))+
		        geom_point(aes(colour=factor(ResultType)))+
		        geom_point(data=bases,aes(x=x,y=y),pch=23,size=3,bg='red')
		        
		        
		        
# plot out the BIP.type with a page for each type
#		    
# interesting idea is to plot spray chart of a batter
#


# plot out the BIP.type data, but symbol coded by out, which you have to figure out
# Looks like Putouts might be useful, assuming I know what a Putout is. 
# Categories here are:
# PutoutAssistType|Descr
# 0|None
# 1|Assist
# 2|Putout
# 3|Putout and Assist
# 4|Two Putouts
# 5|Three Putouts
