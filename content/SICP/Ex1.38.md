---
layout: page
title:  "Exercise 1.38"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the procedure to approximate Euler's number using a continued fraction.
```scheme
(+ 2
   (cont-frac (lambda (i) 1.0)
	      (lambda (i)
		(if (= (remainder i 3) 2)
		    (/ (inc i) 1.5)
		    1))
	      10000))
```