---
layout: page
title:  "Exercise 2.14"
tags: mit-scheme scheme SICP solution
categories: SICP
---
To demonstrate that Lem is right we just need to test the different procedures with some values:

```scheme
(par1 (make-interval 2 4) (make-interval 3 6))
; => (0.6 . 4.8)

(par2 (make-interval 2 4) (make-interval 3 6))
; => (1.2 . 2.4)
```
We indeed get different values.

The main problem is that Alicia's system does not take into account whether some intervals are about the same "object".\\
For example, \\(R_1/R_1\\) should always be equal to one but is not equal to one in Alicia's system.
