---
layout: page
title:  "Exercise 1.40"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))
```
A little test to solve $x^3+x^2+x+1=0$:
```scheme
(newtons-method (cubic 1 1 1) 1)
; => -.9999999999997796
```