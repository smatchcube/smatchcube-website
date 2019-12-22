---
layout: page
title:  "Exercise 3.22"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (empty-queue?) (null? front-ptr))
    (define (front-queue) (car front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?)
	       (set-front-ptr! new-pair)
	       (set-rear-ptr! new-pair)
	       dispatch)
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set-rear-ptr! new-pair)
	       dispatch))))
    (define (delete-queue!)
      (cond ((empty-queue?)
	     (error "DELETE! called with an empty queue" dispatch))
	    (else (set-front-ptr! (cdr front-ptr))
		  dispatch)))
    (define (print-queue)
      (display front-ptr))
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-queue?))
	    ((eq? m 'front-queue) (front-queue))
	    ((eq? m 'insert-queue!) insert-queue!)
	    ((eq? m 'delete-queue!) (delete-queue!))
	    ((eq? m 'print-queue) (print-queue))
	    (else
	     error "Undefined operation: MAKE-QUEUE" m)))
    dispatch))
```
Test:
```scheme
(define q (make-queue))

(q 'empty-queue?)
; => true

((q 'insert-queue!) 'a)

(q 'empty-queue?)
; => false

(((q 'insert-queue!) 'b) 'print-queue) ;; print (a b)

(q 'delete-queue!)

((q 'insert-queue!) 'c)

(((q 'insert-queue!) 'd) 'print-queue) ;; print (b c d)
```
