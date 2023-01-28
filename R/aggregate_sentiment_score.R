#'  Returns an aggregated compound score representing sentiment:
#' -1 (most extreme negative) and +1 (most extreme positive). The compound score
#' is a normalized score calculated by summing the valence scores of each word
#'  in the lexicon.
#'
#' @param df, data frame containing the reviews
#' @param col, name of the column that contains the reviews
#'
#' @return float value between -1 to 1
#' @export
#'
#' @examples
#'
#'score1 = aggregate_sentiment_score(df, "text")
#'score2 = aggregate_sentiment_score(df, "review")
#'
aggregate_sentiment_score <- function(df, col) {

}
