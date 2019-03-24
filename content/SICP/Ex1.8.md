---
layout: page
title:  "Exercise 1.8"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Procedures for the cube root are similar to the square root, only the improve procedure is different.
```scheme
(define (cbrt-iter old-guess guess x)
  (if (good-enough? old-guess guess x) guess
        (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? old-guess guess x)
  (< (abs (- 1 (/ guess old-guess))) 0.001))

(define (cbrt x)
  (cbrt-iter 0.1 1.0 x))
```
