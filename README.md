<!-- README.md is generated from README.Rmd. Please edit that file -->
choosy
======

This package is a didactic and tidy implementation of **multinomial logistic regression** by Alex Hayes and Tiffany Tang of Rice University.

To Do / Roadmap
===============

Tentative interface: `choosy(formula, data, method, weights)`

-   `choosy` constructor, validator, convenience constructor
-   methods to fit model: gradient descent, `optim`, L-BFGS, Newton's, ADMM, C++ versions of these, calling Python from COMP 540
-   accept `recipe` objects?
-   `print` method
-   `summary` method
-   `predict` method
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
