---
layout: page
title:  "Exercise 2.62"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the $\Theta (n)$ implementation of `union-set` for sets represented as ordered lists.
```scheme
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1))
                    (x2 (car set2)))
                (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                      (else (cons x2 (union-set set1 (cdr set2)))))))))
```
As the `adjoin-set` procedure we could easily implement tail recursion for this procedure.
