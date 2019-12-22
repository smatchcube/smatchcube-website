---
layout: page
title:  "Exercise 1.41"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `double` procedure.
```scheme
(define (double f)
  (lambda (x) (f (f x))))
```
Using the substitution model:
```scheme
(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((lambda (x) (double (double (double (double x))))) inc) 5)
((double (double (double (double inc)))) 5)
```
In the last line it's clear that the `inc` procedure is applied $2^4$ times so the final result is `5`.