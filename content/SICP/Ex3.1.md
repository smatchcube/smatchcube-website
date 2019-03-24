---
layout: page
title:  "Exercise 3.1"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-accumulator sum)
  (lambda (number)
    (set! sum (+ sum number))
    sum))
```
A little test:
```scheme
(define A1 (make-accumulator 5))
(define A2 (make-accumulator 22))
(A1 10)
; => 15
(A2 3)
; => 20
(A2 10)
; => 25
```
