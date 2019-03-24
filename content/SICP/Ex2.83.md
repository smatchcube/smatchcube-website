---
layout: page
title:  "Exercise 2.83"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(put 'raise '(integer)
     (lambda (x) (make-rational x 1)))
(put 'raise '(rational)
     (lambda (x) (/ (numer x) (denom x))))
(put 'raise '(real)
     (lambda (x) (make-complex-from-real-imag x 0)))
(define (raise x) (apply-generic 'raise x))
```
Note that this exercise is not using the previous types we defined earlier, for example we have not defined the integer type, this exercise is confusing for this reason. If we want to use this idea in our previous code we would need some changes:
```scheme
(put 'raise '(rational) 
     (lambda (x) (/ (numer x) (denom x))))
(put 'raise '(scheme-number) 
     (lambda (x) (make-complex-from-real-imag x 0)))
(define (raise x) (apply-generic 'raise x))
```
Now we can raise our previous numbers following the tower of types:\\
`rational -> scheme-number -> complex`\\
For example:
```scheme
(raise (raise (make-rational 4 2)))
; => (complex rectangular 2 . 0)
```
Raising two times our rational \\(\frac{4}{2}\\) give us the complex \\(2+0i\\) as expected.
