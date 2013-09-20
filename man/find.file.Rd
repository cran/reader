\name{find.file}
\alias{find.file}
\title{Search for a directory to add to the path so that a file exists.}
\usage{
  find.file(fn, dir = "", dirs = NULL)
}
\arguments{
  \item{fn}{name of the file to search for}

  \item{dir}{the first directory to look in (expected
  location)}

  \item{dirs}{vector/list, a set of directories to look in
  should the file not be found in 'dir'.}
}
\value{
  if the file is found, returns the full path of the file,
  else returns an empty string ""
}
\description{
  Looks for a file named 'fn' in 'dir', and if not found
  there, broadens the search to the list or vector of
  directorys, 'dirs'. Returns the full path of the first
  match that exists.
}
\examples{
l.fn <- "temp.txt"
writeLines("test",con=l.fn)
find.file(l.fn)
find.file(l.fn,dir=getwd())
unlink(l.fn)
# not run # common.places <- ## <<add local folder here>> ##
# not run # d.fn <- cat.path(common.places[1],l.fn)
# write this example file to the first of the folders #
# not run # if(!file.exists(d.fn)) {  writeLines("test2",con=d.fn) }
# search the local folders for a
# a file named 'temp.txt'
# not run # find.file(l.fn,dir=getwd(),dirs=common.places)
# unlink(d.fn) # run only if test file produced
}
\author{
  Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
\seealso{
  \code{\link{is.file}}
}

