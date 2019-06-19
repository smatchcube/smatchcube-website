---
layout: page
title:  "Exercise 1.19"
tags: mit-scheme scheme SICP solution
categories: SICP
---
$$\begin{align} T_{pq}(T_{pq}(a,b))&=T_{pq}(bq+aq+ap,bp+aq)\\&=(q(bp+aq)+q(bq+aq+ap)+p(bq+aq+ap),p(bp+aq)+q(bq+aq+ap))\\&=(bpq+aq^2+bq^2+aq^2+apq+bpq+apq+ap^2,bp^2+apq+bq^2+aq^2+apq)\\&=(b(q^2+2pq)+a(q^2+2pq)+a(p^2+q^2),b(p^2+q^2)+(q^2+2pq))\\&=(bq'+aq'+ap',bp'+aq')\\&=T_{p'q'}(a,b)\end{align}$$
With $p'=p^2+q^2$ and $q'=q^2+2pq$.

This result leads us to the following clever algorithm to compute the Fibonacci numbers in a logarithmic number of steps:
```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```
