---
layout: page
title:  "Exercise 1.33"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (filtered-accumulate combiner null-value predicate term a next b)
  (define (iter a result)
    (cond ((> a b) result)
	  ((predicate a) (iter (next a) (combiner (term a) result)))
	  (else (iter (next a) result))))
  (iter a null-value))
```
**a.**
```scheme
(define (sum-squares-primes a b)
  (filtered-accumulate + 0 prime? square a inc b))
```
**b.**
```scheme
(define (product-relatively-primes n)
  (define (relatively-prime-to-n? i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 relatively-prime-to-n? identity 2 inc (- n 1)))
```