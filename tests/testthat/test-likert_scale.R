test_that("Passing in something that is not a data frame in the first argument raises an error.", {
  expect_error(likert_scale("string", "text"))
})

test_that("Passing in a column name that is not in the data frame raises an error.", {
  test_df <- data.frame(
    a = c("a", "b", "c"),
    b = c(123, 456, 789)
  )
  expect_error(likert_scale(test_df, "text"))
})
