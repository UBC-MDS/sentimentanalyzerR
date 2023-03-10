% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/likert_scale.R
\name{likert_scale}
\alias{likert_scale}
\title{likert scale}
\usage{
likert_scale(df, col)
}
\arguments{
\item{df, }{data frame containing the reviews}

\item{col, }{string name of the column that contains the reviews}
}
\value{
integer between 1-5
1 = very negative
2 = negative
3 = neutral
4 = positive
5 = very positive
}
\description{
Convert the sentiment scores to a likert scale from 1-5
}
\examples{
df =  data.frame(text = c("I love cats","I love dogs"))
val = likert_scale(df, "text")
}
