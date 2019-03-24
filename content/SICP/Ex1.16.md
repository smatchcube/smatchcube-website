---
layout: page
title:  "Exercise 1.16"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (fast-expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 b n))

(define (square x) (* x x))
```
