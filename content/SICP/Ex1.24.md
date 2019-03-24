---
layout: page
title:  "Exercise 1.24"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here are the results for our previous primes.
```scheme
100000000003 *** .6699999999999875
100000000019 *** .6800000000000068
100000000057 *** .6899999999999977
1000000000039 *** .6899999999999977
1000000000061 *** .710000000000008
1000000000063 *** .7199999999999989
10000000000037 *** .7399999999999949
10000000000051 *** .7600000000000051
10000000000099 *** .75
```
We can see that testing a number roughly ten times greater only increase the time to \\(0.03\\) seconds, it looks like the `fast-prime?` procedure is indeed logarithmic in time.
