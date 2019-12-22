---
layout: page
title:  "Exercise 2.21"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (square-list items)
  (if (null? items)
      nil
      (cons
       (square (car items))
       (square-list (cdr items)))))
```
```scheme
(define (square-list items)
  (map square items))
```
