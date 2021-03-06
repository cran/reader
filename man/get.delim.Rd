% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reader.R
\name{get.delim}
\alias{get.delim}
\title{Determine the delimiter for a text data file.}
\usage{
get.delim(fn, n = 10, comment = "#", skip = 0, delims = c("\\t",
  "\\t| +", " ", ";", ","), large = 10, one.byte = TRUE)
}
\arguments{
\item{fn}{name of the file to parse}

\item{n}{the number of lines to read to make the inference}

\item{comment}{a comment symbol to ignore lines in files}

\item{skip}{number of lines to skip at top of file before processing}

\item{delims}{the set of delimiters to test for}

\item{large}{search initially for delimiters that imply more than 1, 
and less than this 'large' columns; if none in this range, look next
at >large.}

\item{one.byte}{only check for one-byte delimiters, [e.g, whitespace regular expr is >1 byte]}
}
\value{
returns character of the most likely delimiter
}
\description{
Reads the first few lines of data in a text file and attempts to
infer what delimiter is in use, based on the 'delims' argument
that would result in the most consistent number of columns in the
first 'n' lines of data. Searches preferentially for delimiters
implying between 2 and 'large' columns, then for >large, and lastly
for 1 column if nothing else gives a match.
}
\examples{
orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
df <- data.frame(ID=paste("ID",101:110,sep=""),
  scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
# save data to various file formats
test.files <- c("temp.txt","temp2.txt","temp3.csv")
write.table(df,file=test.files[1],col.names=FALSE,row.names=FALSE,sep="|",quote=TRUE)
write.table(df,file=test.files[2],col.names=TRUE,row.names=TRUE,sep="\\t",quote=FALSE)
write.csv(df,file=test.files[3])
# report the delimiters
for (cc in 1:length(test.files)) { 
  cat("\\n",test.files[cc],": ")
  print(get.delim(test.files[cc])) }
unlink(test.files)
setwd(orig.dir) # reset working dir to original
}
\author{
Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
\code{\link{reader}}
}

