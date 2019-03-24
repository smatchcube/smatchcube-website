---
layout: page
title:  "Exercise 2.92"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The exercise become easy if we think of polynomials without polynomials as coefficients, I will assume that.\\
The idea is to "normalize" one of the polynomial to the other so the two polynomials have the same "principal" variable. 
Here is how to normalize a polynomial to another variable:
```scheme
(define (normalize poly-or-x v)
  (make-poly v
             (adjoin-term
               (make-term 0 poly-or-x)
(the-empty-termlist))))
```
After that it's really easy to add two polynomials with different variables, we just need to compare the variable symbol (converting the symbols to strings and comparing them with `string<?`) and add them after normalizing the polynomial with the least important variable. Same reasoning for multiplication. The problem is that we are not really doing the operation in this process so the solution is not simplified at all.
