---
layout: page
title:  "Exercise 2.8"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Using a reasoning analogous to Alyssa's we can say:\\
-The minimum value of the difference could be the difference of the lower bound value of the first interval with the upper bound value of second interval.\\
-The maximum value of the difference could be the difference of the upper bound value of the first interval with the lower bound value of the second interval.

Here is the `sub-interval` procedure computing the difference of two intervals using our description bellow.
```scheme
(define (sub-interval x y)
  (make-interval 
    (- (lower-bound x) (upper-bound y))
    (- (upper-bound x) (lower-bound y))))
```
