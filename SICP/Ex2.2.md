---
layout: page
title:  "Exercise 2.2"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We start by writting our `make-point` constructor.
```scheme
(define (make-point x y) (cons x y))
```
Here are the selectors for our points.
```scheme
(define (x-point p) (car p))
(define (y-point p) (cdr p))
```
Now we can write the `make-segment` constructor.
```scheme
(define (make-segment p1 p2) (cons p1 p2))
```
Here are the selectors for our segments.
```scheme
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
```
And we can finally define the `midpoint-segment` procedure.
```scheme
(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))
```
