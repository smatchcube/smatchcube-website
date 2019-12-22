---
layout: page
title:  "Exercise 1.46"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the general `iterative-improve` procedure to express the idea of iterative improvement.
```scheme
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
	guess
	((iterative-improve good-enough? improve) (improve guess)))))
```
We can rewrite `sqrt` and `fixed-point` using our new procedure.
```scheme
(define (sqrt x)
  (let ((good-enough? (lambda (guess) (< (abs (- (square guess) x)) 0.001)))
	(improve (lambda (guess) (average guess (/ x guess)))))
    ((iterative-improve good-enough? improve) 1.0)))

(sqrt 9)
; => 3.00009155413138
```

```scheme
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (let ((close-enough? (lambda (guess) (< (abs (- (f guess) guess)) tolerance))))
    ((iterative-improve close-enough? f) first-guess)))

(fixed-point cos 1.0)
; => 0.7390893414033927
```
