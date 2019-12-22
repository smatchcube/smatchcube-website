---
layout: page
title:  "Exercise 1.11"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Recursive version:
```scheme
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
```
Iterative version:
```scheme
(define (f n)
  (define (f-iter fn-1 fn-2 fn-3 counter)
    (if (> counter n)
	fn-1
	(f-iter (+ fn-1 (* 2 fn-2) (* 3 fn-3))
		fn-1
		fn-2
		(inc counter))))
  (if (< n 3)
      n
      (f-iter 2 1 0 3)))
```
