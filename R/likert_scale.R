#' likert scale
#'
#' Convert the sentiment scores to a likert scale from 1-5
#'
#' @param df, data frame containing the reviews
#' @param col, string name of the column that contains the reviews
#'
#' @return integer between 1-5
#' 1 = very negative
#' 2 = negative
#' 3 = neutral
#' 4 = positive
#' 5 = very positive
#'
#' @export
#'
#' @examples
#' df =  data.frame(text = c("I love cats","I love dogs"))
#' val = likert_scale(df, "text")
likert_scale <- function(df, col) {
  if (!is.data.frame(df)) {
    stop("First parameter should be a data frame.")
  }
  if (!(col %in% colnames(df))) {
    stop("Column does not exist in the data frame.")
  }
  score <- aggregate_sentiment_score(df, col)
  if (score >= -1 && score < -0.6) {
    return(1)
  } else if (score >= -0.6 && score < -0.2) {
    return(2)
  } else if (score >= -0.2 && score <= 0.2) {
    return(3)
  } else if (score >= 0.2 && score <= 0.6) {
    return(4)
  } else if (score > 0.6 && score <= 1) {
    return(5)
  } else {
    stop("Aggregate score should be between -1 and 1.")
  }
}
