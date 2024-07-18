bump_aes_layer <- function(layer, original_aes, new_aes) {
  # Don't touch it if it has been renamed previously
  if (is_protected(layer, original_aes)) {
    return(layer)
  }

  new_layer <- ggplot2::ggproto(NULL, layer)

  # Get explicit mapping
  old_aes <- names(new_layer$mapping)[names(new_layer$mapping) %in% original_aes]

  # If not explicit, get the default
  if (length(old_aes) == 0) {
    old_aes <- names(new_layer$stat$default_aes)[names(new_layer$stat$default_aes) %in% original_aes]
    if (length(old_aes) == 0) {
      old_aes <- names(new_layer$geom$default_aes)[names(new_layer$geom$default_aes) %in% original_aes]
    }
  }
  # Return unchanged layer if it doens't use this aes
  if (length(old_aes) == 0) {
    return(new_layer)
  }

  old_geom <- new_layer$geom

  old_handle_na <- old_geom$handle_na
  new_handle_na <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_aes] <- original_aes
    old_handle_na(data, params)
  }

  new_geom <- ggplot2::ggproto(paste0("New", class(old_geom)[1]), old_geom,
                               handle_na = new_handle_na)

  new_geom$default_aes <- change_name(new_geom$default_aes, old_aes, new_aes)
  new_geom$non_missing_aes <- change_name(new_geom$non_missing_aes, old_aes, new_aes)
  new_geom$required_aes <- change_name(new_geom$required_aes, old_aes, new_aes)
  new_geom$optional_aes <- change_name(new_geom$optional_aes, old_aes, new_aes)

  draw_key <- new_geom$draw_key
  new_draw_key <- function(data, params, size) {
    colnames(data)[colnames(data) == new_aes] <- original_aes
    draw_key(data, params, size)
  }
  new_geom$draw_key <- new_draw_key

  new_layer$geom <- new_geom

  old_stat <- new_layer$stat

  new_handle_na <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_aes] <- original_aes
    ggplot2::ggproto_parent(self$super(), self)$handle_na(data, params)
  }

  new_setup_data <- function(self, data, scales, ...) {
    # After setup data, I need to go back to the new aes names, otherwise
    # scales are not applied.
    colnames(data)[colnames(data) %in% new_aes] <- original_aes
    data <- ggplot2::ggproto_parent(self$super(), self)$setup_data(data, scales, ...)
    colnames(data)[colnames(data) %in% original_aes] <- new_aes
    data
  }

  if (!is.null(old_stat$is_new)) {
    parent <- old_stat$super()
  } else {
    parent <- ggplot2::ggproto(NULL, old_stat)
  }

  new_stat <- ggplot2::ggproto(paste0("New", class(old_stat)[1]), parent,
                               setup_data = new_setup_data,
                               handle_na = new_handle_na,
                               is_new = TRUE)

  new_stat$default_aes <- change_name(new_stat$default_aes, old_aes, new_aes)
  new_stat$non_missing_aes <- change_name(new_stat$non_missing_aes, old_aes, new_aes)
  new_stat$required_aes <- change_name(new_stat$required_aes, old_aes, new_aes)
  new_stat$optional_aes <- change_name(new_stat$optional_aes, old_aes, new_aes)

  new_layer$stat <- new_stat

  # Make implicit mapping explicit.
  # This fixes https://github.com/eliocamp/ggnewscale/issues/45 but it feels
  # wrong. I don't understand why implicit mapping breaks when adding more than
  # one extra scale.
  if (is.null(new_layer$mapping[[old_aes]])) {
    new_layer$mapping[[old_aes]] <- new_stat$default_aes[[new_aes]]
  }
  new_layer$mapping <- change_name(new_layer$mapping, old_aes, new_aes)
  new_layer$aes_params <- change_name(new_layer$aes_params, old_aes, new_aes)

  # Restore custom attributes
  attributes_old <- attributes(layer)
  attributes_new <- attributes(new_layer)
  attributes_replace <- attributes_old[setdiff(names(attributes_old), names(attributes_new))]
  attributes(new_layer)[names(attributes_replace)] <- attributes_replace

  new_layer <- protect(new_layer, original_aes)
  new_layer
}


bump_aes_layers <- function(layers, original_aes, new_aes) {
  lapply(layers, bump_aes_layer, original_aes = original_aes, new_aes = new_aes)

}
