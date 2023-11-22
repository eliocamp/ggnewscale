#' @export
chooseOpsMethod.gg_ggnewscale_renamed_aes <- function(x, y, mx, my, cl, reverse) TRUE

#' @export
#' @importFrom ggplot2 ggplot_add
ggplot_add.ggnewscale_aes_renamer <- function(object, plot, object_name) {
  class(plot) <- c("gg_ggnewscale_renamed_aes", class(plot))
  # Add the ggnewscale prefix to reduce risk of collisions
  plot[["ggnewscale_renamed_aes"]] <- combine_renamed_aes(plot[["ggnewscale_renamed_aes"]],
                                                          object)
  return(plot)
}

combine_renamed_aes <- function(x = NULL, renamed_aes) {
  renamed_aes <- instantiate_renamed_aes(renamed_aes,  x[[names(renamed_aes)]])

  x[[names(renamed_aes)]] <- renamed_aes[[1]]

  return(x)
}


instantiate_renamed_aes <- function(renamed_aes, existing_name) {

  if (!is.null(renamed_aes[[1]])) {
    return(new_scale(aes = ggplot2::standardise_aes_names(names(renamed_aes)),
                     new_name = ggplot2::standardise_aes_names(renamed_aes[[1]])))
  }

  if (is.null(existing_name)) {
    existing_name <- names(renamed_aes)
  }
  new_scale(aes = ggplot2::standardise_aes_names(names(renamed_aes)),
            new_name = ggplot2::standardise_aes_names(paste0(existing_name, "_new")))

}


#' @export
"+.gg_ggnewscale_renamed_aes" <- function(e1, e2) {
  if (inherits(e2, "list")) {
    for (o in e2) {
      e1 <- e1 + rename_aes(o, renamed_aes = e1[["ggnewscale_renamed_aes"]])
    }
    return(e1)
  }
  e2 <- rename_aes(layer = e2, renamed_aes = e1[["ggnewscale_renamed_aes"]])

  NextMethod()
}

#' @export
"%+%.gg_ggnewscale_renamed_aes" <- `+.gg_ggnewscale_renamed_aes`

rename_aes <- function(layer, renamed_aes) {
  UseMethod("rename_aes")
}

rename_aes.default <- function(layer, renamed_aes) {
  return(layer)
}



