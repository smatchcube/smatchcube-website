---
layout: page
title:  "Exercise 2.40"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
```
Now we can simplify `prime-sum-pairs`:
```scheme
(define (prime-sum-pairs n)
  (map make-pair-sum
     (filter prime-sum? (unique-pairs n))))
```
