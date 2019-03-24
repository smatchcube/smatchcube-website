---
layout: page
title:  "Exercise 1.44"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (smooth f)
  (define dx 0.00001)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x) (average
               (f (- x dx))
               (f x)
               (f (+ x dx)))))

(define (n-smooth f n)
  ((repeated smooth n) f))
```
