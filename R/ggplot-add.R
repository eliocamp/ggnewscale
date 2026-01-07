#' @export
#' @importFrom ggplot2 ggplot_add
ggplot_add.new_aes <- function(object, plot, ...) {
  scale_number <- (plot$ggnewscale_scales[[object]] %||% 0) + 1
  new_aes <- aes_name(object, scale_number)

  plot <- assing_scales(new_aes = new_aes, original_aes = object, plot)

  # Global aes
  old_aes <- names(plot$mapping)[names(plot$mapping) %in% object]
  names(plot$mapping)[names(plot$mapping) == old_aes] <- new_aes

  plot$layers <- bump_aes_layers(
    plot$layers,
    original_aes = object,
    new_aes = new_aes
  )
  plot$scales$scales <- bump_aes_scales(
    plot$scales$scales,
    original_aes = object,
    new_aes = new_aes
  )
  plot$labels <- bump_aes_labels(
    plot$labels,
    original_aes = object,
    new_aes = new_aes
  )
  plot$guides$guides <- bump_aes_guides(
    plot$guides$guides,
    original_aes = object,
    new_aes = new_aes
  )

  if (is.null(plot$ggnewscale_scales[[object]])) {
    plot$ggnewscale_scales[[object]] <- 1
  } else {
    plot$ggnewscale_scales[[object]] <- plot$ggnewscale_scales[[object]] + 1
  }

  plot
}
