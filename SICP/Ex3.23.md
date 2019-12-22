---
layout: page
title:  "Exercise 3.23"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I used a doubly linked list for the implementation.

In the abstraction of doubly linked lists each node has an item and two pointers, one for the previous node and one for the next node.
Here is the implementation:
```scheme
(define (make-node item)
  (cons item (cons '() '())))

(define (prev-node node)
  (cadr node))
(define (next-node node)
  (cddr node))
(define (item-node node)
  (car node))

(define (set-prev-node! node new-prev-node)
  (set-car! (cdr node) new-prev-node))
(define (set-next-node! node new-next-node)
  (set-cdr! (cdr node) new-next-node))
```
I decided to define double-ended queues as pairs of two pointers, one pointing to the first node of the doubly linked list and one to the last node.

Here is the implementation of double-ended queue:
```scheme
(define (make-deque) (cons '() '()))

(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))

(define (empty-deque? deque)
  (null? (front-ptr deque)))

(define (set-front-ptr! deque item)
  (set-car! deque item))
(define (set-rear-ptr! deque item)
  (set-cdr! deque item))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT-DEQUE called with an empty deque" deque)
      (item-node (front-ptr deque))))
(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR-DEQUE called with an empty deque" deque)
      (item-node (rear-ptr deque))))

(define (front-insert-deque! deque item)
  (let ((new-node (make-node item)))
    (cond ((empty-deque? deque)
	   (set-front-ptr! deque new-node)
	   (set-rear-ptr! deque new-node)
	   deque)
	  (else
	   (set-next-node! new-node (front-ptr deque))
	   (set-prev-node! (front-ptr deque) new-node)
	   (set-front-ptr! deque new-node)
	   deque))))

(define (rear-insert-deque! deque item)
  (let ((new-node (make-node item)))
    (cond ((empty-deque? deque)
	   (set-front-ptr! deque new-node)
	   (set-rear-ptr! deque new-node)
	   deque)
	  (else
	   (set-prev-node! new-node (rear-ptr deque))
	   (set-next-node! (rear-ptr deque) new-node)
	   (set-rear-ptr! deque new-node)
	   deque))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
	 (error "FRONT-DELETE-DEQUE! called with an empty deque" deque))
	(else (set-front-ptr! deque (next-node (front-ptr deque)))
	      (if (null? (front-ptr deque))
		  (set-rear-ptr! deque '()) ;; deque is now empty
		  (set-prev-node! (front-ptr deque) '()))
	      deque)))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
	 (error "REAR-DELETE-DEQUE! called with an empty deque" deque))
	(else (set-rear-ptr! deque (prev-node (rear-ptr deque)))
	      (if (null? (rear-ptr deque))
		  (set-front-ptr! deque '()) ;; deque is now empty
		  (set-next-node! (rear-ptr deque) '()))
	      deque)))

(define (print-deque deque)
  (define (iter node)
    (if (null? (next-node node))
	(display (item-node node))
	(begin (display (item-node node)) (display " ") (iter (next-node node)))))
  (display "(")
  (if (not (empty-deque? deque))
      (iter (front-ptr deque)))
  (display ")"))
```
Test:
```scheme
(define dq (make-deque))

(empty-deque? dq)
; => true

(front-insert-deque! dq 'z)

(print-deque dq) ;; print (z)

(empty-deque? dq)
; => false

(rear-delete-deque! dq)

(print-deque dq) ;; print ()

(front-insert-deque! dq 'b)
(rear-insert-deque! dq 'c)
(front-insert-deque! dq 'a)

(print-deque dq) ;; print (a b c)

(front-deque dq)
; => a

(rear-deque dq)
; => c
```
