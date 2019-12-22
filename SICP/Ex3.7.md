---
layout: page
title:  "Exercise 3.7"
tags: mit-scheme scheme SICP solution
categories: SICP
---
You can check my `make-account` implementation from exercise 3.3: [direct link](/SICP/Ex3.3/).
```scheme
(define (make-joint original-account original-password new-password)
  (lambda (password-guess m)
    (if (eq? new-password password-guess)
        (original-account original-password m)
        (lambda (x) "Incorrect password"))))
```
Test:
```scheme
;; definition of Peter's account with a balance of 700
(define peter-acc (make-account 700 'open-sesame))

;; creation of Paul account which can access Peter's account
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 10)
; => 710
((peter-acc 'open-sesame 'withdraw) 5)
; => 705
```