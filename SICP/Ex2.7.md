---
layout: page
title:  "Exercise 2.7"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here are the selectors needed to use our intervals.
```scheme
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
```
