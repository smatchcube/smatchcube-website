---
layout: page
title:  "Exercise 1.43"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))
```
