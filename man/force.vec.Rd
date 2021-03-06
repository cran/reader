% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reader.R
\name{force.vec}
\alias{force.vec}
\title{returns a vector if 'unknown.data' can in anyway relate to such:}
\usage{
force.vec(unknown.data, most.unique = TRUE, dir = NULL, warn = FALSE)
}
\arguments{
\item{unknown.data}{something that is or can refer to a 2d dataset}

\item{most.unique}{if TRUE, select most unique column if a unknown.data
is a matrix, else select the first column}

\item{dir}{if unknown.data is a file name, specifies directory(s) to
look for the file}

\item{warn}{whether to display a warning if unknown.data is a matrix}
}
\value{
returns a vector regardless of the original object type
}
\description{
if the name of a file with a vector or vector, then reads the file,
if a matrix or dataframe, then preferentially return rownames, 
 otherwise return first column - designed to search for IDs.
Using this within functions allows flexibility in 
the specification of a datasource for vectors
}
\examples{
# create a matrix, binary file, and simple vector
my.ids <- paste("ID",1:4,sep="")
my.dat <- sample(2,4,replace=TRUE)
test.files <- c("temp.rda")
mymat <- cbind(my.ids,my.dat)
save(mymat,file=test.files[1])
test.vecs <- list(myvec = my.ids,
 myrda = test.files[1],mymat=mymat)
# show dimensions of each test object
sapply(test.vecs,function(x) {  if(is.null(dim(x))){ length(x)} else {dim(x)}})
# run the function on each, reporting specs of the object returned
for (cc in 1:3) {
  the.vec <- force.vec(test.vecs[[cc]])
  cat(names(test.vecs)[cc],": length() => ",
      length(the.vec),"; is() => ",is(the.vec)[1],"\\n",sep="")
}
unlink(test.files)
}
\author{
Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
\code{\link{force.frame}}
}

