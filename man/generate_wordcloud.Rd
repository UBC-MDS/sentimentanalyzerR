% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_wordcloud.R
\name{generate_wordcloud}
\alias{generate_wordcloud}
\title{generate wordcloud}
\usage{
generate_wordcloud(df, col)
}
\arguments{
\item{df, }{DataFrame containing the survey comments}

\item{col, }{name of the column that contains the reviews}
}
\value{
List:
A list of three images in the following order: postive, neutral, negative
A word cloud instance that can be later plotted or saved as an image
}
\description{
Generate the word cloud of the most common positive and negative words from a given survey in the form of a
data frame and create a word cloud.
}
\examples{
df =  data.frame(text = c("I love cats","I love dogs"))
imgs <- generate_wordcloud(df, "text")

}
