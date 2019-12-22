---
layout: page
title:  "Exercise 3.29"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We use the fact that `(or <e1> <e2>)` is true if and only if `(not (and (not <e1>) (not <e2>)))` is true. 

In simple english this means that at least one of two predicates is true if and only if these predicates are not both false.

```scheme
(define (or-gate a b output)
  (let ((c (make-wire))
	(d (make-wire))
	(e (make-wire)))
    (inverter a c)
    (inverter b d)
    (and-gate c d e)
    (inverter e output)
    'ok))
```
