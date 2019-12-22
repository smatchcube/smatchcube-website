---
layout: page
title:  "Exercise 2.10"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (div-interval x y)
  (if (or (zero? (lower-bound y)) (zero? (upper-bound y)))
      (display "Error, one bound is equal to zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))
```
