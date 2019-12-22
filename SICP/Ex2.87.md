---
layout: page
title:  "Exercise 2.87"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my implementation of `=zero?` for polynomials:
```scheme
;; inside the polynomial package
define (=zero-poly? poly)
  (cond ((empty-termlist? (term-list poly)) true)
        ((=zero? (coeff (first-term (term-list poly))))
         (=zero-poly? (make-poly (variable poly) 
                                 (rest-terms (term-list poly)))))
        (else false)))
(put '=zero? '(polynomial)
     (lambda (poly) (=zero-poly? poly)))
```
Now we can test it:
```scheme
(=zero? (make-polynomial 'x (list (list 5 0)
                                  (list 4 (make-rational 0 3))
                                  (list 3 (make-complex-from-real-imag 0 0))
                                  (list 2 (make-polynomial 'y '((3 0)(1 0)))))))
; => #t
```
Our procedure understand that: \\(0\times x^5+\frac{0}{3}\times x^4+\(0+0i\)\times x^3+\(0\times y^3+0\times y\)\times x^2=0\\)\\
As we can see our implementation is extremely powerful!
