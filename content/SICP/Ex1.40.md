---
layout: page
title:  "Exercise 1.40"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))
```
