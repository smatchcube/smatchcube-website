---
layout: page
title:  "Exercise 1.18"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (fast-* a b)
  (define (*-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (*-iter (double a) (halve b) c))
	  (else (*-iter a (- b 1) (+ c a)))))
  (*-iter a b 0))
```
As in the exercise 1.16 we used an *invariant quantity*. In this case the invariant quantity is $ab+c$.
