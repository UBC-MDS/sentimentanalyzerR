test_that("data frame can not be NULL", {
  expect_error(generate_wordcloud(NULL, col))
})


test_that("col name can not be NULL", {
  df <- data.frame (text  = c("Kennedy characterized space as a new frontier, invoking the pioneer spirit that dominated American folklore. He infused the speech with a sense of urgency and destiny, and emphasized the freedom enjoyed by Americans to choose their destiny rather than have it chosen for them", "Kennedy characterized space as a new frontier, invoking the pioneer spirit that dominated American folklore. He infused the speech with a sense of urgency and destiny, and emphasized the freedom enjoyed by Americans to choose their destiny rather than have it chosen for them", "Kennedy characterized space as a new frontier, invoking the pioneer spirit that dominated American folklore. He infused the speech with a sense of urgency and destiny, and emphasized the freedom enjoyed by Americans to choose their destiny rather than have it chosen for them"),
                    sentiment = c("positive", "negative", "neutral"),
                    score =c(0.8, -0.5, 0.1))
  expect_error(generate_wordcloud(df, NULL))
})


test_that("Not passing a data frame to generate_wordcloud", {
  expect_error(generate_wordcloud("df", col))
})

#test_that("Not returning three imgaes", {
#  expect_equal(length(generate_wordcloud(df, col)), 3)
#})
