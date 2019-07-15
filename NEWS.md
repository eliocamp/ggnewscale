# 0.4.0.90000


## Bugfixes

* Fixed compatibility with R versions lower than 3.5 (#12, thanks @raymondben).

* Fixed modify by reference (#13, thanks @raymondben).
 
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
