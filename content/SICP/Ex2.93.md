---
layout: page
title:  "Exercise 2.93"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We just have to use generic operations, I will post my whole rational package.
```scheme
(define (install-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (cons n d))
  (define (add-rat x y)
    (make-rat (add (mul (numer x) (denom y))
                   (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (sub (mul (numer x) (denom y))
                   (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (mul (numer x) (numer y))
              (mul (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (mul (numer x) (denom y))
              (mul (denom x) (numer y))))
  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'equ? '(rational rational)
       (lambda (x y) (and (equ? (numer x) (numer y))
                          (equ? (denom x) (denom y)))))
  (put '=zero? '(rational)
       (lambda (x) (=zero? (numer x))))
  (put 'add '(rational rational)
        (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
        (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
        (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
        (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational
        (lambda (n d) (tag (make-rat n d))))
  (put 'denom '(rational) denom)
  (put 'numer '(rational) numer)
  (put 'raise '(rational) (lambda (x) (/ (numer x) (denom x))))
  (put 'cosine '(rational) (lambda (x) (cos (/ (numer x) (denom x)))))
  (put 'sine '(rational) (lambda (x) (sin (/ (numer x) (denom x)))))
  (put 'neg '(rational) (lambda (x) (tag (make-rat (sub 0 (numer x))
                                                   (denom x)))))
  'done)
(define (make-rational n d)
  ((get 'make 'rational) n d))
(install-rational-package)
```
Now we can test it as asked by the exercise:
```scheme
(define p1 (make-polynomial 'x '((2 1)(0 1))))
(define p2 (make-polynomial 'x '((3 1)(0 1))))
(define rf (make-rational p2 p1))
(add rf rf)
; => (rational (polynomial x (5 2) (3 2) (2 2) (0 2))
;              polynomial x (4 1) (2 2) (0 1))
```
