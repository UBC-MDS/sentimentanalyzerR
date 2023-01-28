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
  # validation
  if (!(col %in% colnames(df))) {
    stop("Column does not exist in the data frame.")
  }
  if (!is.data.frame(df)) {
    stop("First parameter should be a data frame.")
  }



  # TODO: uncomment when ready to integrate
  result_df <- get_sentiment_and_score(df, col)

  # for now we are assuming the following
  # assuming we get data.frame with 3 columns "text","score","sentiment"
  #result_df <- df
  #print(result_df)
  neg_df <- result_df |>
    filter(str_detect(sentiment, 'negative'))
  #print(neg_df)
  pos_df <- result_df |>
    filter(str_detect(sentiment, 'positive'))
  neutral_df <- result_df |>
    filter(str_detect(sentiment, 'neutral'))

  # joining the text columns
  negative_messages <- paste(as.list(neg_df$text),collapse = ' ')
  positive_messages <- paste(as.list(pos_df$text),collapse = ' ')
  neutral_messages <- paste(as.list(neutral_df$text),collapse = ' ')

  # put the 3 messages in a list
  messages <- list(positive_messages,neutral_messages,negative_messages)
  wordcloud_list <- list()

  for (message in messages) {
    # Clear the text by co_nverting it to lower case, removing punctuation, numbers, and commonly used words
    corpus = Corpus(VectorSource(message))
    corpus = tm_map(corpus, content_transformer(tolower))
    corpus = tm_map(corpus, removePunctuation)
    corpus = tm_map(corpus, removeNumbers)
    corpus = tm_map(corpus, removeWords, c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))

    # Convert the result into an integer vector listing each word's frequenty (the words are in the names attribute)
    tdm = TermDocumentMatrix(corpus, control = list(minWordLength = 1))
    word.freq = sort(rowSums(as.matrix(tdm)), decreasing = TRUE)

    # Draw the word cloud
    wc_image <- wordcloud(names(word.freq), word.freq, scale = c(4,0.5),
                          min.freq = 20, max.words = 20,
                          colors = brewer.pal(8, "Dark2"))
    #print(typeof(wc_image))
    #print("Adding wordcloud to wordcloud_list")
    wordcloud_list <- base::append(wordcloud_list,wc_image)
    #print(wordcloud_list)
  }

  # return a list of 3 word cloud images
  return(wordcloud_list)
}
