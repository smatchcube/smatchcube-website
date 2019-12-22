---
layout: page
title:  "Exercise 3.18"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (cycle? x)
  (define (iter x pairs-seen)
    (cond ((not (pair? x)) false)
	  ((memq x pairs-seen) true)
	  (else (iter (cdr x) (cons x pairs-seen)))))
  (iter x '()))
```
