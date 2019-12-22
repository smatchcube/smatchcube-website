---
layout: page
title:  "Exercise 3.8"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is `f` which return the argument of the previous call:
```scheme
(define f
  (let ((old-value 0))
    (lambda (x) (let ((return-value old-value))
		  (set! old-value x)
		  return-value))))
```
`(+ (f 0) (f 1))` will return `0` if arguments are evaluated from left to right and `1` if arguments are evaluated from right to left.