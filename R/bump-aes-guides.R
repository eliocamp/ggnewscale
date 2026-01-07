bump_aes_guides <- function(guides, original_aes, new_aes) {
  for (g in seq_along(guides)) {
    if (is_protected(guides[[g]], original_aes)) {
      next
    }

    if (names(guides)[[g]] == original_aes) {
      names(guides)[[g]] <- new_aes
      guides[[g]]$available_aes <- union(guides[[g]]$available_aes, new_aes)
      guides[[g]] <- protect(guides[[g]], original_aes)
    }
  }

  guides
}
