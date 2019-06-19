---
layout: page
title:  "Exercise 1.24"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the change needed to use the `fast-prime?` instead of the `prime?` procedure.

```scheme
(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
      (report-prime (- (runtime) start-time))))
```
Here are the results with our previous primes.
```scheme
100000000003 *** .8300000000000054
100000000019 *** .8299999999999983
100000000057 *** .8400000000000034
1000000000039 *** .8699999999999974
1000000000061 *** .8700000000000045
1000000000063 *** .8900000000000006
10000000000037 *** .9099999999999966
10000000000051 *** .9299999999999997
10000000000099 *** .9200000000000017
100000000000031 *** 1.0200000000000031
100000000000067 *** 1.
100000000000097 *** 1.009999999999998
```
We can see that testing a number roughly ten times greater doesn't exactly increase the time to a constant so the order of growth is not logarithminc. Maybe it growths faster because the `random` procedure takes more time with big numbers.
