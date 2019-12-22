---
layout: page
title:  "Exercise 2.41"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Firstly we need to enumerate the triples needed.
```scheme
(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap (lambda (j)
            (map (lambda (k) (list i j k))
                 (enumerate-interval 1 (- j 1))))
          (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)))
```
Now we can filter them:
```scheme
(define (sum-triple s)
  (filter (lambda (triple) (= (+ (car triple)
                                 (cadr triple)
                                 (caddr triple))
                              s))
          (unique-triples (- s 3))))
```
