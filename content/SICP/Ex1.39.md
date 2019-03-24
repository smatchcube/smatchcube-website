---
layout: page
title:  "Exercise 1.39"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I chose to not start the continued fraction right at the beginning to make the \\(N_i\\) sequence simpler.
```scheme
(define (tan-cf x k)
  (/ x
     (+ 1.0 (cont-frac (lambda (i) (- 0 (* x x)))
                       (lambda (i) (+ (* 2 i) 1))
                       (- k 1)))))
```
