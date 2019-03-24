---
layout: page
title:  "Exercise 1.28"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I didn't really followed the instructions for this exercise but it's working fine even with Carmichael numbers, but my solution may be totally wrong (will look at this later).
```scheme
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))
```
