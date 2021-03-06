% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RC.R
\name{RC}
\alias{RC}
\title{The Regression Calibration Estimator}
\usage{
RC(W, Z = NULL, return_var = FALSE)
}
\arguments{
\item{W}{A list of length 'k' containing matrices of error-prone proxy measurements of the covariate. Matrices should all be n (observations) x p 
(dimension of covariates).}

\item{Z}{A matrix containing all error-free covariates for use in estimation. Matrix should be n (observations) x q (dimension). 
Use NULL if no such covariates exist. Defaults to NULL.}

\item{return_var}{A boolean represent whether the correction function and weights should be returned (TRUE) or only the imputed values. Defaults to FALSE.}
}
\value{
Either a matrix of imputed values of size n x p (if return_var is FALSE), or a list which contains elements
   $X.hat (the aforementioned imputed matrix), $fitRC (a function which can be used to make the same correction), and
   $weights (the weights used in the correction).
}
\description{
This function implements the standard regression calibration estimator, based on replicated measurements.
}
\examples{
generalizedRC(W, weights="equal")
}
\seealso{
[rcalibration::generalizedRC()] which this function is just a wrapper for
}
