# Changelog

## ggnewscale (development version)

### Internals

- Implemented a new method of adding scales that should be faster.
  Instead of building the whole plot to let ggplot2 discover the default
  scales, ggnewscale now creates default scales for the new aes. This
  should lead to performance improvement
  ([\#78](https://github.com/eliocamp/ggnewscale/issues/78))

### Bugfixes

- Fixes a bug that removed guides in some cases
  ([\#72](https://github.com/eliocamp/ggnewscale/issues/72))

## ggnewscale 0.5.2

CRAN release: 2025-06-20

Adds compatibility with ggplot2 4.0.0

## ggnewscale 0.5.1

CRAN release: 2025-02-24

Adds new startup message.

## ggnewscale 0.5.0

CRAN release: 2024-07-19

No new features, but a relatively important rewrite of the internals and
updated dependency on ggplot2 3.5.0 to support the new Guides system
(and *only* the new one).

### Bugfixes

- Layers will retain custom attributes.
  ([\#65](https://github.com/eliocamp/ggnewscale/issues/65),
  [@rsh52](https://github.com/rsh52))

## ggnewscale 0.4.10

CRAN release: 2024-02-08

## ggnewscale 0.4.9

CRAN release: 2023-05-25

### Bugfixes

- Fixes a bug when adding more than one extra scale and using geoms
  without explicit mapping
  ([\#45](https://github.com/eliocamp/ggnewscale/issues/45))

## ggnewscale 0.4.8

CRAN release: 2022-10-06

- Updates documentation to conform to latest CRAN HTML5 requirements.

## ggnewscale 0.4.7

CRAN release: 2022-03-25

### Bugfixes

- [`new_scale()`](https://eliocamp.github.io/ggnewscale/reference/new_scale.md)
  respects `override.aes` arguments
  ([\#43](https://github.com/eliocamp/ggnewscale/issues/43), thanks
  [@jgabry](https://github.com/jgabry))

## ggnewscale 0.4.6

CRAN release: 2022-02-15

### Bugfixes

- Fixes guides not being recognised when defined outside scales
  ([\#38](https://github.com/eliocamp/ggnewscale/issues/38), thanks
  [@PursuitOfDataScience](https://github.com/PursuitOfDataScience))

## ggnewscale 0.4.5

CRAN release: 2021-01-11

- Necessary version change due to some CRAN stuff. No user-visible
  changes.

## ggnewscale 0.4.4

CRAN release: 2020-12-02

### Bugfixes

- Fixes incompatibility with stats with custom `setup_data`
  ([\#27](https://github.com/eliocamp/ggnewscale/issues/27), thanks
  [@carlschmidt26](https://github.com/carlschmidt26) !)

## ggnewscale 0.2.0 - C major

CRAN release: 2019-03-17

### Bugfixes

- Fixed error when defining positional scales before `new_scales()`
  ([\#2](https://github.com/eliocamp/ggnewscale/issues/2), thanks
  [@willgearty](https://github.com/willgearty))

- Added a `NEWS.md` file to track changes to the package.
