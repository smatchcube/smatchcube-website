---
layout: page
title:  "Exercise 1.29"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I chose to divide the sum in four parts.
```scheme
(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x)
    (+ x (* 2 h)))
  (* (/ h 3)
     (+ (f a)
	(* 4 (sum f (+ a h) add-2h (- b h)))
	(* 2 (sum f (+ a (* 2 h)) add-2h (- b (* 2 h))))
	(f b))))
```
Here are the results of integrating `cube` between 0 and 1:
```scheme
(simpson-integral cube 0 1 100)
; => 1/4

(simpson-integral cube 0 1 1000)
; => 1/4
```
We can see that Simpson's Rule is way more accurate compared to the algorithm used in the `integrate` procedure. Our `simpson-integral` function gives us the exact value of the integral, it's not a coincidence as Simpson's Rule is known to give exact values for polynomial of degree less than or equal to 3.