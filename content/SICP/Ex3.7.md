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
As usual we can test it:
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
It's interesting that I don't even have to modify the `make-account` procedure to implement this new feature. One problem with this quick and straightforward implementation is that it's not checking if the original password is right, making the new account useless if the password is wrong during the creation of the account. This could easily be solved by checking during the account creation if the result of a deposit action with an amount of 0 return a number and not a password error.
