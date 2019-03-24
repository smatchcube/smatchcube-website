---
layout: page
title:  "Exercise 2.58"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a. 
We only need to change the representation thanks to the power of abstraction.
```scheme
(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (addend s) (car s))
(define (augend s) (caddr s))

(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
```
# b.
As the `deriv` procedure is checking if it's a sum before if it's a product we can make only relatively small changes in order to respect priority of computation and to drop useless parentheses. Indeed, if the `deriv` procedure is computing the derivative of a product in an expression, it means that the expression is not a sum (because it's checking first if it's a sum), so it takes automatically care of priority. It's a bit tricky but it works perfectly. I'm pretty sure the order of the predicates in the `deriv` procedure was carefully thought from the beginning by the wise authors to take this idea into account.
```scheme
(define (sum? x)
  (cond ((null? x) false)
        ((eq? (car x) '+) true)
        (else (sum? (cdr x)))))

(define (product? x)
  (cond ((null? x) false)
        ((eq? (car x) '*) true)
        (else (product? (cdr x)))))

(define (addend s)
  (define (addend-iter before+ after+)
    (if (eq? (car after+) '+)
        (if (null? (cdr before+))
            (car before+)
            before+)
        (addend-iter (append before+ (list (car after+))) (cdr after+))))
  (addend-iter '() s))

(define (augend s)
  (if (eq? (car s) '+)
      (if (null? (cddr s))
          (cadr s)
          (cdr s))
      (augend (cdr s))))

(define (multiplier p)
  (define (multiplier-iter before* after*)
    (if (eq? (car after*) '*)
        (if (null? (cdr before*))
            (car before*)
            before*)
        (multiplier-iter (append before* (list (car after*))) (cdr after*))))
  (multiplier-iter '() p))

(define (multiplicand p)
  (if (eq? (car p) '*)
      (if (null? (cddr p))
          (cadr p)
          (cdr p))
      (multiplicand (cdr p))))
```
Note that I'm not changing the constructor `make-sum` and `make-product` to drop useless parentheses for the output because it can really be complicated.
