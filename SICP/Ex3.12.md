---
layout: page
title:  "Exercise 3.12"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The evalutation of:
```scheme
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
```
can be represented in the following box-and-pointer diagram:

![](/images/Ex3.12a.svg){width=650px}

It's clear that `(cdr x)` returns `(b)`.

After `(define w (append! x y))` the box-and-pointer diagram is:

![](/images/Ex3.12b.svg){width=650px}

It's simple to see that `(cdr x)` returns `(b c d)` as the list `x` has been mutated with the `append!` procedure.
