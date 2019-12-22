---
layout: page
title:  "Exercise 3.25"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I use the closure property of tables for the implementation of multi-dimensional tables: each value in a table can also be a table.
```scheme
(define (make-table)
  (list '*table*))

(define (table? x)
  (and (pair? x) (eq? (car x) '*table*)))

(define (lookup keys table)
  (let ((record (assoc (car keys) (cdr table)))
	(next-keys (cdr keys)))
    (if record
	(cond ((null? next-keys) (cdr record))
	      ((table? (cdr record)) (lookup next-keys (cdr record)))
	      (else false))
	false)))

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (insert! keys value table)
  (let ((record (assoc (car keys) (cdr table)))
	(next-keys (cdr keys)))
    (if record
	(cond ((null? next-keys)
	       (set-cdr! record value) 'ok)
	      ((table? (cdr record)) (insert! next-keys value (cdr record)))
	      (else (let ((subtable (make-table)))
		      (set-cdr! record subtable)
		      (insert! next-keys value subtable))))
	(cond ((null? next-keys)
	       (set-cdr! table
			 (cons (cons (car keys) value)
			       (cdr table)))
	       'ok)
	      (else
	       (let ((subtable (make-table)))
		 (set-cdr! table
			   (cons (cons (car keys) subtable)
				 (cdr table)))
		 (insert! next-keys value subtable)))))))
```
Test:
```scheme
(define ASCII-table (make-table))
(insert! '(letters a) 96 ASCII-table) ;; wrong ASCII code
(insert! '(letters a) 97 ASCII-table) ;; correction
(insert! '(letters b) 98 ASCII-table)

(define math-table (make-table))
(insert! '(+) 43 math-table)
(insert! '(-) 45 math-table)

(insert! '(math) math-table ASCII-table) ;; insert a table inside another table
(insert! '(math *) 42 ASCII-table)

(lookup '(math +) ASCII-table)
; => 43

;; Representation of the table by the interpreter:
ASCII-table
; => (*table* (math *table* (* . 42) (- . 45) (+ . 43)) (letters *table* (b . 98) (a . 97)))
```
Box-and-pointer diagram of `ASCII-table`:

![](/assets/Ex3.25a.svg){width=650px}

Overwriting a table entry:
```scheme
(insert! '(math) 0 ASCII-table)

(lookup '(math +) ASCII-table)
; => false
```
Box-and-pointer diagram after overwriting the `math` entry:

![](/assets/Ex3.25b.svg){width=650px}
