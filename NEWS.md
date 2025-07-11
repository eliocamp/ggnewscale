# ggnewscale (development version)

# ggnewscale 0.5.2

Adds compatibility with ggplot2 4.0.0

# ggnewscale 0.5.1

Adds new startup message.

# ggnewscale 0.5.0

No new features, but a relatively important rewrite of the internals and updated dependency on ggplot2 3.5.0 to support the new Guides system (and *only* the new one).

## Bugfixes

-   Layers will retain custom attributes. (#65, @rsh52)

# ggnewscale 0.4.10

# ggnewscale 0.4.9

## Bugfixes

-   Fixes a bug when adding more than one extra scale and using geoms without explicit mapping (#45)

# ggnewscale 0.4.8

-   Updates documentation to conform to latest CRAN HTML5 requirements.

# ggnewscale 0.4.7

## Bugfixes

-   `new_scale()` respects `override.aes` arguments (#43, thanks @jgabry)

# ggnewscale 0.4.6

## Bugfixes

-   Fixes guides not being recognised when defined outside scales (#38, thanks @PursuitOfDataScience)

# ggnewscale 0.4.5

-   Necessary version change due to some CRAN stuff. No user-visible changes.

# ggnewscale 0.4.4

## Bugfixes

-   Fixes incompatibility with stats with custom `setup_data` (#27, thanks @carlschmidt26 !)

# 0.4.3

## Bugfixes

-   Fixes partial matching warning properly this time (🤞️). (#24 #25, thanks @hadley and \@ leesaudan2)

# 0.4.2

## Bugfixes

-   Fixed partial matching warning. (#24, thanks @hadley)

# 0.4.1

## Bugfixes

-   Fixed error when adding a scale with `ggplot2` not loaded. (#21, thanks @rmendels)

# 0.4.0 - G minor

## Bugfixes

-   `new_scale()` doesn't change plot by reference (#13, thanks @raymondben).

-   Fixed bug in R versions older than 3.5 (#12, thanks @raymondben).

-   Added support for aesthetics set outside `aes()` (#16, thanks @raymondben).

-   `new_scale()` will work with aesthetics defined in the global `ggplot()` call (#18, thanks @efratushava).

# 0.3.0 - F mayor

## New features

-   New website at <https://eliocamp.github.io/ggnewscale/>

-   `new_scale()` adds a default scale if not supplied.

## Bugfixes

-   `new_scale()` does not fail when `guide = "none"` or `guide = FALSE` (#6, thanks @Maschette)

-   `new_scale()` does not fail when using the default mapping (#7, thanks \@ RomanAbashin)

# ggnewscale 0.2.0 - C major

## Bugfixes

-   Fixed error when defining positional scales before `new_scales()` (#2, thanks @willgearty)

-   Added a `NEWS.md` file to track changes to the package.
