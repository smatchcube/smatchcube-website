---
layout: page
title:  "Exercise 2.20"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I use the idea of higher-order procedures from the end of Chapter 1 similarly to the `filtered-accumulate` procedure.
```scheme
(define (filter-list test l)
  (define (foo l)
    (if (null? l)
        nil
        (let ((element (car l)))
          (if (test element)
              (cons element (foo (cdr l)))
              (foo (cdr l))))))
  (foo l))

(define (same-parity first-item . tail)
  (if (even? first-item)
      (cons first-item (filter-list even? tail))
      (cons first-item (filter-list odd? tail))))
```
