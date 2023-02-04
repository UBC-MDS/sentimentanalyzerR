#' sentiment_score_plot
#'
#' Creates a binned histogram showing count of reviews
#' ranging from negative to positive sentiment score.
#'
#' Provides the most frequent sentiment score and the
#' corresponding percentage
#'
#' @param df, data frame containing the reviews
#' @param col, name of the column that contains the reviews
#'
#' @return plot object
#' @export sentiment_score_plot
#'
#' @examples
#' df =  data.frame(text = c("I love cats","I love dogs"))
#' plot1 <- sentiment_score_plot(df, "text")
sentiment_score_plot <- function(df, col){
  if(!is.data.frame(df)) {
    stop("First parameter should be a data frame")
  }
  if(!is.character(col)) {
    stop("column name should be a string")
  }
  if(!(col %in% colnames(df))) {
    stop("Second parameter col is not a column name in the dataframe")
  }

  data <- get_sentiment_and_score(df, col)

  # Plot the data
  h <- graphics::hist(data$score,
            main="Distribution of Sentiments",
            breaks = 10,
            xlab="Sentiment Score range",
            xlim=c(-1,1),
            freq=TRUE)

}

