---
layout: page
title:  "Exercise 2.12"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-center-percent c p)
  (let ((w (/ (* c p) 100)))
    (make-center-width c w)))
```
```scheme
(define (percent i)
  (/ (* (width i) 100) (center i)))
```
