---
layout: page
title:  "Exercise 3.5"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the general procedure for Monte Carlo integration.
```scheme
(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (area-test)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (P x y)))
  (* (monte-carlo trials area-test)
     (* (- x2 x1) (- y2 y1))))
```
Now we can use it to estimate \\(\pi\\):
```scheme
(define (is-in-unit-circle? x y)
  (<= (sqrt (+ (square x) (square y))) 1))

(estimate-integral is-in-unit-circle? -1.0 1.0 -1.0 1.0 1000000.0)
; => 3.140388
```
Note that I used real numbers instead of integers to generate random real numbers according to the footnote 8. One way to solve this problem would be to use the `exact->inexact` procedure in `random-in-range` or just add `0.0` as adding an inexact number to an exact number return an inexact number.
