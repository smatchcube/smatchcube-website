---
layout: page
title:  "Exercise 1.32"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Recursive version of `accumulate`:
```scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
```
Then we can rewrite the `sum` and the `product` procedures using `accumulate`:
```scheme
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
  ```
Iterative version of `accumulate`:
```scheme
(define (accumulate combiner null-value term a next b)
  (define (iter a b result)
    (if (> a b)
        result
        (iter (next a) b (combiner result (term a)))))
  (iter a b null-value))
  ```
