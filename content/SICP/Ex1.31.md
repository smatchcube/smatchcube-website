---
layout: page
title:  "Exercise 1.31"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I chose to start with the recursive version of `product`:
```scheme
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
```
Here is the `factorial` procedure:
```scheme
(define (factorial n)
  (define (identity x) x)
  (define (inc n) (+ n 1))
  (product identity 1 inc n))
  ```
  I chose to use only the `product` procedure only once to not deal with very big numbers and to avoid an overflow error.
```scheme
(define (pi-product n)
  (define (inc x) (+ x 1))
  (define (square x) (* x x))
  (define (pi-term x) (/ (* 2 x) (+ (* 2 x) 1)))
  (* (/ 16.0 9) (+ n 1) (square (product pi-term 2 inc n))))
  ```
As I started with recursive version of `product`, here is the alternative iterative version:
```scheme
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
  ```
