---
layout: page
title:  "Exercise 1.31"
tags: mit-scheme scheme SICP solution
categories: SICP
---
**a.** Here is a recursive version of `product`:
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
An approximation of $\pi$ using `product`:  
```scheme
(define (pi-product n)
  (define (pi-term x)
    (/ x (+ x 1)))
  (define (pi-next n) (+ n 2))
  (* (/ 8.0 9)
     (square (product pi-term 4.0 pi-next (- n 2)))
     n))

(pi-product 100000)
; => 3.1416083615920813
```
**b.** Here is the alternative iterative version of `product`:
```scheme
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
```