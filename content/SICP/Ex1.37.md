---
layout: page
title:  "Exercise 1.37"
tags: mit-scheme scheme SICP solution
categories: SICP
---
a. Here is the `cont-frac` procedure.
```
(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))
```
Here is the approximation of the golden ratio found on the web \\(\varphi = 1.6180339887498948...\\)
```scheme
( / 1 (cont-frac (lambda (i) 1.0)
                 (lambda (i) 1.0)
                 13))
```
This procedure return `1.6180257510729614`
We need to use our `cont-frac` procedure with `k` equal to at least `13` to have an approximation that is accurate to \\(4\\) decimal places.

b. Our previous `cont-frac` procedure generates a recursive process, here is the iterative version of `cont-frac`.
```scheme
(define (cont-frac n d k)
  (define (iter result k)
    (if (< k 1)
        result
        (iter (/ (n k) (+ (d k) result)) (- k 1))))
  (iter 0 k))
```
