---
layout: page
title:  "Exercise 1.5"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Firstly, the first line define an infinite loop because the procedure `(p)` call itself.\\
If the interpreter uses normal-order evaluation Ben will observe a `0` printed on the screen because x = 0 in the test procedure, the infinite loop is not called because there is no need to call the `(p)` procedure.\\
If the interpreter uses applicative-order evaluation, the test procedure will firstly evaluate the argument and call the infinite loop so the interpreter will be stuck.
