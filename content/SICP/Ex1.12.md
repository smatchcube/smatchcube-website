---
layout: page
title:  "Exercise 1.12"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (C k n)
  (cond ((= k 0) 1)
        ((= k n) 1)
        (else (+ (C (- k 1) (- n 1)) (C k (- n 1))))))
```
Here the function computes the element of the k^th^ column of the n^th^ row (both zero indexed) of Pascal's Triangle.
