library(ggplot2)

ggplot(expand.grid(x = 1:20, y = 1)) +
  geom_tile(aes(x, y, fill = cos(x / 20 * 2 * pi))) +
  scale_y_continuous(limits = c(-2, 2)) +
  coord_polar() +
  theme_void() -> base


options <- c("magma", "inferno", "plasma", "viridis", "cividis")


lapply(options, function(o) {
  g <- base + scale_fill_viridis_c(guide = "none", option = o)
  ggsave(paste0("man/figures/", o, ".svg"), plot = g)
}) -> n
