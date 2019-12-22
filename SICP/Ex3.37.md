---
layout: page
title:  "Exercise 3.37"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
    z))

(define (cv value)
  (let ((x (make-connector)))
    (constant value x)
    x))
```
Test:
```scheme
(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
	  x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))
(probe "C" C)

(set-value! F 77 'user)
```
Result printed: 
```
Probe: C = 25
```
