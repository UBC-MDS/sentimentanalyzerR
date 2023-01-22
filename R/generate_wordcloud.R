#' Generate the word cloud of the most common positive and negative words from a given survey in the form of a
#' data frame and create a word cloud.
#'
#' @param df, DataFrame containing the survey comments
#' @param col, name of the column that contains the reviews
#'
#' @return List:
#' A list of three images in the following order: postive, neutral, negative
#' A word cloud instance that can be later plotted or saved as an image
#'
#' @export none
#'
#' @examples
#' imgs <- generate_wordcloud(df, "text")
#' imgs[1] # positive
#' imgs[2] # negative
#' imgs[3] # neutral
generate_wordcloud <- function(df, col){


}
