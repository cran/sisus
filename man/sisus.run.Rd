\name{sisus.run}
\alias{sisus.run}
\title{driver program for SISUS}
\description{runs the stable isotope analysis using the specified Excel-like workbook input dataset}
\usage{sisus.run(filename)}
\arguments{
  \item{filename}{The Excel workbook name.  A modified version of sisus_*_templateX.xls
template workbook available in the package sisus/inst/extdata folder and at http://statacumen.com/sisus/}
}

\value{no value returned, many output files produced depending on options specified in workbook}
\references{Erhardt, Erik Barry. SISUS: Stable Isotope Sourcing using Sampling, Getting Started. May 30, 2007

\url{http://statacumen.com/sisus/}}
\author{Erik Barry Erhardt <erik@statacumen.com>}




\examples{
# set working directory for many output files with setwd()
# see http://statacumen.com/sisus for workbook
filename = "http://statacumen.com/sw/sisus/examples/SISUS_v0_09_template.xls";
sisus.run(filename)
}
