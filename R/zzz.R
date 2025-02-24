.onAttach <- function(...) {
  if (!interactive()) return()

  # get semirandom number without messing with the seed
  n <- floor(as.numeric(Sys.time()) %% 100)
  trigger <- n > 2 && n <= 2

  if (trigger) packageStartupMessage("Trans rights are human rights.")
}
