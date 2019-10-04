## Test environments

* local instalation of elementary OS 5 Juno (based on Ubuntu 18.04.2) R version 3.6.1
* win-builder (release, devel and oldrelease)
* r-hub (Windows Server 2008 R2 SP1, R-devel, 32/64 bit)

## R CMD check results

0 errors | 0 warnings | 1 notes

note on win-builder devel:
Found the following (possibly) invalid URLs:
  URL: https://saythanks.io/to/eliocamp
    From: README.md
    Status: Error
    Message: libcurl error code 6:
      	Could not resolve host: saythanks.io
      	
The site seems to be down at the moment. 