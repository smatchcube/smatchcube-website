---
layout: page
title:  "Exercise 3.3"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-account balance secret-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password-guess m)
    (if (eq? secret-password password-guess)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           m)))
        (lambda (x) "Incorrect password")))
  dispatch)
```
Test:
```scheme
(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
; => 60

((acc 'some-other-password 'deposit) 50)
; => "Incorrect password"
```
