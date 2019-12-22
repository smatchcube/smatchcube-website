---
layout: page
title:  "Exercise 2.86"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We need to call the `add`, `sub`,  `mul` and `div` procedures instead of the `+`, `-`, `*` and `/` operators inside our sub-procedures dealing with rectangles and polar complex numbers. In general we should use generic operators whenever it's possible. We also need to have generic `sine` and `cosine` procedures working with either rational or real numbers.\\
Here are the changes:
```scheme
(define (sine x) (apply-generic 'sine x))
(define (cosine x) (apply-generic 'cosine x))


;; inside the rational package
(put 'cosine '(rational) (lambda (x) (cos (/ (numer x) (denom x)))))
(put 'sine '(rational) (lambda (x) (sin (/ (numer x) (denom x)))))

;; inside the scheme-number package
(put 'sine '(scheme-number) (lambda (x) (sin x)))
(put 'cosine '(scheme-number) (lambda (x) (cos x)))

;; inside the complex package
(define (add-complex z1 z2)
  (make-from-real-imag (add (real-part z1) (real-part z2))
                       (add (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
  (make-from-real-imag (sub (real-part z1) (real-part z2))
                       (sub (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
  (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                     (add (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-mag-ang (div (magnitude z1) (magnitude z2))
                     (div (angle z1) (angle z2))))

;; inside the polar package
(define (real-part z)
  (* (magnitude z) (cosine (angle z))))
(define (imag-part z)
  (* (magnitude z) (sine (angle z))))
```
Some changes might be omitted.
