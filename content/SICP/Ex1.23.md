---
layout: page
title:  "Exercise 1.23"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `find-divisor` procedure adapted to use the new `next` procedure.
```scheme
(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
```

| **Prime number**|**Factor**|**Old time in seconds**|**New time in seconds**|**Ratio (old/new)**|
|-----:|:----:|-----:|-----:|-----:|
\\(100000000003\\)<br/>\\(100000000019\\)<br/>\\(100000000057\\)|\\(10^{11}\\)|\\(0.33\\)|\\(0.20\\)|\\(1.65\\)
\\(1000000000039\\)<br/>\\(1000000000061\\)<br/>\\(1000000000063\\)|\\(10^{12}\\)|\\(1.01\\)|\\(0.61\\)|\\(1.66\\)
\\(10000000000037\\)<br/>\\(10000000000051\\)<br/>\\(10000000000099\\)|\\(10^{13}\\)|\\(3.19\\)|\\(1.94\\)|\\(1.64\\)

The ratio is approximately \\(1.65\\) and not \\(2\\) as expected, I think that this difference is caused by the `next` procedure that take some time to process.
