---
layout: page
title:  "Exercise 2.77"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Let's define `z`:
```scheme
(define z (make-complex-from-real-imag 3 4))
z
; => (complex rectangular 3 . 4)
```
Here is how `(magnitude z)` is evaluated:
```scheme 
(magnitude z)
(apply-generic 'magnitude (complex rectangle 3 . 4)) ; apply magnitude from the complex package
(apply-generic 'magnitude (rectangular 3 . 4)) ; apply magnitude from the rectangular package
5 ; result from (magnitude '(3 . 4)) from the rectangular package
```
The `magnitude` procedure is dispatched two times, a first time with the complex type and a second time with the rectangular type.
