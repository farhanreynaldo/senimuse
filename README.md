
<!-- README.md is generated from README.Rmd. Please edit that file -->

# senimuse

<!-- badges: start -->

[![R-CMD-check](https://github.com/farhanreynaldo/senimuse/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/farhanreynaldo/senimuse/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of senimuse is to provide an R interface to the museum API,
allowing users to easily access and analyze artwork data from the
collection. This package simplifies the process of retrieving
information about artworks, artists, exhibitions and other museum
resources for data analysis, visualization, and research purposes.

## Installation

You can install the development version of senimuse from GitHub with:

``` r
library(devtools)
install_github("farhanreynaldo/senimuse")
```

## Example

Below is an example of how to retrieve artwork information from a museum
collection using senimuse:

``` r
library(senimuse)
get_artworks(4, fields = c("id", "title", "date_start", "date_end"))
#>   id          title date_start date_end
#> 1  4 Priest and Boy       1865     1880
```
