---
layout: page
title:  "Exercise 2.6"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We use the substitution model to find what are `one` and `two` in the Church numerals representation.
```scheme
(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(lambda (f) (lambda (x) (f x)))
```
So we can now define `one` directly.
```scheme
(define one (lambda (f) (lambda (x) (f x))))
```
We do the same thing to find what is `two`.
```scheme
(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))
```
So the definition of `two` is:
```scheme
(define two (lambda (f) (lambda (x) (f (f x)))))
```
We can now have an idea of how Church numerals are working.
We can define the addition as bellow.

```scheme
(define (add n1 n2)
  (lambda (f) (lambda (x) ((n1 f) ((n2 f) x)))))
```
