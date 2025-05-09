% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/galleries.R
\name{galleries}
\alias{galleries}
\title{Retrieve Gallery Information from the Art Institute of Chicago API}
\usage{
galleries()
}
\value{
A tibble (data frame) where each row represents one gallery, containing all
  available fields provided by the API.
}
\description{
Fetches a complete list of galleries from the Art Institute of Chicago's public API,
automatically handling pagination to return all available records. The function
implements rate limiting to comply with API best practices.
}
\examples{
\dontrun{
# Get all galleries
gallery_data <- galleries()
}

}
\references{
Art Institute of Chicago API documentation: \url{https://api.artic.edu/docs}
}
