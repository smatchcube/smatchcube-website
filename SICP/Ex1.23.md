---
layout: page
title:  "Exercise 1.23"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `find-divisor` procedure modified to use the new `next` procedure.
```scheme
(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
```

|Prime number|Power of ten|Old time (seconds)|New time (seconds)|Ratio (old/new)|
|-----:|:----:|-----:|-----:|-----:|
$100000000003$<br/>$100000000019$<br/>$100000000057$|$10^{11}$|$0.39$|$0.24$|$1.63$
$1000000000039$<br/>$1000000000061$<br/>$1000000000063$|$10^{12}$|$1.23$|$0.74$|$1.66$
$10000000000037$<br/>$10000000000051$<br/>$10000000000099$|$10^{13}$|$3.86$|$2.35$|$1.64$
$100000000000031$<br/>$100000000000067$<br/>$100000000000097$|$10^{14}$|$12.22$|$7.36$|$1.66$

Table: Comparison of time between the different implementations

The ratio is approximately $1.65$ and not $2$ as expected. I think the difference comes from the call to the `next` procedure and the need to test for equality in this procedure.