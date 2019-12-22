---
layout: page
title:  "Exercise 3.33"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (averager a b c)
  (let ((u (make-connector))
	(v (make-connector)))
    (adder a b u)
    (multiplier c v u)
    (constant 2 v)
    'ok))
```
Test:
```scheme
(define A (make-connector))
(define B (make-connector))
(define C (make-connector))

(averager A B C)

(probe "B" B)

(set-value! A 1 'user)
(set-value! C 2 'user)
```
Result printed: `Probe: B = 3`
