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
We can use it to estimate $\pi$:
```scheme
(define (in-unit-circle? x y)
  (<= (sqrt (+ (square x) (square y))) 1))

(estimate-integral in-unit-circle? -1.0 1.0 -1.0 1.0 1000000)
; => 3.141088
```
