library(ggplot2)
topography <- expand.grid(x = 1:nrow(volcano),
                          y = 1:ncol(volcano))
topography$z <- c(volcano)

context("tests")
test_that("works when ggplot2 not loaded", {

  g <- ggplot(mapping = aes(x, y)) +
    geom_contour(data = topography, aes(z = z, color = after_stat(level))) +
    new_scale_color()

  expect_true(inherits(g,"ggplot"))

})

test_that("guides work", {
  skip_if_not_installed("vdiffr")
  # from https://github.com/eliocamp/ggnewscale/issues/25
  g <- ggplot(mtcars) + aes(mpg, disp) +
    geom_point(aes(colour=factor(cyl)),  size=7) +
    scale_colour_brewer(type='qual', guide = guide_legend(order = 0)) +
    new_scale_colour() +
    geom_point(aes(colour=factor(gear)), size=3) +
    scale_colour_brewer(palette='Set1', guide = guide_legend(order = 0))

  vdiffr::expect_doppelganger("guides", g)

  # from https://github.com/eliocamp/ggnewscale/issues/39
  g <- ggplot(head(iris, 10), aes(Sepal.Length, Sepal.Width)) +
    geom_point(aes(color = factor(Petal.Length))) +
    guides(color = guide_legend(ncol = 2, nrow = 2, order = 0)) +
    new_scale_colour() +
    geom_point(aes(color = factor(Petal.Width))) +
    guides(color = guide_legend(ncol = 1, nrow = 4, order = 1))

  vdiffr::expect_doppelganger("guides outisde of scales", g)
})

test_that("doesn't do partial matching", {
  skip_if_not_installed("vdiffr")
  # from https://github.com/eliocamp/ggnewscale/issues/24
  options(warnPartialMatchDollar = TRUE)
  g <- ggplot(mpg, aes(displ, hwy)) +
    geom_point(aes(colour = factor(year)), size = 5) +
    scale_colour_brewer(name = "year", type = "qual", palette = 5, guide = guide_legend(order = 0)) +
    new_scale_colour() +
    geom_point(aes(colour = cyl == 4), size = 1, fill = NA) +
    scale_colour_manual(name = "4 cylinder", values = c("grey60", "black"), guide = guide_legend(order = 1))

  expect_warning(print(g), NA)
  options(warnPartialMatchDollar = FALSE)
  vdiffr::expect_doppelganger("guides2", g)
})




test_that("stats with custom `setup_data`", {
  # from https://github.com/eliocamp/ggnewscale/issues/27
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
    scale_fill_discrete(guide = guide_legend(order = 0)) +
    new_scale_fill() +
    geom_point(aes(x, y, fill = fill), shape = 21, inherit.aes = F) +
    scale_fill_continuous(guide = guide_colorbar(order = 1))
  expect_error(print(g), NA)

})


test_that("works with many layers", {
  skip_if_not_installed("vdiffr")
  # from https://github.com/eliocamp/ggnewscale/issues/29
  data <- expand.grid(y = 1:4, x = 1:4)
  data$z <- c("a", "b")


  layer <- function(number) {
    list(new_scale_fill(),
         geom_tile(data = ~.x[.x$x == number, ], aes(fill = z)),
         scale_fill_brewer(name = number, palette = number, guide = guide_legend(order = number))
    )
  }
  g <- ggplot(data, aes(x, y)) +
    layer(1) +
    layer(2) +
    layer(3) +
    layer(4)

  vdiffr::expect_doppelganger("many_layers", g)
})


test_that("changes override.aes", {
  skip_if_not_installed("vdiffr")
  # from https://github.com/r-lib/vdiffr/issues/98
  p2 <- ggplot(mtcars, aes(factor(gear), mpg, color = factor(gear))) +
    geom_boxplot() +
    scale_color_brewer(type = "qual",
                       aesthetics = c("fill", "color"),
                       guide = guide_legend(
                         override.aes = list(
                           fill = c("red", "blue", "blue")
                         )))

  vdiffr::expect_doppelganger("respects override.aes", p2 + new_scale_fill())
  vdiffr::expect_doppelganger("respects override.aes 2", p2 + new_scale_fill() + new_scale_color())


})

# https://github.com/eliocamp/ggnewscale/issues/45
test_that("using implicit mapping works", {
  set.seed(42)
  n <- 300
  data <- data.frame(x = c(rnorm(n, 5, 2),
                           rnorm(n,  5, 2),
                           rnorm(n,  5, 2),
                           rnorm(n,  5, 2)),
                     y = c(rnorm(n, 5, 1),
                           rnorm(n, 10, 1),
                           rnorm(n, 15, 1),
                           rnorm(n, 20, 1)),
                     label = c(rep('1', n),
                               rep('2', n),
                               rep('3', n),
                               rep('4', n)))


  layer_implicit <- function(number) {
    list(new_scale_fill(),
         geom_bin2d(data = ~.x[.x$label == number, ]),
         scale_fill_distiller(name = number, palette = number, guide = guide_legend(order = number))
    )
  }

  g <- ggplot(data, aes(x, y)) +
    layer_implicit(1) +
    layer_implicit(2) +
    layer_implicit(3) +
    layer_implicit(4)

  vdiffr::expect_doppelganger("implicit mapping", g)
})