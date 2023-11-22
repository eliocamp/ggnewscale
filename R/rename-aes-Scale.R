#' @importFrom ggplot2 guide_colourbar guide_colorbar guide_legend
rename_aes.Scale <- function(layer, renamed_aes) {
  # renamed_aes is list(old_name = new_name)
  old_name <- names(renamed_aes)
  new_name <- renamed_aes[[1]]

  if (!(old_name %in% layer$aesthetics)) {
    return(layer)
  }
  new_layer <- layer$clone()

  new_layer$aesthetics[new_layer$aesthetics %in% old_name] <- new_name

  if (has_no_guide(new_layer)) {
    return(new_layer)
  }

  if (is.character(new_layer$guide)) {
    new_layer$guide <- get(paste0("guide_", new_layer$guide), mode = "function")()
  }

  if (inherits(new_layer$guide, "Guide")) {
    new_layer$guide <- rename_aes(new_layer$guide, renamed_aes)
  } else {
    new_layer$guide$available_aes <- change_name(new_layer$guide$available_aes, old_name, new_name)

    if (!is.null(new_layer$guide$override.aes)) {
      new_layer$guide$override.aes <- change_name(new_layer$guide$override.aes, old_name, new_name)
    }
  }

  new_layer
}


has_no_guide <- function(layer) {
  if (is.character(layer$guide)) {
    no_guide <- isTRUE(layer$guide == "none")
  } else {
    no_guide <- isFALSE(layer$guide) ||
      isTRUE(inherits(layer$guide, c("guide_none", "GuideNone")))
  }
}