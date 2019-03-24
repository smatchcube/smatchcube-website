---
layout: page
title:  "Exercise 2.1"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I use the fact that if the denominator is positive we don't need to change the sign of the rational number and if the denominator is negative we need to take the opposite of the numerator and the absolute value of the denominator.
```scheme
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (positive? d)
        (cons (/ n g) (/ d g))
        (cons (- (/ n g)) (abs (/ d g))))))
```
