#' @importFrom ggplot2 guide_colourbar guide_colorbar guide_legend
bump_aes_scale <- function(scale, original_aes, new_aes) {
  if (is.null(scale)) {
    return(scale)
  }

  if (is_protected(scale, original_aes)) {
    return(scale)
  }

  old_aes <- scale$aesthetics[scale$aesthetics %in% original_aes]
  if (length(old_aes) != 0) {
    scale$aesthetics[scale$aesthetics %in% original_aes] <- new_aes

    if (is.character(scale$guide)) {
      no_guide <- isTRUE(scale$guide == "none")
    } else {
      no_guide <- isFALSE(scale$guide) ||
        isTRUE(inherits(scale$guide, c("guide_none", "GuideNone")))
    }
    if (!no_guide) {
      if (is.character(scale$guide)) {
        scale$guide <- get(paste0("guide_", scale$guide), mode = "function")()
      }
      if (inherits(scale$guide, "Guide")) {
        # Make clone of guie
        old <- scale$guide
        new <- ggplot2::ggproto(NULL, old)

        # Change available aesthetics
        new$available_aes <- change_name(new$available_aes, old_aes, new_aes)
        new$available_aes[new$available_aes %in% old_aes] <- new_aes

        # Update aesthetic override
        if (!is.null(new$params$override.aes)) {
          new$params$override.aes <- change_name(new$params$override.aes, old_aes, new_aes)
        }

        # Re-assign updated guide
        scale$guide <- new
      } else {
        scale$guide$available_aes[scale$guide$available_aes %in% old_aes] <- new_aes

        if (!is.null(scale$guide$override.aes)) {
          names(scale$guide$override.aes)[names(scale$guide$override.aes) == old_aes] <- new_aes
        }
      }

    }
  }

  scale <- protect(scale, original_aes)
  scale
}


bump_aes_scales <- function(scales, original_aes, new_aes) {
  lapply(scales, bump_aes_scale, original_aes = original_aes, new_aes = new_aes)
}
