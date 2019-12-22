---
layout: page
title:  "Exercise 3.17"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I rewrite `count-pairs` keeping a list of already counted pairs:
```scheme
(define (count-pairs x)
  (let ((pairs-seen '()))
    (define (recur x)
      (cond ((not (pair? x)) 0)
	    ((memq x pairs-seen) 0)
	    (else (set! pairs-seen (cons x pairs-seen))
		  (+ 1 
                     (recur (car x))
		     (recur (cdr x))))))
    (recur x)))
```
