---
layout: page
title:  "Exercise 2.27"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (deep-reverse items)
  (define (reverse-deep l reversed-list)
    (cond ((null? l) reversed-list)
          ((pair? l) (reverse-deep (cdr l) 
                                   (cons (reverse-deep (car l) nil)
                                         reversed-list)))
          (else l)))
  (reverse-deep items nil))
```
Note that my solution could be more concise using the `list` primitive.
