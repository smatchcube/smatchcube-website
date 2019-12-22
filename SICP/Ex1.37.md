---
layout: page
title:  "Exercise 1.37"
tags: mit-scheme scheme SICP solution
categories: SICP
---
**a.** Here is the `cont-frac` procedure.
```
(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
	0
	(/ (n i)
	   (+ (d i) (recur (inc i))))))
  (recur 1))
```
Approximations of $1/\varphi=0.6180339887498948482$ using `cont-frac`:
```scheme
(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
; => .6179775280898876

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
; => .6180555555555556
```
We need to use our `cont-frac` procedure with `k=11` to have an approximation with 4-digits accuracy.

**b.** Our previous `cont-frac` procedure generates a recursive process, here is the iterative version of `cont-frac`.
```scheme
(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
	result
	(iter (- i 1)
	      (/ (n i) (+ (d i) result)))))
  (iter k 0))
```
