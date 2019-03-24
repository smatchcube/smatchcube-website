---
layout: page
title:  "Exercise 1.45"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I can't prove how many `average-damp` we need to use to have a fixed point so to simplify i will execute `average-damp` `n` times (`n` corresponding to the n<sup>th</sup> root).
I used the `expt` procedure to compute the exponentiation.
```scheme
(define (nth-root x n)
  (fixed-point ((repeated average-damp (- n 1))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
```
