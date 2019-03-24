---
layout: page
title:  "Exercise 1.29"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I chose to divide the sum in four parts.
```scheme
(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))
  (* (+ (f a)
        (* 2 (sum f (+ a (* 2 h)) add-2h (+ a (* (- n 2) h))))
        (* 4 (sum f (+ a (* 3 h)) add-2h (+ a (* (- n 1) h))))
        (f (+ a (* n h))))
     (/ h 3.0)))
```
Comparing my solution to others, that's really interesting that so few solutions are dividing the sum in four parts as I did.\\
Here are the results of the integral of `cube` :
```scheme
(integral cube 0 1 100)
0.24999998666666667
```
```scheme
(integral cube 0 1 1000)
0.24999999999866668
```
With an equal value of `n`, this new procedure return a more precise estimation of the integral than the older procedure shown previously.
