test_df = data.frame(
  txt = c(
    "I love cats",
    "I love dogs"
  )
)

test_that("Passing first input as NOT a dataframe raises error", {
  expect_error(sentiment_score_plot("string", "text"))
})

test_that("Passing a non existent column raises an error",{
  test_df <- data.frame(
    review = c("good", "bad", "excellent"),
    person = c("Ron", "Mark", "Adam")
  )
  expect_error(sentiment_score_plot(test_df, age))
})

test_that("Function should successfully return a value between -1 to 1.", {
  test_df = data.frame(
    txt = c(
      "I love cats",
      "I love dogs"
    )
  )
  expect_true(between(aggregate_sentiment_score(test_df, "txt"), -1, 1))
})

test_that("Function output should be a numeric value", {
  expect_true(is.numeric(aggregate_sentiment_score(test_df, "txt")))
})

test_that("Output should be possitive",{
  expect_true(aggregate_sentiment_score(test_df, "txt") > 0)
})

test_that("Output should be same",{
  expect_equal(aggregate_sentiment_score(test_df, "txt"), 0.637)
})

