---
layout: page
title:  "Exercise 3.8"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is `f`:
```scheme
(define f
  (let ((old-value 0))
  (lambda (x) (if (> x old-value)
                  (begin (set! old-value x) x)
                  old-value))))
```
This procedure take a number and return the maximum value between the argument given, \\(0\\) and the old arguments passed in `f`.  
So here is a test:
```scheme
(+ (f 0) (f 1))
; => 2
```
We can conclude that subexpressions are evaluated from right to left (the result would have been `1` if it was evaluated from left to right).
