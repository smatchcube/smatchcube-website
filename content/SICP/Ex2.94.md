---
layout: page
title:  "Exercise 2.94"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I really liked this exercise, it makes me discover what an Euclidean ring is.\\
Here is the code:
```scheme
(define (greatest-common-divisor a b)
  (apply-generic 'greatest-common-divisor a b))

;; inside the rational package 
(define (make-rat n d)
  (let ((g (greatest-common-divisor n d)))
    (cons (div n g) (div d g))))

;; inside the scheme-number package
(put 'greatest-common-divisor
     '(scheme-number scheme-number)
     gcd)

;; inside the polynomial package
(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))
(define (remainder-terms a b)
  (cadr (div-terms a b)))
(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                       (gcd-terms (term-list p1)
                                  (term-list p2)))
      (error "Polys not in same var: GCD-POLY")))
(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((terms (div-terms (term-list p1) (term-list p2))))
        (if (empty-termlist? (cadr terms))
            (make-polynomial (variable p1) (car terms))
        (list (make-polynomial (variable p1) (car terms))
              (make-polynomial (variable p1) (cadr terms)))))
      (error "Polys not in same var: DIV-POLY")))
(put 'greatest-common-divisor '(polynomial polynomial)
     (lambda (p1 p2) (tag (gcd-poly p1 p2))))
```
A change to the `div-poly` was needed to return only the quotient when the remainder was null (to have a more simple result for `make-rat` with polynomials). Now we can find the GCD of two polynomials and simplify a rational function.\\
Test:
```scheme
(define p1 (make-polynomial
            'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2 (make-polynomial 'x '((3 1) (1 -1))))

(greatest-common-divisor p1 p2)
; => (polynomial x (2 -1) (1 1))

(make-rational p1 p2)
; => (rational (polynomial x (2 -1) (0 2)) polynomial x (1 -1) (0 -1))
```
Checking the result by hands give the same answer, it works perfectly.\\
Of course it still works for rational numbers:
```scheme
(make-rational 2 6)
; => (rational 1 . 3)
```
