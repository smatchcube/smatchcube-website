---
layout: page
title:  "Exercise 2.19"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define no-more? null?)
(define first-denomination car)
(define except-first-denomination cdr)
```
The answer produced by `cc` is not affected by the order of the list `coin-values` because the order is not important when we are counting every combinations. For example, if you start to count your fingers, you can start to count the fingers beginning with the auricular of your left hand but you can also start counting with the thumb of your right hand, the most important thing is just to count everything. 
