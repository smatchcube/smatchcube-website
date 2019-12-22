---
layout: page
title:  "Exercise 3.28"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
	   (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
       or-gate-delay
       (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (logical-or a b)
  (if (= a 1)
      (if (or (= b 0) (= b 1))
	  1
	  (error "Invalid signal" b))
      (if (= b 1)
	  (if (= a 0)
	      1
	      (error "Invalid signal" a))
	  (if (= a 0)
	      (if (= b 0)
		  0
		  (error "Invalid signal" b))
	      (error "Invalid signal" a)))))
```
