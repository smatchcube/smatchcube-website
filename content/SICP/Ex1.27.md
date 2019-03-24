---
layout: page
title:  "Exercise 1.27"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my procedure that return whether a number fool the Fermat test or not.
```scheme
(define (carmichael? n)
  (define (carmichael-iter n count)
    (cond ((= count n) true)
          ((= (expmod count n n) count) (carmichael-iter n (+ count 1)))
          (else false)))
  (if (prime? n)
      false
      (carmichael-iter n 1)))
```
Testing on the examples listed in the footnote 47 works as expected.
Note that my procedure has an order of growth \\(\Theta(n)\\) in time and \\(\Theta(1)\\) in space.\\
I tested some bigger Carmichael numbers found on the web, i don't run out of space as my procedure is \\(\Theta(1)\\) in space but the time needed for numbers with more than \\(6\\) digits is crazy.\\
