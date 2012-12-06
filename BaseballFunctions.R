# Repository for functions
InData <- function(datadir){
	if(!is.null(datadir)){file=paste(datadir,'playbyplay.txt',sep="")} else {file=playbyplay.txt}
    base.dat <- read.delim(file=file)
	return(base.dat)
	}



MakeDF <- function(hometeam=3,awayteam=3,base.dat){
	data <- base.dat[base.dat$HomeTeamId==hometeam,]
	return(data)

	}