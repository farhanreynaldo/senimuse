#' Retrieve Gallery Information from the Art Institute of Chicago API
#'
#' Fetches a complete list of galleries from the Art Institute of Chicago's public API,
#' automatically handling pagination to return all available records. The function
#' implements rate limiting to comply with API best practices.
#'
#' @return A tibble (data frame) where each row represents one gallery, containing all
#'   available fields provided by the API.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Get all galleries
#' gallery_data <- galleries()
#' }
#'
#' @references
#' Art Institute of Chicago API documentation: \url{https://api.artic.edu/docs}
galleries <- function() {
  galleries_data <- list()

  base_url <- "https://api.artic.edu/api/v1/galleries/"
  next_url <- base_url

  while(!is.null(next_url)) {
    resp <- httr2::request(next_url) |>
      httr2::req_throttle(rate = 60 / 60) |>
      httr2::req_url_query(limit = 100) |>
      httr2::req_perform() |>
      httr2::resp_body_json()

    galleries_data <- append(galleries_data, resp$data)
    next_url <- resp$pagination$next_url
  }

  dplyr::bind_rows(galleries_data)
}
