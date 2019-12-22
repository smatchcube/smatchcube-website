---
layout: page
title:  "Exercise 3.30"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (ripple-carry-adder Ak Bk Sk C)
  (define (iter Ak Bk c-in Sk)
    (if (null? (cdr Ak))
	(full-adder (car Ak) (car Bk) c-in (car Sk) C)
	(let ((c-out (make-wire)))
	  (full-adder (car Ak) (car Bk) c-in (car Sk) c-out)
	  (iter (cdr Ak) (cdr Bk) c-out (cdr Sk)))))
  (iter Ak Bk (make-wire) Sk))
```
Test using the delay values and procedures defined later in the book:
```scheme
(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)
;; wires needed
(define a1 (make-wire))
(define a2 (make-wire))
(define a3 (make-wire))
(define a4 (make-wire))
(define a5 (make-wire))
(define b1 (make-wire))
(define b2 (make-wire))
(define b3 (make-wire))
(define b4 (make-wire))
(define b5 (make-wire))
(define s1 (make-wire))
(define s2 (make-wire))
(define s3 (make-wire))
(define s4 (make-wire))
(define s5 (make-wire))
(define c (make-wire))

;; 5-bits ripple-carry-adder
(ripple-carry-adder (list a1 a2 a3 a4 a5) (list b1 b2 b3 b4 b5) (list s1 s2 s3 s4 s5) c)

(probe 's1 s1)
(probe 's2 s2)
(probe 's3 s3)
(probe 's4 s4)
(probe 's5 s5)
(probe 'c c)

(set-signal! a1 1)
(set-signal! a2 1)
(set-signal! a3 0)
(set-signal! a4 0)
(set-signal! a5 0)
(set-signal! b1 0)
(set-signal! b2 1)
(set-signal! b3 1)
(set-signal! b4 0)
(set-signal! b5 0)

(propagate)
```
and here is the output printed during the simulation:
```scheme
s1 8 New-value = 1
s2 8 New-value = 1
s3 16 New-value = 1
s2 16 New-value = 0
s3 32 New-value = 0
s4 40 New-value = 1
```
We computed 00011~2~ + 00110~2~ and we got 01001~2~ (in decimal: 3 + 6 = 9).

Getting the formula of the delay is far from trivial because we have to consider many cases. Nonetheless we can find an approximation with our simulation:
```scheme
(define (estimate-delay wires trials)
  (define (iter worst-delay trials)
    (let ((before-propagate (current-time the-agenda)))
      (for-each (lambda (wire) (set-signal! wire (random 2))) wires)
      (propagate)
      (if (= 0 trials)
	  worst-delay
	  (let ((current-delay
		 (- (current-time the-agenda) before-propagate)))
	    (iter (max worst-delay current-delay) (- trials 1))))))
  (propagate)
  (iter 0 trials))

(estimate-delay (list a1 a2 a3 a4 a5 b1 b2 b3 b4 b5) 1000)
; => 80
```
