---
layout: page
title:  "Exercise 1.7"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The problem of the `good-enough?` procedure is that 0.001 is arbitrary small and is not optimal for small or big numbers for instance, `(sqrt 0.001)` return `0.001`, which is obviously not the square root.\\
Below is an alternative code which introduce a new variable (`old-guess`) to keep tracking of the change during two iterations to find the approximation of any square root.
```scheme
(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess x) guess
        (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess guess x)
  (< (abs (- 1 (/ guess old-guess))) 0.001))

(define (sqrt x)
  (sqrt-iter 0.1 1.0 x))
```
