---
layout: page
title:  "Exercise 1.46"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the general `iterative-improve` procedure to express the idea of iterative improvement.
```scheme
(define (iterative-improve good-enough? improve)
  (lambda (guess) (display guess)
    (if (good-enough? guess)
                      guess
                      ((iterative-improve good-enough? improve) (improve guess)))))
```
We can rewrite the `sqrt` and `fixed-point` using our new procedure.
```scheme
(define (sqrt x)
  (define (sqrt-good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define improve-sqrt
    (average-damp (lambda (y) (/ x y))))
  ((iterative-improve sqrt-good-enough? improve-sqrt) 1.0))
```
```scheme
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess)))
       0.00001))
  (define improve
    (lambda (x) (f x)))
  ((iterative-improve close-enough? improve) first-guess))
```
And we can test our new procedure to find an approximation of the unique fixed point of the cosine function.
```scheme
(fixed-point cos 1)    --> 0.7390893414033927
```
