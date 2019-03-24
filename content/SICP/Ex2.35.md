---
layout: page
title:  "Exercise 2.35"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (not (pair? x))
                                       1
                                       (count-leaves x)))
                       t)))
```
