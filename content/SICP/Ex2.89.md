---
layout: page
title:  "Exercise 2.89"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Surprisingly we can do that changing only few lines of code thanks to the different level of abstraction.
```scheme
(define (adjoin-term term term-list)
  (cond ((=zero? (coeff term)) term-list)
        ((empty-termlist? term-list)
         (if (=zero? (order term))
             (list (coeff term))
             (adjoin-term term '(0))))
        ((equ? (order term) (add (order (first-term term-list)) 1))
         (cons (coeff term) term-list))
        (else (adjoin-term term (cons 0 term-list)))))
(define (first-term term-list)
  (list (length (cdr term-list)) (car term-list)))
```
Here we just "translated" the first term to the previous representation so we don't have to make many changes.
