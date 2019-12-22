---
layout: page
title:  "Exercise 2.37"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))
```
