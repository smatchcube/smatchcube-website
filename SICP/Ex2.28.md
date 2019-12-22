---
layout: page
title:  "Exercise 2.28"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my straightforward recursive solution:
```scheme
(define (fringe items)
  (cond ((null? items) nil)
        ((list? items) (append (fringe (car items)) (fringe (cdr items))))
        (else (list items))))
```
