---
layout: page
title:  "Exercise 2.38"
tags: mit-scheme scheme SICP solution
categories: SICP
---
`(fold-right / 1 (list 1 2 3))` is computed as \\(1 / (2 / (3/1))\\) which gives `3/2`.

`(fold-left / 1 (list 1 2 3))` is computed as \\(((1/1)/2)/3\\) which gives `1/6`.

`(fold-right list nil (list 1 2 3))` gives `(1 (2 (3 ())))`.

`(fold-left list nil (list 1 2 3))` gives `(((() 1) 2) 3)`.

We can see that the order of the element are not changed with the two fold procedures, only the priority of computation changes, that's why `op` must be an associative operation in order to obtain the same result with both fold procedures. Of course we also need to be sure that the `initial` argument is the neutral element of the operation.

Let's test this property with the multiplication of two matrices seen in the previous exercise, keep in mind that matrix multiplication is associative but not commutative.

We start by defining some matrices and the identity matrix. I chose to use quotation to make it less verbose (read chapter 2.3.1 to know more about how quotation works).
```scheme
(define M1 '((1 2 3 1) (4 5 6 2) (1 7 8 9) (9 4 1 2)))
(define M2 '((4 1 2 1) (5 5 7 6) (3 2 1 2) (6 7 1 3)))
(define M3 '((1 2 2 1) (8 8 4 3) (3 2 5 5) (2 5 8 1)))

(define I4 '((1 0 0 0) (0 1 0 0) (0 0 1 0) (0 0 0 1)))
```
Next we create a list of the matrices.
```scheme
(define L (list M1 M2 M3))
```
Now we can finally multiply them with both fold procedures and see if they gives the same value with `equal?`.
```scheme
(equal?
 (fold-right matrix-*-matrix I4 L) ; M1 * (M2 * M3)
 (fold-left matrix-*-matrix I4 L)) ; (M1 * M2) * M3
; => #t
```
It perfectly works as expected.
