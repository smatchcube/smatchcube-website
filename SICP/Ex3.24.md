---
layout: page
title:  "Exercise 3.24"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We just need our table to use a custom `assoc` procedure using `same-key?` when comparing keys.
```scheme
(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
	(if record (cdr record) false)))
    (define (insert! key value)
      (let ((record (assoc key (cdr local-table))))
	(if record
	    (set-cdr! record value)
	    (set-cdr! local-table
		      (cons (cons key value)
			    (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
	    ((eq? m 'insert!) insert!)
	    (else (error "Unknown operation: TABLE" m))))
    dispatch))
```
Test:
```scheme
(define x '(1 2))
(define y '(1 2))

(define table1 (make-table eq?))
((table1 'insert!) x 'a)
((table1 'lookup) y)
; => false

(define table2 (make-table equal?))
((table2 'insert!) x 'a)
((table2 'lookup) y)
; => a
```
