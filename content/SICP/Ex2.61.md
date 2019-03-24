---
layout: page
title:  "Exercise 2.61"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `adjoin-set` procedure for the ordered representation using half as many steps as with the unordered representation.
```scheme
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))
```
Note that we could easily make the procedure tail recursive.
