---
layout: page
title:  "Exercise 1.5"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Firstly, the first line define an infinite loop because the procedure `p` calls itself ad infinitum.  
If the interpreter uses normal-order evaluation Ben will observe a `0` printed on the screen because x = 0 in the `test` procedure. The infinite loop is not called because there is no need to evaluate the argument `(p)`.  
If the interpreter uses applicative-order evaluation, the `test` procedure will start evaluating the arguments and call the infinite loop so the interpreter will be stuck.
