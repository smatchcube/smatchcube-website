---
layout: page
title:  "Exercise 2.45"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (split s1 s2)
  (lambda (painter n)
    (define (foo painter n)
      (if (= n 0)
          painter
          (let ((smaller (foo painter (- n 1))))
            (s1 painter (s2 smaller smaller)))))
    (foo painter n)))
```
