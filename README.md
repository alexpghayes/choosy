<!-- README.md is generated from README.Rmd. Please edit that file -->
choosy
======

The ideal of this package is to get some practice with optimization algorithms to fit **multinomial logistic regression** models.

To Do / Roadmap
===============

1.  Gradient descent in R
2.  Calling Rcpp/Python code
3.  L-BFGS
4.  Newton's method
5.  ADMM
6.  Line/beam search for step size

Eventually we may want the following methods:

-   accept `recipe` objects?
-   `tidy` method
-   `augment` method
-   `plot` method

Installation
============

Once we get underway, you'll be able to install this package with:

``` r
# install.packages('devtools')
# devtools::install_github('alexpghayes/choosy')
```

Motivation
==========

...

Assumptions
-----------

-   Independence of Irrelevant Alternatives: what it is, and what are some options to get around it, where those are implemented in R (i.e. `mlogit`)
-   What type of data you have: data about observed individuals rather than alternatives to select from
-   Other

Example Usage
=============

...
