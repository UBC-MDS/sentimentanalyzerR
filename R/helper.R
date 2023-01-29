#' get_sentiment function
#' Evaluates the type of sentiment from a given text
#'
#' @param text, Input text data as string
#'
#' @return The type of sentiment (positive, negative or neutral)
#' as a character
#'
#' @export get_sentiment
#'
#' @examples
#' get_sentiment("This is great")
#' get_sentiment("This is a neutral sentence")
get_sentiment <- function(text) {
  value <- get_compound_score(text)

  if (value > 0) {
    return("positive")
  } else if (value < 0) {
    return("negative")
  } else {
    return("neutral")
  }

}

#' get_compound_score
#' Calculates a compound sentiment score from text
#'
#' @param text, Input text data as string
#'
#' @return A numeric sentiment score of the text,
#' ranges from -1 for negative
#' 0 for neutral and 1 for positive
#'
#' @export get_compound_score
#'
#' @examples
#' get_compound_score("This is great")
#' get_compound_score("This is a neutral sentence")
get_compound_score <- function(text) {
  analysis <- vader::get_vader(text)
  score <- as.double(analysis["compound"])

  # If value Nan then make it 0 (neutral)
  score[is.nan(score)] <- 0

  # Return the score
  return(score)
}

#' get_sentiment_and_score
#' Adds the sentiment and score from text to data frame
#'
#' @param df, dataframe
#' @param col, name of the text column on which sentiment analysis is done
#'
#' @return A dataframe with numeric sentiment and its sentiment type added,
#' to the dataframe
#'
#' @export get_sentiment_and_score
#'
#' @examples
#' df =  data.frame(text = c("I love cats","I love dogs"))
#' get_sentiment_and_score(df, "text")
get_sentiment_and_score <- function(df, col) {

  # Converts the column to list and apply functions
  list_col <- df |> dplyr::select({{col}})
  compound_score <- lapply(list_col[[1]], get_compound_score)
  sentiment <- lapply(list_col[[1]], get_sentiment)

  # Convert results to dataframe
  compound_score_df <- as.data.frame(unlist(compound_score), nrow=length(compound_score), byrow=TRUE)
  colnames(compound_score_df) <- "score"

  sentiment_df <- as.data.frame(unlist(sentiment),nrow=length(sentiment),byrow=TRUE)
  colnames(sentiment_df) <- "sentiment"

  df <- cbind(df, compound_score_df, sentiment_df)

  return(df)
}
