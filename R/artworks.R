#' Get artworks
#'
#' @param object_ids Artwork object ids based on Artic
#' @param fields Fields to be extracted
#'
#' @returns A data frame.
#' @export
#'
#' @examples
#' get_artworks(4)
get_artworks <- function(object_ids = NULL, fields = NULL) {
  if(is.null(object_ids)) {
    stop("`object_ids` cannot be null")
  }

  req <- httr2::request("https://api.artic.edu/api/v1/artworks/")
  artworks <- req |>
    httr2::req_url_query(ids = object_ids, .multi = "comma")

  if(!is.null(fields)) {
    artworks <- artworks |>
      httr2::req_url_query(fields = fields, .multi = "comma")
  }

  artworks <- artworks |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  purrr::map_dfr(artworks$data, get_artwork_fields)
}

#' A function to extract fields from artwork
#' @description Extract fields from artwork list
#' @keywords internal
#' @export
get_artwork_fields <- function(artwork) {
  c(
    title = artwork$title,
    date_start = artwork$date_start,
    date_end = artwork$date_end,
    place_of_origin = artwork$place_of_origin,
    artist_display = artwork$artist_display,
    medium_display = artwork$medium_display,
    artist_id = artwork$artist_id,
    artist_title = artwork$artist_title,
    artwork_type_id = artwork$artwork_type_id,
    artwork_type_title = artwork$artwork_type_title,
    department_id = artwork$department_id,
    department_title = artwork$department_title
  )
}
