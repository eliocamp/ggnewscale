# 0.4.2

## Bugfixes

* Fixed partial matching warning. (#24, thanks @hadley)


# 0.4.1

## Bugfixes

* Fixed error when adding a scale with `ggplot2` not loaded. (#21, thanks @rmendels)

# 0.4.0 - G minor

## Bugfixes

* `new_scale()` doesn't change plot by reference (#13, thanks @raymondben).

* Fixed bug in R versions older than 3.5 (#12, thanks @raymondben).

* Added support for aesthetics set outside `aes()` (#16, thanks @raymondben).

* `new_scale()` will work with aesthetics defined in the global `ggplot()` call
(#18, thanks @efratushava).


# 0.3.0 - F mayor

## New features

- New website at https://eliocamp.github.io/ggnewscale/

- `new_scale()` adds a default scale if not supplied.

## Bugfixes

* `new_scale()` does not fail when `guide = "none"` or `guide = FALSE` (#6, thanks @Maschette)

* `new_scale()` does not fail when using the default mapping (#7, thanks @
RomanAbashin)


# ggnewscale 0.2.0 - C major

## Bugfixes

* Fixed error when defining positional scales before `new_scales()` (#2, thanks @willgearty)

* Added a `NEWS.md` file to track changes to the package.
