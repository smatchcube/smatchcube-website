---
layout: page
title:  "Exercise 1.41"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `double` procedure.
```scheme
(define (double f)
  (lambda (i) (f (f i))))
```
`(((double (double double)) inc) 5)` return the value `21` because `(double double)` create a procedure that apply the procedure twice and `(double (double double))` create a procedure that apply 16 times the procedure.
