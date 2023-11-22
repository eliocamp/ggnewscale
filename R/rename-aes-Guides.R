
rename_aes.Guide <- function(layer, renamed_aes) {
  # renamed_aes is list(old_name = new_name)
  old_name <- names(renamed_aes)
  new_name <- renamed_aes[[1]]

  # Make clone of guide
  new <- ggproto(NULL, layer)

  # Change available aesthetics
  new$available_aes <- change_name(new$available_aes, old_name, new_name)

  # Update aesthetic override
  if (!is.null(new$params$override.aes)) {
    new$params$override.aes <- change_name(new$params$override.aes, old_name, new_name)
  }
  new
}
