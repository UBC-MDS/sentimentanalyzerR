
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sentimentanalyzerR

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/sentimentanalyzerR/actions/workflows/check_standard.yaml/badge.svg)](https://github.com/UBC-MDS/sentimentanalyzerR/actions/workflows/check_standard.yaml)
[![Codecov test
coverage](https://codecov.io/gh/UBC-MDS/sentimentanalyzerR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/UBC-MDS/sentimentanalyzerR?branch=main)
<!-- badges: end -->

This package performs sentiment analysis on the given texts and
summarizes information from the text.

When a survey asks for written comments, it is often tedious to read
through every response to extract useful information or just to get a
quick summary. By using this package, responses can be quickly
summarized to get a general idea of the sentiments of the comments,
which can be useful such as when a PR team wants to know the overall
sentiment on a company or when instructors want to know the overall
sentiment on a course. The goal is to provide a quick summary that is
easily interpretable by combining results from a pre-trained Python
natural language processing package with the use of visualizations.

## Installation

You can install the development version of sentimentanalyzerR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/sentimentanalyzerR")
```

## Usage

This package provides the following 4 functions:

-   `generate_wordcloud` - Create a wordcloud of the most common
    positive and negative words.
-   `get_aggregated_sentiment_score` - Calculates the overall sentiment
    score of the input texts.
-   `likert_scale` - Converts the sentiment score to a likert scale
    ranging from 1-5.
-   `sentiment_score_plot` - Creates a binned histogram showing count of
    reviews against the sentiment score.

In general, the functions will take a data frame and a column name as
parameters.

## Similar Packages

While there exists many packages and libraries for sentiment analysis
and many projects built on top of those packages, we could not find
specific packages that combines the use of sentiment analysis with
visualizations. However, we expect there to be many projects done by
individuals that likely perform similar functions by making use of
existing NLP packages. Our package aims enhance the existing NLP
packages by providing a quick and simple way to generate summary
visualizations. Our package will similar to the following existing
packages:

-   [wordcloud](https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf)
-   [tidytext](https://cran.r-project.org/web/packages/tidytext/vignettes/tidytext.html)

## Contributing

This package was created by Group 8 of the DSCI 524 course with members
Eric Tsai, Ranjit Sundaramurthi, Tanmay Agarwal and Ziyi Chen.
Nonetheless, we welcome suggestions and improvements. See below for
further details.

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## License

sentimentanalyzerR was created by Eric Tsai, Ranjit Sundaramurthi,
Tanmay Agarwal and Ziyi Chen. It is licensed under the terms of the MIT
license.
