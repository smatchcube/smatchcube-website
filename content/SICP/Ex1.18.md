---
layout: page
title:  "Exercise 1.18"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (* a b)
  (define (*-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (*-iter (double a) (halve b) c)) ; double and halve are defined in the previous exercise
          (else (*-iter a (- b 1) (+ c a)))))
  (*-iter a b 0))
  ```
