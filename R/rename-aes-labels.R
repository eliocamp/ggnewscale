
rename_aes.labels <- function(layer, renamed_aes) {
  # renamed_aes is list(old_name = new_name)
  old_name <- names(renamed_aes)
  new_name <- renamed_aes[[1]]

  names(layer)[names(layer) %in% old_name] <- new_name
  layer
}
