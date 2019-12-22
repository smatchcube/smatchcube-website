---
layout: page
title:  "Exercise 1.32"
tags: mit-scheme scheme SICP solution
categories: SICP
---
**a.** Recursive version of `accumulate`:
```scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
```
We show how we can rewrite the `sum` and `product` procedures using `accumulate`:
```scheme
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
  ```
**b.** Iterative version of `accumulate`:
```scheme
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
  ```
