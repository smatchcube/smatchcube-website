---
layout: page
title:  "Exercise 1.17"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (double a) (+ a a))
(define (halve a) (/ a 2))
;; below are the functions we need to use

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))
```
