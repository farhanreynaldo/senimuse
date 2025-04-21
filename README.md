
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

below is a simple example of how to use the `senimuse` package to search
for artworks by Monet in the Art Institute of Chicago museum. The
`search_artworks()` function allows you to search for artworks based on
various criteria, such as artist name, title, and museum.

``` r
library(senimuse)

search_artworks("Monet", museum = "artic", size = 5)
#> [1] "Monet"
#>       id                                            title date_display
#> 1  14624             Stacks of Wheat (End of Day, Autumn)      1890–91
#> 2  16568                                     Water Lilies         1906
#> 3  64818                  Stacks of Wheat (End of Summer)      1890–91
#> 4  14620                          Cliff Walk at Pourville         1882
#> 5  14598                      The Beach at Sainte-Adresse         1867
#> 6  16571 Arrival of the Normandy Train, Gare Saint-Lazare         1877
#> 7  16564          Branch of the Seine near Giverny (Mist)         1897
#> 8  81539             On the Bank of the Seine, Bennecourt         1868
#> 9  81537                                       Bordighera         1884
#> 10 87088                                  Water Lily Pond         1900
#>                      artist_display
#> 1  Claude Monet (French, 1840–1926)
#> 2  Claude Monet (French, 1840–1926)
#> 3  Claude Monet (French, 1840–1926)
#> 4  Claude Monet (French, 1840–1926)
#> 5  Claude Monet (French, 1840–1926)
#> 6  Claude Monet (French, 1840–1926)
#> 7  Claude Monet (French, 1840–1926)
#> 8  Claude Monet (French, 1840–1926)
#> 9  Claude Monet (French, 1840–1926)
#> 10 Claude Monet (French, 1840–1926)
#>                                                                                             dimensions
#> 1  65.8 × 101 cm (27 7/8 × 39 3/4 in.); Framed: 90.9 × 125.5 × 123.2 cm (35 3/4 × 49 3/8 × 48 1/2 in.)
#> 2    89.9 × 94.1 cm (35 3/8 × 37 1/16 in.); Framed: 103.2 × 107 × 5.8 cm (40 5/8 × 42 1/8 × 2 1/4 in.)
#> 3    60 × 100.5 cm (23 5/8 × 39 9/16 in.); Framed: 75.6 × 116.6 × 7.4 cm (29 3/4 × 45 7/8 × 2 7/8 in.)
#> 4      66.5 × 82.3 cm (26 1/8 × 32 7/16 in.); Framed: 88.9 × 104.8 × 10.8 cm (35 × 41 1/4 × 4 1/4 in.)
#> 5  75.8 × 102.5 cm (29 13/16 × 40 5/16 in.); Framed: 104.1 × 130.2 × 11.4 cm (41 × 51 1/2 × 4 1/2 in.)
#> 6       60.3 × 80.2 cm (23 3/4 × 31 1/2 in.); Framed: 80.7 × 100.4 × 10.2 cm (31 3/4 × 39 1/2 × 4 in.)
#> 7  89.9 × 92.7 cm (35 3/8 × 36 1/2 in.); Framed: 112.4 × 115.6 × 11.5 cm (44 1/4 × 45 1/2 × 4 1/2 in.)
#> 8    81.5 × 100.7 cm (32 1/16 × 39 5/8 in.); Framed: 98.5 × 117.8 × 8 cm (38 3/4 × 46 3/8 × 3 1/8 in.)
#> 9         65 × 80.8 cm (25 5/8 × 31 13/16 in.); Framed: 80.4 × 96.6 × 8.3 cm (31 5/8 × 38 × 3 1/4 in.)
#> 10      89.8 × 101 cm (35 3/8 × 39 3/4 in.); Framed: 112.4 × 122.6 × 10.2 cm (44 1/4 × 48 1/4 × 4 in.)
#>    medium_display
#> 1   Oil on canvas
#> 2   Oil on canvas
#> 3   Oil on canvas
#> 4   Oil on canvas
#> 5   Oil on canvas
#> 6   Oil on canvas
#> 7   Oil on canvas
#> 8   Oil on canvas
#> 9   Oil on canvas
#> 10  Oil on canvas
```

You can also specify the fields you want to retrieve from the API. For
example, if you only want to get the artwork ID, title, and artist
display name, you can use the `fields` argument:

``` r
search_artworks("Monet", museum = "artic", fields = c("id", "title", "artist_display"))
#> [1] "Monet"
#>       id                                            title
#> 1  14624             Stacks of Wheat (End of Day, Autumn)
#> 2  16568                                     Water Lilies
#> 3  64818                  Stacks of Wheat (End of Summer)
#> 4  14620                          Cliff Walk at Pourville
#> 5  14598                      The Beach at Sainte-Adresse
#> 6  16571 Arrival of the Normandy Train, Gare Saint-Lazare
#> 7  16564          Branch of the Seine near Giverny (Mist)
#> 8  81539             On the Bank of the Seine, Bennecourt
#> 9  81537                                       Bordighera
#> 10 87088                                  Water Lily Pond
#>                      artist_display
#> 1  Claude Monet (French, 1840–1926)
#> 2  Claude Monet (French, 1840–1926)
#> 3  Claude Monet (French, 1840–1926)
#> 4  Claude Monet (French, 1840–1926)
#> 5  Claude Monet (French, 1840–1926)
#> 6  Claude Monet (French, 1840–1926)
#> 7  Claude Monet (French, 1840–1926)
#> 8  Claude Monet (French, 1840–1926)
#> 9  Claude Monet (French, 1840–1926)
#> 10 Claude Monet (French, 1840–1926)
```

If you know the artwork ID, you can use the `get_artwork()` function to
retrieve detailed information about a specific artwork. For example, to
get information about the artwork with ID 28067 from the Metropolitan
Museum of Art, you can use the following code:

``` r
artwork_id <- 437984
get_artworks(artwork_id, museum = "met")
#> # A tibble: 1 × 6
#>   id     title             artist_display date_display medium_display dimensions
#>   <chr>  <chr>             <chr>          <chr>        <chr>          <chr>     
#> 1 437984 La Berceuse (Wom… Vincent van G… 1889         Oil on canvas  36 1/2 × …
```
