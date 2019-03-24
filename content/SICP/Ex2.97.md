---
layout: page
title:  "Exercise 2.97"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I don't really have something to comment here, the code is really straightforward, I'm just following the instructions of the exercise.
# a.
```scheme
;; inside the polynomial package
(define (reduce-terms n d)
  (let ((g (gcd-terms n d)))
    (let ((c (coeff (first-term g)))
          (O1 (max (order (first-term n))
                   (order (first-term d))))
          (O2 (order (first-term g))))
      (let ((integerizing-factor (exp c (- O1 O2 -1))))
        (list (car (div-terms (mul-term-by-all-terms
                               (make-term 0 integerizing-factor) n)
                              g))
              (car (div-terms (mul-term-by-all-terms
                               (make-term 0 integerizing-factor)d)
                              g)))))))
(define (reduce-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((reduced-terms (reduce-terms (term-list p1)
                                         (term-list p2))))
        (list (make-poly (variable p1) (car reduced-terms))
              (make-poly (variable p1) (cadr reduced-terms))))
      (error "Polys not in same var: REDUCE-POLY")))

```
# b.
```scheme 
(define (reduce a b)
  (apply-generic 'reduce a b))

;; inside the scheme-number package
(define (reduce-integers n d)
  (let ((g (gcd n d))) (list (/ n g) (/ d g))))
put 'reduce '(scheme-number scheme-number)
     reduce-integers)

;; inside the polynomial package
  (put 'reduce '(polynomial polynomial)
       (lambda (p1 p2)
         (let ((reduced-poly (reduce-poly p1 p2)))
           (list (tag (car reduced-poly))
                 (tag (cadr reduced-poly))))))

;; inside the rational package
(define (make-rat n d)
  (let ((reduced (reduce n d)))
    (cons (car reduced) (cadr reduced))))
```
Now we can verify if we get the correct answer:
```scheme
(define p1 (make-polynomial 'x '((1 1) (0 1))))
(define p2 (make-polynomial 'x '((3 1) (0 -1))))
(define p3 (make-polynomial 'x '((1 1))))
(define p4 (make-polynomial 'x '((2 1) (0 -1))))
(define rf1 (make-rational p1 p2))
(define rf2 (make-rational p3 p4))
(add rf1 rf2)
; => (rational (polynomial x (3 -1) (2 -2) (1 -3) (0 -1)) 
;              polynomial x (4 -1) (3 -1) (1 1) (0 1))
```
The result is correctly reduced to lowest terms!
