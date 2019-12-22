---
layout: page
title:  "Exercise 1.28"
tags: mit-scheme scheme SICP solution
categories: SICP
---

Here is my modified `expmod` procedure to signal any nontrivial square root of $1$ modulo $n$.

```scheme
(define (miller-rabin-expmod base exp m)
  (define (remainder-square-checked x m)
    (if (and (not (= x 1))
	     (not (= x (- m 1)))
	     (= (remainder (square x) m) 1))
	0
	(remainder (square x) m)))
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder-square-checked
	  (miller-rabin-expmod base (/ exp 2) m)
	  m))
	(else
	 (remainder
	  (* base (miller-rabin-expmod base (- exp 1) m))
	  m))))
```
The Miller-Rabin test analogous to `fermat-test`:
```scheme
(define (miller-rabin-test n)
  (define (try-it a)
    (= (miller-rabin-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))
```
We use this test to create a `fast-prime` alternative that can't be fooled.
```scheme
(define (miller-rabin-fast-prime? n times)
  (cond ((= times 0) true)
	((miller-rabin-test n) (miller-rabin-fast-prime? n (- times 1)))
	(else false)))
```
Here are some tests:
```scheme
(miller-rabin-fast-prime? 45 10)
; => #f

(miller-rabin-fast-prime? 7 10)
; => #t

(miller-rabin-fast-prime? 101 10)
; => #t

(miller-rabin-fast-prime? (* 7 101) 10)
; => #f

(miller-rabin-fast-prime? 561 10)
; => #f

(miller-rabin-fast-prime? 1729 10)
; => #f

(miller-rabin-fast-prime? 6601 10)
; => #f
```
In the last three tests we can see that the Miller-Rabin test is not fooled by Carmichael numbers.
