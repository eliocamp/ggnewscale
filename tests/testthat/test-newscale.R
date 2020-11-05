library(ggplot2)
topography <- expand.grid(x = 1:nrow(volcano),
                          y = 1:ncol(volcano))
topography$z <- c(volcano)

context("tests")
test_that("works when ggplot2 not loaded", {

  g <- ggplot(mapping = aes(x, y)) +
    geom_contour(data = topography, aes(z = z, color = ..level..)) +
    new_scale_color()

  expect_true(inherits(g,"ggplot"))

})

test_that("guides work", {
  # from https://github.com/eliocamp/ggnewscale/issues/25
  g <- ggplot(mtcars) + aes(mpg, disp) +
    geom_point(aes(colour=factor(cyl)),  size=7) +
    scale_colour_brewer(type='qual') +
    new_scale_colour() +
    geom_point(aes(colour=factor(gear)), size=3) +
    scale_colour_brewer(palette='Set1')

  vdiffr::expect_doppelganger("guides", g)

})

test_that("doesn't do partial matching", {

  # from https://github.com/eliocamp/ggnewscale/issues/24
  options(warnPartialMatchDollar = TRUE)
  g <- ggplot(mpg, aes(displ, hwy)) +
    geom_point(aes(colour = factor(year)), size = 5) +
    scale_colour_brewer("year", type = "qual", palette = 5) +
    new_scale_colour() +
    geom_point(aes(colour = cyl == 4), size = 1, fill = NA) +
    scale_colour_manual("4 cylinder", values = c("grey60", "black"))

  expect_warning(g, NA)

  vdiffr::expect_doppelganger("guides2", g)
})




test_that("stats with custom `setup_data`", {
  # Manipulate `setup_data()` of `StatYdensity` and store the object as `StatYdensity2`.
  StatYdensity2 <- ggplot2::ggproto("StatYdensity2", StatYdensity,
                                    setup_data = function (data, params) {
                                      if (is.null(data[["fill"]])) {
                                        stop("No fill column")
                                      }
                                      data
                                    })

  set.seed(5)

  df <- data.frame(
    x = floor(runif(100, min=1, max=5)),
    y = floor(runif(100, min=1, max=10)),
    gender = c("female", "male")[floor(runif(100, min=1, max=3))],
    fill = floor(runif(100, min=1, max=5))
  )
  g <- ggplot(df, aes(x, y, group = interaction(x, gender))) +
    # Call `geom_violin()` using the manipulated stat `StatYdensity2`.
    geom_violin(stat = StatYdensity2, aes(fill = gender)) +
    scale_fill_discrete() +
    new_scale_fill() +
    geom_point(aes(x, y, fill = fill), shape = 21, inherit.aes = F)
  expect_error(print(g), NA)

})