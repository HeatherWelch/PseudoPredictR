% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PseudoPredictR_functions.R
\name{PseudoLayer}
\alias{PseudoLayer}
\title{A nastyverse function}
\usage{
PseudoLayer(inputRas, pseudoRas = "fathorse", mask = F)
}
\arguments{
\item{inputRas}{Your input prediction layer}

\item{pseudoRas}{character string specifiying which built-in classical painting to use as pseudo predictor. Defaults to fathorse.}

\item{mask}{Should the output raster be masked to your input data?}
}
\value{
Returns a raster object
}
\description{
This function creates a pseudo predictor layer based on a classical painting to assess the significance of your climatic and topographical predictors. The output raster will have the same extent and resolution as your input prediction layer.
}
\details{
use pseudoRas="show me" to see all possible arguments for the pseudoRas param
}
\examples{
# Get a fathorse raster that matches the extent and resolution of your prediction layers 
layer=raster()
a=PseudoLayer(inputRas = layer)
plot(a)
}
\keyword{dank}
