\name{file.ncol}
\alias{file.ncol}
\title{Find the number of columns (lines) in a file.}
\usage{
  file.ncol(fn, reader = FALSE, del = NULL, comment = "#",
    skip = 0, force = FALSE, excl.rn = FALSE)
}
\arguments{
  \item{fn}{name of the file(s) to get the length of}

  \item{reader}{try to read the entire file to get a
  result, else looks at the top few lines (ignoring
  comments)}

  \item{del}{specify a delimiter (else this will be
  auto-detected)}

  \item{comment}{a comment symbol to ignore lines in files}

  \item{skip}{number of lines to skip at top of file before
  processing}

  \item{force}{try to read the file regardless of whether
  it looks like an invalid file type. Only use when you
  know the files are valid}

  \item{excl.rn}{exclude rownames from column count
  (essentially subtract 1)}
}
\value{
  returns number of columns in file(s). If no delimiter,
  then =1
}
\description{
  Returns the number of columns in a datafile. File
  equivalent of ncol()
}
\examples{
write.table(matrix(rnorm(100),nrow=10),"temp.txt",col.names=FALSE,row.names=FALSE)
file.ncol("temp.txt",excl.rn=TRUE)
unlink("temp.txt")
# find ncol for all files in current directory:
# [NB: use with caution, will be slow if dir contains large files]
# not run # lf <- list.files(); if(length(lf)==0) { print("no files in dir") }
# lf <- lf[classify.ext(lf)=="TXT"]
# not run (only works if length(lf)>0) # file.ncol(lf)
}
\author{
  Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
  \code{\link{file.nrow}}
}

