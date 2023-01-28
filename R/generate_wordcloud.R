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
#' @export
#'
#' @examples
#' imgs <- generate_wordcloud(df, "text")
#'


generate_wordcloud <- function(df, col){
  if (!(col %in% colnames(df))) {
    stop("Column does not exist in the data frame.")
  }
  if (!is.data.frame(df)) {
    stop("First parameter should be a data frame.")
  }

  data <- get_sentiment_and_score(df, col)

  sentiment_col_name <- "sentiment"
  neg_df <- data |>
    dplyr::filter(stringr::str_detect(sentiment_col_name, 'negative'))
  pos_df <- data |>
    dplyr::filter(stringr::str_detect(sentiment_col_name, 'positive'))
  neutral_df <- data |>
    dplyr::filter(stringr::str_detect(sentiment_col_name, 'neutral'))

  # joining the text columns
  negative_messages <- paste(as.list(data[[col]]),collapse = ' ')
  positive_messages <- paste(as.list(data[[col]]),collapse = ' ')
  neutral_messages <- paste(as.list(data[[col]]),collapse = ' ')

  # put the 3 messages in a list
  messages <- list(positive_messages,neutral_messages,negative_messages)
  wordcloud_list <- list()

  for (message in messages) {
    # Clear the text by converting it to lower case, removing punctuation, numbers, and commonly used words
    suppressWarnings({
      corpus = tm::Corpus(tm::VectorSource(message))
      corpus = tm::tm_map(corpus, tm::content_transformer(tolower))
      corpus = tm::tm_map(corpus, tm::removePunctuation)
      corpus = tm::tm_map(corpus, tm::removeNumbers)
      corpus = tm::tm_map(corpus, tm::removeWords, c(tm::stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))

      # Convert the result into an integer vector listing each word's frequency (the words are in the names attribute)
      tdm = tm::TermDocumentMatrix(corpus, control = list(minWordLength = 1))
      word.freq = sort(rowSums(as.matrix(tdm)), decreasing = TRUE)

      # Draw the word cloud
      wc_image <- wordcloud::wordcloud(names(word.freq), word.freq, scale = c(4,0.5),
                            min.freq = 20, max.words = 20,
                            colors = RColorBrewer::brewer.pal(8, "Dark2"))
      append(wordcloud_list,wc_image)
    })
  }

  # return a list of 3 word cloud images
  return(wordcloud_list)
}
