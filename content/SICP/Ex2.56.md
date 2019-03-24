---
layout: page
title:  "Exercise 2.56"
tags: mit-scheme scheme SICP solution
categories: SICP
---
here is the modified version of `deriv` for the new differentiation rule. Note that it would be better to have a `make-product` using more than two arguments.
```scheme
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (let ((base (base exp))
               (exponent (exponent exp)))
           (make-product
            exponent
            (make-product (make-exponentiation
                           base (- exponent 1))
                          (deriv base var)))))
        (else
         (error "unknown expression type: DERIV" exp))))
```
Here are the procedures needed:
```scheme
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent))
         (** base exponent)) ; "**" should be defined as "expt" for this to work
        (else (list '** base exponent))))
```
