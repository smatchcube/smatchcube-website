---
layout: page
title:  "Exercise 1.17"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
;; implementation of double and halve
(define (double a) (* a 2))
(define (halve a) (/ a 2))

(define (fast-* a b)
  (cond ((= b 0) 0)
	((even? b) (fast-* (double a) (halve b)))
	(else (+ a (fast-* a (- b 1))))))
```
