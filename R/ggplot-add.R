
#' @export
#' @importFrom ggplot2 ggplot_add
ggplot_add.new_aes <- function(object, plot, object_name) {
  # To add default scales (I need to build the whole plot because they might be computed aesthetics)
  if (is.null(plot$scales$get_scales(object))) {
    built <- ggplot2::ggplot_build(plot)
    plot$scales$add(built$plot$scales$get_scales(object))
  }

  scale_number <- (plot$ggnewscale_scales[[object]]  %||% 0) + 1
  new_aes <- aes_name(object, scale_number)

  # Global aes
  old_aes <- names(plot$mapping)[names(plot$mapping) %in% object]
  names(plot$mapping)[names(plot$mapping) == old_aes] <- new_aes

  plot$layers <- bump_aes_layers(plot$layers, original_aes = object, new_aes = new_aes)
  plot$scales$scales <- bump_aes_scales(plot$scales$scales, original_aes = object, new_aes = new_aes)
  plot$labels <- bump_aes_labels(plot$labels, original_aes = object, new_aes = new_aes)
  plot$guides$guides <- bump_aes_guides(plot$guides$guides, original_aes = object, new_aes = new_aes)

  if (is.null(plot$ggnewscale_scales[[object]])) {
    plot$ggnewscale_scales[[object]] <- 1
  } else {
    plot$ggnewscale_scales[[object]] <- plot$ggnewscale_scales[[object]] + 1
  }

  plot
}