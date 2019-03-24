---
layout: page
title:  "Exercise 3.4"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-account balance secret-password)
  (define wrong-guess-counter 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (wrong-guess x)
    (set! wrong-guess-counter (+ wrong-guess-counter 1))
    (if (>= wrong-guess-counter 7)
        (begin (call-the-cops)
               "Incorrect password, we are calling the cops!")
        "Incorrect password"))
  (define (dispatch password-guess m)
    (if (eq? secret-password password-guess)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           m)))
        wrong-guess))
  dispatch)
```
