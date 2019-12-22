---
layout: page
title:  "Exercise 2.69"
tags: mit-scheme scheme SICP solution
categories: SICP
---
This one was really tricky but very simple with ordered sets.
```scheme
(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
      (car leaf-set)
      (successive-merge (adjoin-set (make-code-tree (car leaf-set) 
                                                    (cadr leaf-set))
                                    (cddr leaf-set)))))
```
