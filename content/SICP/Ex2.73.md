---
layout: page
title:  "Exercise 2.73"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
There are no operators for constant or variable expressions so the `operator` expression can't works and give a correct type with this representation (number and variables are not tagged).
# b.
Here is my code, it's the basic derivation code, it only works with two operands and it doesn't simplify expressions.
```scheme
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))
(define (addend s) (car s))
(define (augend s) (cadr s))
(define (multiplier p) (car p))
(define (multiplicand p) (cadr p))
(define (deriv-sum operands var)
  (make-sum
   (deriv (addend operands) var)
   (deriv (augend operands) var)))
(define (deriv-product operands var)
  (let ((f (multiplier operands))
        (g (multiplier operands)))
    (make-sum (make-product (deriv f var) g)
              (make-product f (deriv g var)))))

;; install the procedures in the table
(put 'deriv '+ deriv-sum)
(put 'deriv '* deriv-product)
```
# c.
```scheme
(define (base e) (car e))
(define (exponent e) (cadr e))
(define (make-exponentiation base exponent)
  (list '** base exponent))
(define (deriv-exponentiation operands var)
  (let ((base (base operands))
        (exponent (exponent operands)))
    (make-product exponent
                  (make-product
                   (make-exponentiation base (- exponent 1))
                   (deriv base var)))))
(put 'deriv '** deriv-exponentiation)
```
# d.
We only need to reverse the index of each procedure:
```scheme
(put '+ 'deriv deriv-sum)
(put '* 'deriv deriv-product)
(put '** 'deriv deriv-exponentiation)
```
Note that you can separate the procedures in different packages if you want (not really needed in this exercise).
