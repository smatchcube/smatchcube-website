---
layout: page
title:  "Exercise 1.6"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The program will enter in an infinite recursive loop because `new-if` will call `sqrt-iter` which will call the `new-if` procedure and so on.  
Keep in mind that our interpreter uses applicative-order evaluation.
This is why the `if` function can not be rewritten as a procedure here.
