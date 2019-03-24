---
layout: page
title:  "Exercise 2.79"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Definition of the generic operator:
```scheme
(define (equ? x y) (apply-generic 'equ? x y))
```
Definition of the operator for each type:
```scheme
;; in the scheme-number package
(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (= x y)))

;; in the rational number package
(put 'equ? '(rational rational)
     (lambda (x y) (and (= (numer x) (numer y))
                        (= (denom x) (denom y)))))

;; in the complex number package
(put 'equ? '(complex complex)
     (lambda (z1 z2) (and (= (real-part z1) (real-part z2))
                          (= (imag-part z1) (imag-part z2)))))
```
