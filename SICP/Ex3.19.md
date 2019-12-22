---
layout: page
title:  "Exercise 3.19"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (cycle? x)
  (define (iter tortoise hare)
    (cond ((eq? tortoise hare) true)
	  ((not (pair? hare)) false)
	  ((not (pair? (cdr hare))) false)
	  (else (iter (cdr tortoise) (cddr hare)))))
  (iter x (cdr x)))
```
This is the [Floyd's Tortoise and Hare](https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare) algorithm, it uses two pointers traversing the structure at different speeds.
