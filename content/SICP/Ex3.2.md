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
Let's test it:
```scheme
(define s (make-monitored square))
(s 10)
; => 100
(s 'how-many-calls?)
; => 1
(s 'reset-count)
; => 1 ; set! return the old value even if we don't need it
(s 'how-many-calls?)
; => 0
```
