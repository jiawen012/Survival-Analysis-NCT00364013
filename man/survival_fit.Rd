% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analyze_survival_time.R
\name{survival_fit}
\alias{survival_fit}
\title{Make a survival analysis model}
\usage{
survival_fit(tmp, pfsdycr = "pfsdycr", pfscr = "pfscr", atrt = "atrt")
}
\arguments{
\item{tmp}{a dataframe with target variables}

\item{pfsdycr}{default}

\item{pfscr}{default}

\item{atrt}{default}
}
\value{
A survival fit model
}
\description{
use "survfit" to train the model and summary the result table
}
\examples{
survival_fit(tmp)

}
