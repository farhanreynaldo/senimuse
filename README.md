
<!-- README.md is generated from README.Rmd. Please edit that file -->

# senimuse

<!-- badges: start -->
<!-- badges: end -->

The goal of senimuse is to …

## Installation

You can install the development version of senimuse like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(senimuse)
get_artworks(4)
#>   id api_model                                api_link is_boosted
#> 1  4  artworks https://api.artic.edu/api/v1/artworks/4      FALSE
#>            title alt_titles
#> 1 Priest and Boy         NA
#>                                                                                                                                                                                                                                   thumbnail.lqip
#> 1 data:image/gif;base64,R0lGODlhBAAFAPQAAF1aS2deUJSLdpGKeKuegaSgiqunjK+pkrivk763mr+6n7+5osa+osi/o83EqdDIr9PKr9vRutvTvOHYwwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAAAAAAAIf4KQXBwbGVNYXJrCgAsAAAAAAQABQAABRHgI01RwzhQIhCIAQSDUhxLCAA7
#>   thumbnail.width thumbnail.height
#> 1             557              768
#>                                             thumbnail.alt_text
#> 1 A work made of watercolor over graphite on cream wove paper.
#>   main_reference_number has_not_been_viewed_much boost_rank date_start date_end
#> 1                1880.1                    FALSE         NA       1865     1880
#>   date_display   date_qualifier_title date_qualifier_id
#> 1         n.d. Artist's working dates                15
#>                                   artist_display place_of_origin description
#> 1 Lawrence Carmichael Earle\nAmerican, 1845-1921   United States          NA
#>   short_description                           dimensions  dimensions_detail
#> 1                NA 47.2 × 34.5 cm (18 5/8 × 13 5/8 in.) NA, 34, 47, NA, NA
#>                                 medium_display inscriptions
#> 1 Watercolor over graphite on cream wove paper           NA
#>                      credit_line catalogue_display publication_history
#> 1 The Charles Deering Collection                NA                  NA
#>   exhibition_history provenance_text edition publishing_verification_level
#> 1                 NA              NA      NA                     Web Basic
#>   internal_department_id fiscal_year fiscal_year_deaccession is_public_domain
#> 1                      3          NA                      NA             TRUE
#>   is_zoomable max_zoom_window_size copyright_notice has_multimedia_resources
#> 1        TRUE                   -1               NA                    FALSE
#>   has_educational_resources has_advanced_imaging colorfulness color.h color.l
#> 1                     FALSE                FALSE      18.8599      43      49
#>   color.s color.percentage color.population latitude longitude latlon
#> 1      16       0.01184198              116       NA        NA     NA
#>   is_on_view on_loan_display gallery_title gallery_id nomisma_id
#> 1      FALSE              NA            NA         NA         NA
#>       artwork_type_title artwork_type_id    department_title department_id
#> 1 Drawing and Watercolor              14 Prints and Drawings         PC-13
#>   artist_id              artist_title alt_artist_ids artist_ids
#> 1     34348 Lawrence Carmichael Earle           NULL      34348
#>               artist_titles category_ids     category_titles
#> 1 Lawrence Carmichael Earle        PC-13 Prints and Drawings
#>                                                                                                         term_titles
#> 1 drawings (visual works), paper (fiber product), watercolor, water-base paint, paint, graphite, prints and drawing
#>   style_id style_title alt_style_ids style_ids style_titles classification_id
#> 1       NA          NA          NULL      NULL         NULL              TM-5
#>      classification_title alt_classification_ids classification_ids
#> 1 drawings (visual works)                   TM-4         TM-5, TM-4
#>                         classification_titles subject_id alt_subject_ids
#> 1 drawings (visual works), prints and drawing         NA            NULL
#>   subject_ids subject_titles material_id                   alt_material_ids
#> 1        NULL           NULL     TM-2982 TM-2403, TM-3343, TM-2577, TM-2410
#>                                  material_ids
#> 1 TM-2982, TM-2403, TM-3343, TM-2577, TM-2410
#>                                                        material_titles
#> 1 paper (fiber product), watercolor, water-base paint, paint, graphite
#>   technique_id alt_technique_ids technique_ids technique_titles theme_titles
#> 1           NA              NULL          NULL             NULL         NULL
#>                               image_id alt_image_ids document_ids sound_ids
#> 1 1753b638-d4fb-8e45-3db9-92dde7f053da          NULL         NULL      NULL
#>   video_ids text_ids section_ids section_titles site_ids
#> 1      NULL     NULL        NULL           NULL     NULL
#>                                suggest_autocomplete_all
#> 1 1880.1, Priest and Boy, accession, title, NA, 1071916
#>           source_updated_at                updated_at                 timestamp
#> 1 2022-09-21T19:18:44-05:00 2025-03-19T20:23:12-05:00 2025-04-02T23:00:59-05:00
```
