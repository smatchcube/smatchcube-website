---
layout: page
title:  "Exercise 2.4"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We use the substitution model to verify that `(car (cons x y))` yields `x`.
```scheme
(car (cons x y))
(car (lambda (m) (m x y))) ;using the definition of cons in the exercise
((lambda (m) (m x y)) (lambda (p q) p)) ;using the definition of car in this exercise
((lambda (p q) p) x y)
x
```
Using this procedural representation of pairs we can define `cdr` as below.
```scheme
(define (cdr z)
  (z (lambda (p q) q)))
```
