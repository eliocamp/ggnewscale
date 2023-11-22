
rename_aes.Layer <- function(layer, renamed_aes) {
  # renamed_aes is list(old_name = new_name)
  old_name <- names(renamed_aes)
  new_name <- renamed_aes[[1]]

  # Return unchanged layer if it doesn't use this aes
  if (!(old_name %in% c(layer$geom$aesthetics(), layer$stat$aesthetics()))) {
    return(layer)
  }

  new_layer <- ggplot2::ggproto(NULL, layer)

  # Change explicit mapping, if present
  if (old_name %in% names(new_layer$mapping)) {
    names(new_layer$mapping)[names(new_layer$mapping) == old_name] <- new_name
  }


  old_geom <- new_layer$geom

  old_handle_na <- old_geom$handle_na
  new_handle_na <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_name] <- old_name
    old_handle_na(data, params)
  }

  new_geom <- ggplot2::ggproto(paste0("New", class(old_geom)[1]), old_geom,
                               handle_na = new_handle_na)

  new_geom$default_aes <- change_name(new_geom$default_aes, old_name, new_name)
  new_geom$non_missing_aes <- change_name(new_geom$non_missing_aes, old_name, new_name)
  new_geom$required_aes <- change_name(new_geom$required_aes, old_name, new_name)
  new_geom$optional_aes <- change_name(new_geom$optional_aes, old_name, new_name)

  draw_key <- new_geom$draw_key
  new_draw_key <- function(data, params, size) {
    colnames(data)[colnames(data) == new_name] <- old_name
    draw_key(data, params, size)
  }
  new_geom$draw_key <- new_draw_key

  new_layer$geom <- new_geom

  old_stat <- new_layer$stat

  new_handle_na <- function(self, data, params) {
    colnames(data)[colnames(data) %in% new_name] <- old_name
    ggplot2::ggproto_parent(self$super(), self)$handle_na(data, params)
  }

  new_setup_data <- function(self, data, scales, ...) {
    # After setup data, I need to go back to the new aes names, otherwise
    # scales are not applied.
    colnames(data)[colnames(data) %in% new_name] <- old_name
    data <- ggplot2::ggproto_parent(self$super(), self)$setup_data(data, scales, ...)
    colnames(data)[colnames(data) %in% old_name] <- new_name
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

  new_stat$default_aes <- change_name(new_stat$default_aes, old_name, new_name)
  new_stat$non_missing_aes <- change_name(new_stat$non_missing_aes, old_name, new_name)
  new_stat$required_aes <- change_name(new_stat$required_aes, old_name, new_name)
  new_stat$optional_aes <- change_name(new_stat$optional_aes, old_name, new_name)

  new_layer$stat <- new_stat

  # Make implicit mapping explicit.
  # This fixes https://github.com/eliocamp/ggnewscale/issues/45 but it feels
  # wrong. I don't understand why implicit mapping breaks when adding more than
  # one extra scale.
  if (is.null(new_layer$mapping[[old_name]])) {
    new_layer$mapping[[old_name]] <- new_stat$default_aes[[new_name]]
  }
  new_layer$mapping <- change_name(new_layer$mapping, old_name, new_name)
  new_layer$aes_params <- change_name(new_layer$aes_params, old_name, new_name)
  new_layer

}

