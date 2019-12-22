---
layout: page
title:  "Exercise 1.45"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We experiment to determine the minimal number of average damps required to compute $n$<sup>th</sup> roots using a fixed-point search.

Here are the result summarized in a table:

|$n$| minimal number of average damps needed |
|--:|:-:|
| 2 | 1 |
| 3 | 1 |
| 4 | 2 |
| 5 | 2 |
| 6 | 2 |
| 7 | 2 |
| 8 | 3 |
| 9 | 3 |
| 10 | 3 |
| 11 | 3 |
| 12 | 3 |
| 13 | 3 |
| 14 | 3 |
| 15 | 3 |
| 16 | 4 |
| 17 | 4 |
| ...|...|
| 31 | 4 |
| 32 | 5 |
| ...|...|
| 63 | 5 |
| 64 | 6 |

It seems like we need $\lfloor \log_2 (n) \rfloor$ average damps to compute $n$<sup>th</sup> roots.

Knowing this information we can write the procedure to approximate $n$<sup>th</sup> roots using the `floor`, `log` and `expt` scheme primitives.
```scheme
(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2))))
		(lambda (y) (/ x (expt y (- n 1)))))
	       1.0))
```