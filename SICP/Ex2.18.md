---
layout: page
title:  "Exercise 2.18"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (reverse items)
  (define (reverse-iter l reversed-list)
    (if (null? l)
        reversed-list
        (reverse-iter
         (cdr l)
         (cons (car l) reversed-list))))
  (reverse-iter items nil))
```
