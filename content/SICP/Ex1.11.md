---
layout: page
title:  "Exercise 1.11"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Recursive version:
```scheme
(define (f n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))
```
Iterative version:
```scheme
(define (f n)
  (cond ((< n 3) n)
        (else (f-iter 0 1 2 3 n))))
  (define (f-iter a b c counter n)
    (cond ((> counter n) c)
          (else (f-iter b c (+ c (* 2 b) (* 3 a)) (+ counter 1) n))))
```
