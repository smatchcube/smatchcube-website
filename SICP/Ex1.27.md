---
layout: page
title:  "Exercise 1.27"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my procedure that return whether a number fool the Fermat test or not.
```scheme
(define (carmichael? n)
  (define (carm-iter a)
    (cond ((>= a n) true)
          ((= (expmod a n n) a) (carm-iter (+ a 1)))
          (else false)))
  (if (prime? n)
      false
      (carm-iter 1)))
```
Testing on the examples listed in the footnote 47 works as expected.