---
layout: page
title:  "Exercise 2.88"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Let's start by defining a generic `neg` procedure:
```scheme
(define (neg x) (apply-generic 'neg x))

;; inside the rational package
(put 'neg '(rational) (lambda (x) (tag (make-rat (sub 0 (numer x))
                                                 (denom x)))))

;; inside the scheme number package
(put 'neg '(scheme-number) (lambda (x) (- 0 x)))

;; inside the complex package
(put 'neg '(complex)
     (lambda (x) (make-complex-from-real-imag (neg (real-part x))
                                              (neg (imag-part x)))))

;; inside the polynomial package
(define (neg-terms L)
  (if (empty-termlist? L)
      (the-empty-termlist)
      (adjoin-term (make-term (order (first-term L)) (neg (coeff (first-term L))))
                   (neg-terms (rest-terms L)))))
(define (neg-poly p)
  (make-poly (variable p) (neg-terms (term-list p))))
(put 'neg '(polynomial)
     (lambda (poly) (tag (neg-poly poly))))
```
Test of the generic `neg` operation:
```scheme
(neg (make-polynomial 'x '((4 (complex rectangular 3 . 2)) 
                           (3 1)
                           (2 (rational 1 . 3)))))
; => (polynomial x (4 (complex rectangular -3 . -2)) 
;                     (3 -1)
;                     (2 (rational -1 . 3)))
```
Now we can define the substraction of two polynomials:
```scheme
;; inside the polynomial package
(define (sub-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (sub-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var: SUB-POLY"
             (list p1 p2))))
(put 'sub '(polynomial polynomial)
     (lambda (p1 p2) (tag (sub-poly p1 p2))))
```
Let's test it:
```scheme
(let ((P1 (make-polynomial 'x '((2 3))))
      (P2 (make-polynomial 'x '((2 (complex rectangular 1 . 1))
                                (0 3)))))
  (sub P1 P2))
; => (polynomial x (2 (complex rectangular 2 . -1)) (0 -3))
```
\\(\text{P}_1=3x^2\\)\\
\\(\text{P}_2=\(1+1i\)x^2+3\\)\\
\\(\text{P}_1-\text{P}_2=\(2-1i\)x^2-3\\)
