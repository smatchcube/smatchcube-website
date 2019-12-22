---
layout: page
title:  "Exercise 1.42"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (compose f g)
  (lambda (x) (f (g x))))
```
