---
layout: page
title:  "Exercise 1.44"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define dx 0.00001)
(define (average a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x) (average
               (f (- x dx))
               (f x)
               (f (+ x dx)))))
```
Thanks to our higher-order procedures we can easily generate the n-fold smoothed function of any function.
```scheme
(define (n-smooth f n)
  ((repeated smooth n) f))
```