---
layout: page
title:  "Exercise 2.57"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We can do this by only changing the `augend` and `multiplicand` procedures. Whe way it works can sometimes also reduce the expression because I chose to use `make-sum` and `make-product`.
```scheme
(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (make-sum (addend (cdr s)) (augend (cdr s)))))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (make-product (multiplier (cdr p)) (multiplicand (cdr p)))))
```
