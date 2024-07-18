
isTRUE <- function (x) {
  is.logical(x) && length(x) == 1L && !is.na(x) && x
}

isFALSE <- function (x) {
  is.logical(x) && length(x) == 1L && !is.na(x) && !x
}


`%||%` <- function(x, default) {
  if (is.null(x)) default else x
}

remove_new <- function(aes) {
  gsub("_ggnewscale_\\d+", "", aes, fixed = FALSE)
}

aes_name <- function(aes, scale_number) {
  paste0(aes, "_ggnewscale_", scale_number)
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


protect <- function(object, aes) {
  UseMethod("protect")
}

protect.default <- function(object, aes) {
  object$ggnewscale_renamed <- unique(c(object$ggnewscale_renamed, aes))
  return(object)
}

protect.character <- function(object, aes) {
  attr(object, "ggnewscale_renamed") <- unique(c(attr(object, "ggnewscale_renamed"), aes))
  return(object)
}



is_protected <- function(object, aes) {
  UseMethod("is_protected")
}

is_protected.default <- function(object, aes) {
  aes %in% object$ggnewscale_renamed
}

is_protected.character <- function(object, aes) {
  aes %in% attr(object, "ggnewscale_renamed")
}
