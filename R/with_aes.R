#' Creates a new aes
#'
#' This is a slightly more focused version of `new_scale()` which
#' supports explicit rename of an aesthetic mapping.
#'
#' @param ... name-value pair with the new name of the aes and the
#' original name it's replacing.
#'
#'
#' @examples
#' library(ggplot2)
#'
#' # Equivalent to melt(volcano), but we don't want to depend on reshape2
#' topography <- expand.grid(x = 1:nrow(volcano),
#'                           y = 1:ncol(volcano))
#' topography$z <- c(volcano)
#'
#' # point measurements of something at a few locations
#' measurements <- data.frame(x = runif(30, 1, 80),
#'                            y = runif(30, 1, 60),
#'                            thing = rnorm(30))
#'
#' ggplot(mapping = aes(x, y)) +
#'   rename_aes(color = "topo_color") +
#'   geom_contour(data = topography, aes(z = z, topo_color = stat(level))) +
#'   # Color scale for topography
#'   scale_color_viridis_c(option = "D") +
#'   clear_aes() +
#'   # geoms below will use another color scale
#'   geom_point(data = measurements, size = 3, aes(colour = thing)) +
#'   # Color scale applied to geoms added after new_scale_color()
#'   scale_color_viridis_c(option = "A")
#'
#' @export
rename_aes <- function(...) {
  aes <- list(...)
  names(aes) <- ggplot2::standardise_aes_names(names(aes))
  aes <- lapply(aes, ggplot2::standardise_aes_names)
  structure(aes, class = "rename_next")
}

#' @export
#' @rdname rename_aes
clear_aes <- function() {
  structure(NA, class = "clear_aes")
}

#' @export
chooseOpsMethod.ggplot_rename_next <- function(x, y, mx, my, cl, reverse) TRUE

#' @export
ggplot_add.rename_next <- function(object, plot, ...) {
  class(plot) <- c("ggplot_rename_next", class(plot))
  plot$rename_aes <- object
  return(plot)
}

#' @export
ggplot_add.clear_aes <- function(object, plot, ...) {
  return(plot)
}


#' Add method to plots that have new scales
#'
#' @param e1 PLot
#' @param e2 element to add to the plot (layer, scale, guides, list of layers).
#'
#' @export
"+.ggplot_rename_next" <- function(e1, e2) {
  if (inherits(e2, "clear_aes")) {
    e1$rename_aes <- NULL
    class(e1) <- setdiff(class(e1), "ggplot_rename_next")
    return(e1)
  }
  # browser()
  rename_aes <- e1$rename_aes
  if (inherits(e2, "Layer")) {
    e2 <- bump_aes_layer(
      layer = e2,
      names(rename_aes)[[1]],
      rename_aes[[1]]
    )
  }

  if (inherits(e2, "Scale")) {
    e2 <- bump_aes_scale(
      e2,
      names(rename_aes)[[1]],
      rename_aes[[1]]
    )
  }

  NextMethod()
}
