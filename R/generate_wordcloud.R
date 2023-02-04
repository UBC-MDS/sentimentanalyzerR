#' generate wordcloud
#'
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
#' df =  data.frame(text = c("I love cats","I love dogs"))
#' imgs <- generate_wordcloud(df, "text")
#'


generate_wordcloud <- function(df, col){
  if (!is.data.frame(df)) {
    stop("First parameter should be a data frame.")
  }

  if (!(col %in% colnames(df))) {
    stop("Column does not exist in the data frame.")
  }

  data <- get_sentiment_and_score(df, col)

  sentiment_col_name <- "sentiment"
  neg_df <-
    data |>
    dplyr::filter(sentiment == 'negative')
  pos_df <-
    data |>
    dplyr::filter(sentiment == 'positive')
  neutral_df <-
    data |>
    dplyr::filter(sentiment == 'neutral')
  # joining the text columns
  positive_messages <- paste(as.list(pos_df[[col]]),collapse = ' ')
  neutral_messages <- paste(as.list(neutral_df[[col]]),collapse = ' ')
  negative_messages <- paste(as.list(neg_df[[col]]),collapse = ' ')

  # put the 3 messages in a list
  messages <- list(positive_messages, neutral_messages, negative_messages)
  results <- list()
  for (message in messages) {
    if (message != "") {
      suppressWarnings({
        corpus <- tm::Corpus(tm::VectorSource(message))

        # Clear the text by converting it to lower case, removing punctuation, numbers, and commonly used words
        docs <- corpus |>
          tm::tm_map(tm::removeNumbers) |>
          tm::tm_map(tm::removePunctuation) |>
          tm::tm_map(tm::stripWhitespace) |>
          tm::tm_map(tm::content_transformer(tolower)) |>
          tm::tm_map(tm::removeWords, tm::stopwords("english"))

        dtm <- tm::TermDocumentMatrix(docs)
        matrix <- as.matrix(dtm)
        words <- sort(rowSums(matrix),decreasing=TRUE)

        # Word cloud df generation
        word_cloud_df <- data.frame(word = names(words), frequency=words) |>
          dplyr::arrange(dplyr::desc(frequency))

        #Setting the seed
        set.seed(42)

        # Generating the wordcloud
        wc_image <- wordcloud::wordcloud(words = word_cloud_df$word, freq = word_cloud_df$frequency,
                             min.freq = 1,max.words=200,
                             random.order=FALSE, rot.per=0.35,
                             colors=RColorBrewer::brewer.pal(8, "Dark2"))
      })

      # Appending the df to the list
      results[[length(results)+1]] <- word_cloud_df




    }
  }

  return(results)


}
