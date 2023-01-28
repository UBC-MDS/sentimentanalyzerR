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
#' plot1 <- sentiment_score_plot(df, "column_name")
#' plot2 <- sentiment_score_plot(df, "reviews")
#'
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

  max_counts <- max(h$counts)
  min_counts <- min(h$counts)
  max_percentage <- max_counts*100/length(data$score)

  max_range_low <- h$breaks[match(c(max_counts),h$counts)]
  max_range_upper <- h$breaks[match(c(max_counts),h$counts+1)]

  paste0("The highest frequency ", max(h$counts), " of sentiment scores are in the range ",max_range_low," to ", max_range_upper," which forms ",max_percentage," % of samples in the dataset")

  return(h)
}

