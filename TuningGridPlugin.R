library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   depth <<- readLines(paste(pfix, parameters["depth", 2], sep="/"))
   numtrees <<- as.integer(parameters["numtrees", 2])
   maxcol <<- as.integer(parameters["maxcol", 2])
   myShrinkage <<- as.numeric(parameters["shrinkage", 2])
   minobsinnode <<- as.integer(parameters["minobsinnode", 2])
}

run <- function() {}

output <- function(outputfile) {
	print(numtrees)
	myGrid <-  expand.grid(interaction.depth = depth, 
                        n.trees = (1:maxcol)*numtrees, 
                        shrinkage = myShrinkage,
                        n.minobsinnode = minobsinnode)
write.csv(myGrid, outputfile)
}
