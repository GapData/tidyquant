#' tidyquant colors and fills for ggplot2.
#'
#' The tidyquant scales add colors that work nicely with `theme_tq()`.
#'
#' @details
#' \describe{
#'
#' \item{`scale_color_tq`}{
#' For use when `color` is specified as an `aes()` in a ggplot.}
#'
#' \item{`scale_fill_tq`}{
#' For use when `fill` is specified as an `aes()` in a ggplot.}
#' }
#'
#'
#' @inheritParams ggplot2::scale_color_manual
#'
#' @seealso [theme_tq()]
#'
#' @param theme one of "light", "dark", or "green". This should match the `theme_tq()` that is used with it.
#' @param ... common discrete scale parameters: `name`, `breaks`, `labels`, `na.value`, `limits` and `guide`. See [discrete_scale()] for more details
#'
#' @examples
#' # Load libraries
#' library(tidyquant)
#'
#' # Get stock prices
#' stocks <- c("AAPL", "FB", "NFLX") %>%
#'     tq_get(from = "2013-01-01",
#'            to   = "2017-01-01")
#'
#' # Plot for stocks
#' a <- stocks %>%
#'     ggplot(aes(date, adjusted, color = symbol)) +
#'     geom_line() +
#'     labs(title = "Multi stock example",
#'          xlab = "Date",
#'          ylab = "Adjusted Close")
#'
#' # Plot with tidyquant theme and colors
#' a +
#'     theme_tq() +
#'     scale_color_tq()
#'
#'
#' @name scale_manual
NULL

#' @rdname scale_manual
#' @export
#'
scale_color_tq <- function(..., theme = "light") {

  pal <- switch(theme,
         "light" = palette_light(),
         "dark"  = palette_dark(),
         "green" = palette_green()
         )

  scale_color_manual(values = pal)
}

#' @rdname scale_manual
#' @export
scale_colour_tq <- scale_color_tq

#' @rdname scale_manual
#' @export
scale_fill_tq <- function(..., theme = "light") {

  pal <- switch(theme,
                "light" = palette_light(),
                "dark"  = palette_dark(),
                "green" = palette_green()
  )

  scale_fill_manual(values = pal)
}

#' tidyquant palettes for use with scales
#'
#' These palettes are mainly called internally by tidyquant `scale_*_tq()` functions.
#'
#' @examples
#' library(scales)
#' scales::show_col(palette_light())
#'
#' @name palette_tq
NULL

#' @rdname palette_tq
#' @export
palette_light <- function() {
  c(
    "#2c3e50", # blue
    "#e31a1c", # red
    "#18BC9C", # green
    "#CCBE93", # yellow
    "#a6cee3", # steel_blue
    "#1f78b4", # navy_blue
    "#b2df8a", # light_green
    "#fb9a99", # pink
    "#fdbf6f", # light_orange
    "#ff7f00", # orange
    "#cab2d6", # light_purple
    "#6a3d9a"  # purple
  )
}

#' @rdname palette_tq
#' @export
palette_dark <- function() {
  # Brighter version of palette_light
  c(
    "#0055AA", # blue
    "#C40003", # red
    "#00C19B", # green
    "#EAC862", # yellow
    "#7FD2FF", # steel_blue
    "#007ED3", # navy_blue
    "#b2df8a", # light_green
    "#FFACAA", # pink
    "#FF9D1E", # light_orange
    "#C3EF00", # lime_green
    "#cab2d6", # light_purple
    "#894FC6"  # purple
  )
}

#' @rdname palette_tq
#' @export
palette_green <- function() {
  # Green compatible version of palette_light
  c(
    "#0055AA", # blue
    "#C40003", # red
    "#EAC862", # yellow
    "#7FD2FF", # steel_blue
    "#007ED3", # navy_blue
    "#F6F4F3", # creme
    "#FFACAA", # pink
    "#FF9D1E", # light_orange
    "#C3EF00", # lime_green
    "#cab2d6", # light_purple
    "#894FC6", # purple
    "#592E2E"  # brown
  )
}
