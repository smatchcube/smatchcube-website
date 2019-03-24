---
layout: page
title:  "Exercise 2.96"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
Here is my `remainder-terms` procedure and the modified version of `gcd-terms` to use it.
```scheme
(define (pseudoremainder-terms P Q)
  (let ((c (coeff (first-term Q)))
        (O1 (order (first-term P)))
        (O2 (order (first-term Q))))
    (let ((integerizing-factor (exp c (- O1 O2 -1))))
      (cadr (div-terms
             (mul-term-by-all-terms
              (make-term 0 integerizing-factor) P)
             Q)))))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))
```
We can see that now the coefficients are only integers.
```scheme
(greatest-common-divisor Q1 Q2)
; => (polynomial x (2 1458) (1 -2916) (0 1458))
```
# b.
I'm using the `accumulate` procedure to compute the GCD of the coefficients, then I can divide the polynomial by this GCD.
```scheme
(define (gcd-terms a b)
  (if (empty-termlist? b)
      (car (div-terms
            a (list (make-term
                     0 (accumulate (lambda (x y) (gcd (cadr x) y)) 0 a)))))
      (gcd-terms b (pseudoremainder-terms a b))))
```
Now we can find the simplified GCD of \\(Q_1\\) and \\(Q_2\\):
```scheme
(greatest-common-divisor Q1 Q2)
; => (polynomial x (2 1) (1 -2) (0 1))
```
