---
layout: page
title:  "Exercise 2.54"
tags: mit-scheme scheme SICP solution
categories: SICP
---
A solution i found quickly, I'm sure you can find a way simple solution though.
```scheme
(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((or (null? a) (null? b)) false)
        ((and (list? (car a)) (list? (car b)))
         (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((eq? (car a) (car b)) (equal? (cdr a) (cdr b)))
        (else false)))
```
