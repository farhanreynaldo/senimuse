#' Retrieve Artwork Data from Museum APIs
#'
#' Fetches artwork information from various museum public APIs
#' using object IDs and optionally specifies which fields to return.
#'
#' @param object_ids A vector of artwork object IDs (numeric or character).
#'   These identifiers correspond to the unique IDs used in the museum's collection.
#'   Cannot be NULL.
#' @param museum A character string indicating the museum to query. Currently supports:
#'   \itemize{
#'     \item "artic" - Art Institute of Chicago
#'     \item "met" - Metropolitan Museum of Art
#'   }
#' @param fields An optional vector of field names (character) to return for each artwork.
#'   If NULL (default), returns all available fields.
#'
#' @return A tibble (data frame) where each row represents one artwork and columns
#'   contain the requested fields. The structure varies depending on the requested fields
#'   and the museum API.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Get artwork from Art Institute of Chicago
#' get_artworks(4, museum = "artic")
#'
#' # Get artwork from Metropolitan Museum of Art
#' get_artworks(436535, museum = "met")
#'
#' # Get multiple artworks with specific fields
#' get_artworks(c(27992, 28560), museum = "artic",
#'              fields = c("title", "artist_display", "date_display"))
#' }
#'
#' @references
#' Art Institute of Chicago API: \url{https://api.artic.edu/docs/}
#' Metropolitan Museum of Art API: \url{https://metmuseum.github.io/}
get_artworks <- function(object_ids, museum = "artic", fields = NULL) {
  if (is.null(object_ids)) {
    stop("`object_ids` cannot be null")
  }

  if (museum == "artic") {
    req <- httr2::request("https://api.artic.edu/api/v1/artworks/") |>
      httr2::req_url_query(ids = object_ids, .multi = "comma")

    if (!is.null(fields)) {
      req <- req |>
        httr2::req_url_query(fields = fields, .multi = "comma")
    }

    artworks_data <- req |>
      httr2::req_perform() |>
      httr2::resp_body_json(simplifyVector = TRUE)

    dplyr::bind_rows(artworks_data$data)
  } else if (museum == "met") {
    if (is.character(object_ids) && length(object_ids) == 1) {
      object_ids <- c(object_ids)
    }
    results <- vector("list", length(object_ids))

    for (i in seq_along(object_ids)) {
      response <- httr2::request(
        "https://collectionapi.metmuseum.org/public/collection/v1/objects/"
      ) |>
        httr2::req_url_path_append(object_ids[[i]]) |>
        httr2::req_throttle(capacity = 60, fill_time_s = 60) |>
        httr2::req_perform() |>
        httr2::resp_body_json()

      results[[i]] <- unlist(response)
    }

    # Convert list to tibble
    if (length(results) > 0) {
      # If fields parameter is provided, subset the data
      if (!is.null(fields)) {
        results <- lapply(results, function(x) {
          x[intersect(names(x), fields)]
        })
      }
      return(dplyr::bind_rows(results))
    } else {
      return(dplyr::tibble())
    }
  } else {
    stop("Unsupported museum. Supported museums are 'artic' and 'met'.")
  }
}


#' Search for Artworks from Museum APIs
#'
#' Searches for artworks in museum collections based on a query string
#' and returns artwork data for matching items.
#'
#' @param query A character string containing the search query. Cannot be NULL.
#'   Spaces will automatically be converted to hyphens.
#' @param museum A character string indicating the museum to query. Currently supports:
#'   \itemize{
#'     \item "artic" - Art Institute of Chicago
#'     \item "met" - Metropolitan Museum of Art
#'   }
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
#' # Search for artworks related to "sunflowers" in Art Institute of Chicago
#' search_artworks("sunflowers", museum = "artic")
#'
#' # Search Met Museum with specific fields to return
#' search_artworks("monet", museum = "met", fields = c("title", "artistDisplayName", "objectDate"))
#'
#' # Search with a larger result set
#' search_artworks("landscape", museum = "artic", size = 25)
#' }
#'
#' @references
#' Art Institute of Chicago API: \url{https://api.artic.edu/docs/}
#' Metropolitan Museum of Art API: \url{https://metmuseum.github.io/}
search_artworks <- function(query, museum = "artic", fields = NULL, size = 10) {
  if (is.null(query)) {
    stop("`query` cannot be null")
  }

  query <- trimws(query)
  query <- gsub(" +", "-", query)
  print(query)

  if (museum == "artic") {
    req <- httr2::request("https://api.artic.edu/api/v1/artworks/search") |>
      httr2::req_url_query(q = query)

    artworks_data <- req |>
      httr2::req_perform() |>
      httr2::resp_body_json(simplifyVector = TRUE)

    object_ids <- dplyr::bind_rows(artworks_data$data)$id
  } else if (museum == "met") {
    req <- httr2::request(
      "https://collectionapi.metmuseum.org/public/collection/v1/search"
    ) |>
      httr2::req_url_query(q = query)

    artworks_data <- req |>
      httr2::req_perform() |>
      httr2::resp_body_json()

    object_ids <- unlist(artworks_data$objectIDs)[1:size]
  } else {
    stop("Unsupported museum. Supported museums are 'artic' and 'met'.")
  }
  get_artworks(object_ids = object_ids, museum = museum, fields = fields)
}
