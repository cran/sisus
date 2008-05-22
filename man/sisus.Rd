\name{sisus}
\alias{sisus}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ sisus }
\description{
  runs the stable isotope analysis for the specified Excel-like workbook input dataset
}
\usage{
sisus(filename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{ template workbook available at http://statacumen.com/sisus/ }
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  no value returned, many output files produced depending on options specified in workbook
%  ~Describe the value returned
%  If it is a LIST, use
%  \item{comp1 }{Description of 'comp1'}
%  \item{comp2 }{Description of 'comp2'}
%  ...
}
\references{ http://statacumen.com/sisus/ }
\author{ Erik Barry Erhardt }
%\note{ ~~further notes~~
%
% ~Make other sections like Warning with \section{Warning }{....} ~
%}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
## # set working directory for many output files with setwd()
## # see http://statacumen.com/sisus for workbook
## filename = "http://statacumen.com/old/sisus/examples/SISUS_v0_09_template.xls";
## sisus(filename)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ misc }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
