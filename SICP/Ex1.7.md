---
layout: page
title:  "Exercise 1.7"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The problem of the `good-enough?` procedure is that 0.001 is arbitrary small and is not optimal for small or big numbers.   
For instance, `(sqrt 1.e-10)` return `0.03125000106562499`, which is obviously not even close to the exact `1e-5` solution. For big numbers, the program hangs on my system: `(sqrt 1e60)` never terminates.
Below is an alternative code which introduces a new variable `old-guess` to keep tracking of the change during two iterations to find the approximation of any square root. Here a guess is considered good enough if the ratio between the old guess and the new guess is close enough to one.
```scheme
(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess x) guess
        (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess guess x)
  (< (abs (- 1 (/ guess old-guess))) 0.001))

(define (sqrt x)
  (sqrt-iter 0.1 1.0 x))
```
Now we can easily compute the square root or small and big numbers.  
`(sqrt 1e-10)` returns `1.0000000015603234e-5`.  
`(sqrt 1e60)` returns `1.0000000031080746e30`.  
Our new version works way better for small or big numbers.
