---
layout: page
title:  "Exercise 2.48"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))
```
