---
layout: page
title:  "Exercise 2.5"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Following the representation of a pair in this exercise we can define the `cons` procedure with the `expt` primitive (you can easily create your own `expt` procedure though).
```scheme
(define (cons a b) (* (expt 2 a) (expt 3 b)))
```
A power of 2 is even and a power of 3 is odd (we can easily prove that with mathematical induction) so we can define the `car` and `cdr` procedures counting the number of times we can divide by 2 or 3 the pair represented by an integer.
```scheme
(define (car p)
  (define (iter foo count)
    (let ((quotient (/ foo 2)))
      (if (integer? quotient)
          (iter quotient (+ count 1))
          count)))
  (iter p 0))

(define (cdr p)
  (define (iter foo count)
    (let ((quotient (/ foo 3)))
      (if (integer? quotient)
          (iter quotient (+ count 1))
          count)))
  (iter p 0))
```
