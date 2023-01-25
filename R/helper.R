# Setup
library(SentimentAnalysis)
library(SnowballC)

# get_sentiment
#' Evaluates the type of sentiment from a given text
#'
#' @param text, Input text data as string 
#'
#' @return The type of sentiment (positive, negative or neutral)
#' as a character
#'
#' @examples
#' get_sentiment("This is great")
get_sentiment <- function(text) {
  value <- get_compound_score(text)
  
  if (value > 0) {
    return "positive"
  } else if (value < 0) {
    return "negative"
  } else {
    return "neutral"
  }
    
}



# get_compound_score
#' Calculates a compound sentiment score from text
#'
#' @param text, Input text data as string 
#'
#' @return A numeric sentiment score of the text, 
#' ranges from -1 for negative
#' 0 for neutral and 1 for positive
#'
#' @examples
#' get_compound_score("This is great")
get_compound_score <- function(text) {
  analysis <- analyzeSentiment(text)
  score <- analysis$SentimentQDAP
  
  # Return the score
  return(score)
}


# get_sentiment_and_score
#' Adds the sentiment and score from text to dataframe
#'
#' @param df, dataframe
#' col, column name of the text column on which sentiment analysis is done  
#'
#' @return A dataframe with numeric sentiment and its sentiment type added, 
#' to the dataframe
#' 
#' @examples
#' get_sentiment_and_score(df, col)
get_sentiment_and_score <- function(df, col) {
  
  list_col <- as.list(df$col) # Convert the column to list
  df$compound_score <- lapply(list_col, get_compound_score)
  df$sentiment <- lapply(list_col, get_sentiment)
  
  return(df)
}
