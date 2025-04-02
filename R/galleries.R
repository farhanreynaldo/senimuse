#' Get galleries
#'
#' @returns A data frame of galleries
#' @export
#'
#' @examples
#'\dontrun{
#' galleries()
#' }
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
