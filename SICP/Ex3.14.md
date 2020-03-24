---
layout: page
title:  "Exercise 3.14"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Box-and-pointer diagram before the call of `mystery`:

![](/images/Ex3.14a.svg){width=650px}

After the evaluation of `(define w (mystery v))`:

![](/images/Ex3.14b.svg){width=650px}

The `mystery` procedure reverses a list using mutation.

It's clear that `v` is printed as `(a)` and `w` as `(d c b a)`.
