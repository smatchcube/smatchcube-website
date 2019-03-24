---
layout: page
title:  "Exercise 1.36"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the modified version of `fixed-point` to display the sequence of approximations it generates.
```scheme
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess number-step)
    (let ((next (f guess)))
      (newline) (display next) (display " *** step number: ") (display number-step)
      (if (close-enough? guess next)
          next
          (try next (+ number-step 1)))))
  (try first-guess 1))
```
Here is the procedure to approximate the solution to \\(x^x = 1000\\).
```scheme
(define log1000 (log 1000))
(fixed-point (lambda (x) (/ log1000 (log x))) 2)
```
Without average damping we need \\(34\\) steps to approximate the solution.
```scheme
(fixed-point (lambda (x) (/ (+ x (/ log1000 (log x))) 2)) 2)
```
Using the average damping technique, we only need \\(9\\) steps to have the same approximation.
