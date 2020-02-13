

topography <- expand.grid(x = 1:nrow(volcano),
                          y = 1:ncol(volcano))
topography$z <- c(volcano)

test_that("works when ggplot2 not loaded", {

  g <- ggplot2::ggplot(mapping = ggplot2::aes(x, y)) +
    ggplot2::geom_contour(data = topography, ggplot2::aes(z = z, color = ..level..)) +
    new_scale_color()

  expect_true(inherits(g,"ggplot"))

})