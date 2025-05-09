% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/artworks.R
\name{search_artworks}
\alias{search_artworks}
\title{Search for Artworks from Museum APIs}
\usage{
search_artworks(query, museum = "artic", fields = NULL, size = 10)
}
\arguments{
\item{query}{A character string containing the search query. Cannot be NULL.
Spaces will automatically be converted to hyphens.}

\item{museum}{A character string indicating the museum to query. Currently supports:
\itemize{
  \item "artic" - Art Institute of Chicago
  \item "met" - Metropolitan Museum of Art
}}

\item{fields}{An optional vector of field names (character) to return for each artwork.
If NULL (default), returns all available fields.}

\item{size}{The maximum number of results to return. Defaults to 10.}
}
\value{
A tibble (data frame) where each row represents one artwork matching the search
  criteria and columns contain the requested fields.
}
\description{
Searches for artworks in museum collections based on a query string
and returns artwork data for matching items.
}
\examples{
\dontrun{
# Search for artworks related to "sunflowers" in Art Institute of Chicago
search_artworks("sunflowers", museum = "artic")

# Search Met Museum with specific fields to return
search_artworks("monet", museum = "met", fields = c("title", "artistDisplayName", "objectDate"))

# Search with a larger result set
search_artworks("landscape", museum = "artic", size = 25)
}

}
\references{
Art Institute of Chicago API: \url{https://api.artic.edu/docs/}
Metropolitan Museum of Art API: \url{https://metmuseum.github.io/}
}
