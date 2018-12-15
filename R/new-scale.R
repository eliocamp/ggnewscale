#' Adds a new scale to a plot
#'
#' Creates a new scale "slot". Geoms added to a plot after this function will
#' use a new scale definition.
#'
#' @param new_aes A string with the name of the aesthetic for which a new scale
#' swill be created.
#'
#' @details
#' `new_scale_color()`, `new_scale_colour()` and `new_scale_fill()` are just
#' aliases to `new_scale("color")`, etc...
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
#'   geom_contour(data = topography, aes(z = z, color = stat(level))) +
#'   # Color scale for topography
#'   scale_color_viridis_c(option = "D") +
#'   # geoms below will use another color scale
#'   new_scale_color() +
#'   geom_point(data = measurements, size = 3, aes(color = thing)) +
#'   # Color scale applied to geoms added after new_scale_color()
#'   scale_color_viridis_c(option = "A")
#'
#' @export
new_scale <- function(new_aes) {
  structure(ggplot2::standardise_aes_names(new_aes), class = "new_aes")
}

#' @export
#' @rdname new_scale
new_scale_fill <- function() {
  new_scale("fill")
}

#' @export
#' @rdname new_scale
new_scale_color <- function() {
  new_scale("colour")
}

#' @export
#' @rdname new_scale
new_scale_colour <- function() {
  new_scale("colour")
}

#' @export
#' @importFrom ggplot2 ggplot_add
ggplot_add.new_aes <- function(object, plot, object_name) {
  plot$layers <- bump_aes_layers(plot$layers, new_aes = object)
  plot$scales$scales <- bump_aes_scales(plot$scales$scales, new_aes = object)
  plot$labels <- bump_aes_labels(plot$labels, new_aes = object)
  plot
}

bump_aes_layers <- function(layers, new_aes) {
  lapply(layers, bump_aes_layer, new_aes = new_aes)

}

bump_aes_layer <- function(layer, new_aes) {
  original_aes <- new_aes

  old_aes <- names(layer$mapping)[remove_new(names(layer$mapping)) %in% new_aes]
  new_aes <- paste0(old_aes, "_new")

  old_geom <- layer$geom

  old_setup <- old_geom$handle_na
  new_setup <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_aes] <- original_aes
    old_setup(data, params)
  }

  new_geom <- ggplot2::ggproto(paste0("New", class(old_geom)[1]), old_geom,
                               handle_na = new_setup)

  new_geom$default_aes <- change_name(new_geom$default_aes, old_aes, new_aes)
  new_geom$non_missing_aes <- change_name(new_geom$non_missing_aes, old_aes, new_aes)
  new_geom$required_aes <- change_name(new_geom$required_aes, old_aes, new_aes)
  new_geom$optional_aes <- change_name(new_geom$optional_aes, old_aes, new_aes)

  layer$geom <- new_geom

  old_stat <- layer$stat

  old_setup2 <- old_stat$handle_na
  new_setup <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_aes] <- original_aes
    old_setup2(data, params)
  }

  new_stat <- ggplot2::ggproto(paste0("New", class(old_stat)[1]), old_stat,
                               handle_na = new_setup)

  new_stat$default_aes <- change_name(new_stat$default_aes, old_aes, new_aes)
  new_stat$non_missing_aes <- change_name(new_stat$non_missing_aes, old_aes, new_aes)
  new_stat$required_aes <- change_name(new_stat$required_aes, old_aes, new_aes)
  new_stat$optional_aes <- change_name(new_stat$optional_aes, old_aes, new_aes)

  layer$stat <- new_stat

  layer$mapping <- change_name(layer$mapping, old_aes, new_aes)
  layer
}

bump_aes_scales <- function(scales, new_aes) {
  lapply(scales, bump_aes_scale, new_aes = new_aes)
}

bump_aes_scale <- function(scale, new_aes) {
  old_aes <- scale$aesthetics[remove_new(scale$aesthetics) %in% new_aes]
  new_aes <- paste0(old_aes, "_new")

  scale$aesthetics[scale$aesthetics %in% old_aes] <- new_aes

  if (is.character(scale$guide)) {
    scale$guide <- match.fun(paste("guide_", scale$guide, sep = ""))()
  }
  scale$guide$available_aes[scale$guide$available_aes %in% old_aes] <- new_aes
  scale
}

bump_aes_labels <- function(labels, new_aes) {
  old_aes <-  names(labels)[remove_new(names(labels)) %in% new_aes]
  new_aes <- paste0(old_aes, "_new")

  names(labels)[names(labels) %in% old_aes] <- new_aes
  labels
}


change_name <- function(list, old, new) {
  UseMethod("change_name")
}

change_name.character <- function(list, old, new) {
  list[list %in% old] <- new
  list
}

change_name.default <- function(list, old, new) {
  nam <- names(list)
  nam[nam %in% old] <- new
  names(list) <- nam
  list
}

change_name.NULL <- function(list, old, new) {
  NULL
}


remove_new <- function(aes) {
  stringi::stri_replace_all(aes, "", regex = "(_new)*")
}
