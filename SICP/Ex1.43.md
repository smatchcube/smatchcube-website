---
layout: page
title:  "Exercise 1.43"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))
```
Some tests:
```scheme
((repeated square 2) 5)
; => 625

((repeated inc 0) 3)
; => 3

((repeated inc 3) 7)
; => 10
```