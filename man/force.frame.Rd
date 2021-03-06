% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reader.R
\name{force.frame}
\alias{force.frame}
\title{returns a dataframe if 'unknown.data' can in anyway relate to such:}
\usage{
force.frame(unknown.data, too.big = 10^7)
}
\arguments{
\item{unknown.data}{something that is or can refer to a 2d dataset}

\item{too.big}{max size in GB, to prevent unintended conversion to 
matrix of a very large big.matrix object.}
}
\value{
returns a data.frame regardless of the original object type
}
\description{
it can be:
- dataframe, matrix, big.matrix, sub.big.matrix, big.matrix.descriptor,
a bigmatrix description file, an RData file containing one of these 
objects, the name of a text or RData file, a named vector (names 
become rownames), or a list containing a matrix or dataframe. 
Using this within functions allows flexibility in 
specification of a datasource
}
\examples{
# create a matrix, binary file, text file, big.matrix.descriptor
orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
test.files <- c("temp.rda","temp.txt")
mymat <- matrix(rnorm(100),nrow=10)
# not run yet # require(bigmemory)
save(mymat,file=test.files[1])
write.table(mymat,file=test.files[2],col.names=FALSE,row.names=FALSE)
test.frames <- list(mymat = mymat,
 myrda = test.files[1], mytxt = test.files[2] )
 # not run yet #: ,mybig = describe(as.big.matrix(mymat)) )
sapply(sapply(test.frames,is),"[",1)
# run the function on each, reporting specs of the object returned
for (cc in 1:length(test.frames)) {
  the.frame <- force.frame(test.frames[[cc]])
  cat(names(test.frames)[cc],": dim() => ",
      paste(dim(the.frame),collapse=","),
      "; is() => ",is(the.frame)[1],"\\n",sep="")
}
unlink(test.files)
setwd(orig.dir) # reset working dir to original
}
\author{
Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
\code{\link{force.vec}}
}

