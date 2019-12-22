---
layout: page
title:  "Exercise 2.80"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Definition of the generic operator:
```scheme
(define (=zero? x) (apply-generic '=zero? x))
```
Definition of the operator for each type:
```scheme
;; in the scheme-number package
(put '=zero? '(scheme-number)
     (lambda (x) (zero? x)))

;; in the rational number package
(put '=zero? '(rational)
     (lambda (x) (zero? (numer x))))

;; in the complex number package
(put '=zero? '(complex)
     (lambda (z) (and (zero? (real-part z))
                      (zero? (imag-part z)))))
```
