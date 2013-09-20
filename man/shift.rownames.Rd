\name{shift.rownames}
\alias{shift.rownames}
\title{Shift the first column of a dataframe to rownames() if appropriate.}
\usage{
  shift.rownames(dataf, override = FALSE, warn = FALSE)
}
\arguments{
  \item{dataf}{data.frame to run the conversion on}

  \item{override}{assume col 1 is rownames, regardless of
  numeric() test}

  \item{warn}{whether to display warnings if assumptions
  aren't met}
}
\value{
  returns vectors of strings of char, lengths X
}
\description{
  Checks whether the first column looks like IDs, and if so
  will. remove the column, and move these values to
  rownames.
}
\examples{
df1 <- data.frame(ID=paste("ID",101:110,sep=""),
                   scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
shift.rownames(df1)
df2 <- data.frame(ID=paste(101:110),
                   scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
shift.rownames(df2) # first col are all numbers, so no convert
shift.rownames(df2,override=TRUE) # override forces conversion
}
\author{
  Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
  \code{\link{reader}}
}

