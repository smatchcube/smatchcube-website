---
layout: page
title:  "Exercise 3.2"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-monitored f)
  (define counter 0)
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls?) counter)
          ((eq? m 'reset-count) (set! counter 0))
          (else (set! counter (+ counter 1))
                (f m))))
  dispatch)
```
Test:
```scheme
(define s (make-monitored square))
(define i (make-monitored (lambda (x) (+ x 1))))

(s 'how-many-calls?)
; => 0

(i 'how-many-calls?)
; => 0

(s 10)
; => 100

(s 'how-many-calls?)
; => 1

(i 'how-many-calls?)
; => 0

(i 3)
; => 4

(i 'how-many-calls?)
; => 1

(s 'reset-count) ; return value not interesting
(s 'how-many-calls?)
; => 0

(i 'how-many-calls?)
; => 1
```
