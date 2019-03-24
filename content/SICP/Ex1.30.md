---
layout: page
title:  "Exercise 1.30"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
```
