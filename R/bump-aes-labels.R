
bump_aes_labels <- function(labels, original_aes, new_aes) {
  for (l in seq_along(labels)) {
    if (is_protected(labels[[l]], original_aes)) {
      next
    }

    if (names(labels)[[l]] == original_aes) {
      names(labels)[[l]] <- new_aes
      labels[[l]] <- protect(labels[[l]], original_aes)
    }
  }

  labels
}


