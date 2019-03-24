---
layout: page
title:  "Exercise 1.33"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a b result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) b (combiner result (term a))))
          (else (iter (next a) b result))))
  (iter a b null-value))
```
a.
```scheme
(filtered-accumulate + prime? 0 square a inc b)
```
b. Firstly we need to write a procedure that checks whether a numbers is relatively prime to another.
```scheme
(define (gcd a b)
  (cond ((< a b) (gcd b a))
        ((= b 0) a)
        (else (gcd b (remainder a b)))))

(define (relatively-prime? a b)
  (= (gcd a b) 1))
```
Now we can create our desired procedure:
```scheme
(define (product-of-realatively-prime n)
  (define (relative-prime-to-n? x) (relatively-prime? n x))
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate * relative-prime-to-n? 1 identity 0 inc n))
```
