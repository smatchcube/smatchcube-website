---
layout: page
title:  "Exercise 2.59"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (union-set set1 set2)
  (if (null? set2)
      set1
      (union-set (adjoin-set (car set2) set1) (cdr set2))))
```
Note that this procedure assume that `set1` has no element that appears more than once. This is a little trade-off for better performance.
