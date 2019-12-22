---
layout: page
title:  "Exercise 2.91"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Let's use the sparse representation only with the code we used before the previous exercise, it will make everything much more simple.\\
So here is the code completed to make the divisions of terms:
```scheme
(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms (add-terms (rest-terms L1)
                                           (neg-terms
                                            (mul-term-by-all-terms
                                             (make-term new-o new-c)
                                             (rest-terms L2))))
                                L2)))
                (list (adjoin-term (make-term new-o new-c) (car rest-of-result))
                      (cadr rest-of-result))
                ))))))
```
The result is a list with a list of the terms of the quotient as a first element and a list of terms of the remainder as the second element.\\
Now we can define the `div-poly` and the division for polynomials:
```scheme
(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((terms (div-terms (term-list p1) (term-list p2))))
        (list (make-polynomial (variable p1) (car terms))
              (make-polynomial (variable p1) (cadr terms))))
      (error "Polys not in same var: DIV-POLY")))
(put 'div '(polynomial polynomial)
     (lambda (p1 p2) (div-poly p1 p2)))
```
The result is a list of polynomials, the first polynomial is the quotient, the second is the remainder.
Here is a test on division from the book:
```scheme
(div (make-polynomial 'x '((5 1) (0 -1))) (make-polynomial 'x '((2 1) (0 -1))))
; => ((polynomial x (3 1) (1 1)) (polynomial x (1 1) (0 -1)))
```
