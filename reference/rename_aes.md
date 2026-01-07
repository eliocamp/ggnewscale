# Creates a new aes

This is a slightly more focused version of
[`new_scale()`](https://eliocamp.github.io/ggnewscale/reference/new_scale.md)
which supports explicit rename of an aesthetic mapping.

## Usage

``` r
rename_aes(...)

clear_aes()
```

## Arguments

- ...:

  name-value pair with the new name of the aes and the original name
  it's replacing.

## Examples

``` r
library(ggplot2)

# Equivalent to melt(volcano), but we don't want to depend on reshape2
topography <- expand.grid(x = 1:nrow(volcano),
                          y = 1:ncol(volcano))
topography$z <- c(volcano)

# point measurements of something at a few locations
measurements <- data.frame(x = runif(30, 1, 80),
                           y = runif(30, 1, 60),
                           thing = rnorm(30))

ggplot(mapping = aes(x, y)) +
  rename_aes(color = "topo_color") +
  geom_contour(data = topography, aes(z = z, topo_color = stat(level))) +
  # Color scale for topography
  scale_color_viridis_c(option = "D") +
  clear_aes() +
  # geoms below will use another color scale
  geom_point(data = measurements, size = 3, aes(colour = thing)) +
  # Color scale applied to geoms added after new_scale_color()
  scale_color_viridis_c(option = "A")
#> Warning: Ignoring unknown aesthetics: topo_colour

```
