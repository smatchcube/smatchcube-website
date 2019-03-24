---
layout: page
title:  "Exercise 2.55"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The expression could be rewritten as `(car '(quote abracadabra))` because the quote is just a shorthand for the quote procedure, now it's quite clear that the `car` of the list `(quote abracadabra)` is `quote`. 
