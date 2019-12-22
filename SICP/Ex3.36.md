---
layout: page
title:  "Exercise 3.36"
tags: mit-scheme scheme SICP solution
categories: SICP
---
![](/assets/Ex3.36.svg){height=650px}

When `(define a (make-connector))` and `(define b (make-connector))` are evaluated the frames `E1`, `E2`, `E3` and `E4` are created.
When `(set-value! a 10 'user)` is evaluated the frame `E5` is created passing a message to `a` in `E6`. Then the frame `E7` is created to change the value of the connector `a` and call the `for-each-except` procedure in frame `E8`.
