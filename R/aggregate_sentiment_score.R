#'  aggregate sentiment score
#'
#'  Returns an aggregated compound score representing sentiment:
#' -1 (most extreme negative) and +1 (most extreme positive). The compound score
#' is a normalized score calculated by summing the valence scores of each word
#'  in the lexicon.
#'
#' @param df, data frame containing the reviews
#' @param col, name of the column that contains the reviews
#'
#' @return float value between -1 to 1
#'
#' @export
#'
#' @examples
#' df =  data.frame(text = c("I love cats","I love dogs"))
#' score = aggregate_sentiment_score(df, "text")
aggregate_sentiment_score <- function(df, col) {


  if (!is.character(col)) {
    stop("column name should be a string")
  }
  if (!(col %in% colnames(df))) {
    stop("Second parameter col is not a column name in the dataframe")
  }

  data <- get_sentiment_and_score(df, col)
  aggregated_score <- mean(data$score)

  return(aggregated_score)

}





