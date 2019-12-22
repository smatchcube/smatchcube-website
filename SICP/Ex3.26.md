---
layout: page
title:  "Exercise 3.26"
tags: mit-scheme scheme SICP solution
categories: SICP
---
My table implementation uses the binary tree implementation of Chapter 2.

Constructors, selectors and mutators for binary trees:
```scheme
(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (set-left-branch! tree new-branch)
  (set-car! (cdr tree) new-branch))
(define (set-right-branch! tree new-branch)
  (set-car! (cddr tree) new-branch))
```
Each record of tables is stored in a node of the tree.

The `same-key?` predicate tests if the first key match the second key and the `key-before?` predicate compares two keys and tells if the first key should be to the left of the second key in the tree.
```scheme
(define (make-table same-key? key-before?)
  (let ((records '())) ;; empty binary tree initialization
    (define (lookup key)
      (let ((record (assoc key records)))
	(if record
	    (cdr record)
	    false)))
    (define (assoc key records)
      (if (null? records)
	  false
	  (let ((record (entry records)))
	    (let ((record-key (car record)))
	      (cond ((same-key? key record-key) record)
		    ((key-before? key record-key) (assoc key (left-branch records)))
		    (else (assoc key (right-branch records))))))))
    (define (insert! key value)
      (define (iter-insert! records)
	(let ((record (entry records)))
	  (let ((record-key (car record)))
	    (cond ((same-key? key record-key) (set-cdr! record value) 'ok)
		  ((key-before? key record-key)
		   (cond ((null? (left-branch records))
			  (set-left-branch! records (make-tree (cons key value) '() '()))
			  'ok)
			 (else (iter-insert! (left-branch records)))))
		  (else
		   (cond ((null? (right-branch records))
			  (set-right-branch! records (make-tree (cons key value) '() '()))
			  'ok)
			 (else (iter-insert! (right-branch records)))))))))
      (cond ((null? records)
	     (set! records (make-tree (cons key value) '() '()))
	     'ok)
	    (else (iter-insert! records))))
    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
	    ((eq? m 'insert!) insert!)
	    (else
	     (error "Undefined operation: MAKE-TABLE" m))))
    dispatch))

(define (lookup key table)
  ((table 'lookup) key))
(define (insert! key value table)
  ((table 'insert!) key value))
```
Test:
```scheme
(define math-table (make-table = <))
(insert! 1 'one math-table)
(insert! 3 'three math-table)
(insert! 0 'zero math-table)
(insert! 2 'two math-table)
(insert! 5 'five math-table)
(insert! 4 'four math-table)
(insert! 3 'iii math-table) ;; overwriting

(lookup 3 math-table)
; => iii
(lookup 0 math-table)
; => zero
```
