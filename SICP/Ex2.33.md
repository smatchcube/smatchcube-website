---
layout: page
title:  "Exercise 2.33"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
```
