---
layout: page
title:  "Exercise 1.20"
tags: mit-scheme scheme SICP solution
categories: SICP
---
**Normal-order evalutation:**

The second argument `b` must be evaluated each time the `gcd` procedure is called in order to check if `b` is equal to zero. The first argument `a` is only evaluated if `b` is zero.
```scheme
(gcd 206 40)
(gcd 40 
     (remainder 206 40))
(gcd (remainder 206 40) 
     (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
```
On this last line the evaluation of `b` gives the number zero so the final result is the evaluation of `a`, that is:
```scheme
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
2
```
We can count 18 calls of the `remainder` procedure with normal-order evaluation.

**Applicative-order evaluation**:
```scheme
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
```
There are only 4 calls to the `remainder` procedure using applicative-order evaluation.
