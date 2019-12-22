---
layout: page
title:  "Exercise 2.23"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (for-each f items)
  (f (car items))
  (let ((rest (cdr items)))
    (if (null? rest)
        true
        (for-each f rest))))
```
