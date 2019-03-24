---
layout: page
title:  "Exercise 2.34"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))
```
