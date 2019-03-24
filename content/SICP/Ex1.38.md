---
layout: page
title:  "Exercise 1.38"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the procedure to approximate Euler's number "\\(e\\)".
```scheme
(define (e k)
  (+ 2.0
     (cont-frac (lambda (i) 1)
                (lambda (i) (let ((r (remainder i 3)))
                              (if (= r 2)
                                  (- i (/ (- i r) 3))
                                  1)))
                k)))
```
The hardest part of this exercise is to express \\(D_i\\) as a procedure.
