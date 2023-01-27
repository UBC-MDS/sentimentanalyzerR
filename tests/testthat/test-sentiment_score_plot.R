test_that("Passing first input as NOT a dataframe raises error", {
  expect_error(sentiment_score_plot("string", "text"))
})

test_that("Passing a second input other than a string raises error",{
  test_df <- data.frame(
    review = c("good", "bad", "excellent"),
    person = c("Ron", "Mark", "Adam")
  )
  expect_error(sentiment_score_plot(test_df, person))
})

test_that("Passing a non existent column raises an error",{
  test_df <- data.frame(
    review = c("good", "bad", "excellent"),
    person = c("Ron", "Mark", "Adam")
  )
  expect_error(sentiment_score_plot(test_df, age))
})

test_that("Output of the function is a histogram",{
  test_df <- data.frame(
    review = c("good", "bad", "excellent"),
    person = c("Ron", "Mark", "Adam")
  )
  expect_equal(class(sentiment_score_plot(test_df, "review")), "histogram")
})
