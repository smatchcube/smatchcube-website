---
layout: page
title:  "Exercise 1.3"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (square a) (* a a))
(define (sum-of-square a b) (+ (square a) (square b)))
(define (sum-of-greatest-square a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
        ((and (<= b a) (<= b c)) (sum-of-square a c))
        ((and (<= c a) (<= c b)) (sum-of-square a b))))
```
