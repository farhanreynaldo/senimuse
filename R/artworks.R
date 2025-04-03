#' Retrieve Artwork Data from the Art Institute of Chicago API
#'
#' Fetches artwork information from the Art Institute of Chicago's public API
#' using object IDs and optionally specifies which fields to return.
#'
#' @param object_ids A vector of artwork object IDs (numeric or character).
#'   These identifiers correspond to the unique IDs used in the museum's collection.
#'   Cannot be NULL.
#' @param fields An optional vector of field names (character) to return for each artwork.
#'   If NULL (default), returns all available fields. See API documentation at
#'   \url{https://api.artic.edu/docs/} for available fields.
#'
#' @return A tibble (data frame) where each row represents one artwork and columns
#'   contain the requested fields. The structure varies depending on the requested fields.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Get basic information for artwork with ID 4
#' get_artworks(4)
#'
#' # Get multiple artworks with specific fields
#' get_artworks(c(27992, 28560), fields = c("title", "artist_display", "date_display"))
#'
#' # Get all available fields for multiple artworks
#' get_artworks(c(16568, 14620, 20684))
#' }
#'
#' @references
#' Art Institute of Chicago API documentation: \url{https://api.artic.edu/docs/}
get_artworks <- function(object_ids, fields = NULL) {
  if(is.null(object_ids)) {
    stop("`object_ids` cannot be null")
  }

  req <- httr2::request("https://api.artic.edu/api/v1/artworks/") |>
    httr2::req_url_query(ids = object_ids, .multi = "comma")

  if(!is.null(fields)) {
    req <- req |>
      httr2::req_url_query(fields = fields, .multi = "comma")
  }

  artworks_data <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  dplyr::bind_rows(artworks_data$data)
}


#' Search for Artworks from the Art Institute of Chicago API
#'
#' Searches for artworks in the Art Institute of Chicago's collection based on a query string
#' and returns artwork data for matching items.
#'
#' @param query A character string containing the search query. Cannot be NULL.
#'   Spaces will automatically be converted to hyphens.
#' @param fields An optional vector of field names (character) to return for each artwork.
#'   If NULL (default), returns all available fields.
#' @param size The maximum number of results to return. Defaults to 10.
#'
#' @return A tibble (data frame) where each row represents one artwork matching the search
#'   criteria and columns contain the requested fields.
#' @export
#'
#' @examples
#' \dontrun{
#' # Search for artworks related to "sunflowers"
#' search_artworks("sunflowers")
#'
#' # Search with specific fields to return
#' search_artworks("monet", fields = c("title", "artist_display", "date_display"))
#' 
#' # Search with a larger result set
#' search_artworks("landscape", size = 25)
#' }
search_artworks <- function(query, fields = NULL, size = 10) {
  if(is.null(query)) {
    stop("`query` cannot be null")
  }

  # Normalize the search query: trim whitespace and replace spaces with hyphens
  query <- trimws(query)
  query <- gsub(" +", "-", query)

  req <- httr2::request("https://api.artic.edu/api/v1/artworks/search") |>
    httr2::req_url_query(q = query)

  artworks_data <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  object_ids <- dplyr::bind_rows(artworks_data$data)$id

  get_artworks(object_ids = object_ids, fields = fields)
}
