---
layout: page
title:  "Exercise 3.21"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The interpreter is not aware of the created queue type and how we would like to represent it. All the interpreter see is a list with the first item pointing to the list of elements in the queue and the second item pointing to the last item of the queue.

Here is a procedure to print queues:
```scheme
(define (print-queue q)
  (display (front-ptr q)))
```
It displays the queue as a list with the front of the queue at the beginning.
