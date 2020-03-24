---
layout: page
title:  "Exercise 3.13"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Box-and-pointer diagram of the structure `z` created by `(define z (make-cycle (list 'a 'b 'c)))`:

![](/images/Ex3.13.svg){width=650px}

It's clear that `z` has no end-of-list marker so no base case is found during the evaluation of `(last-pair z)`, the end result is an infinite loop.
