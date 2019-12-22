---
layout: page
title:  "Exercise 3.32"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Using a queue (first in, first out) instead of a list (first in, last out) structure to store our events ensure that the correct state is propagated.

For example suppose we have an and-gate with input $A=0$ and $B=1$ and at a certain time both inputs $A$ and $B$ change value. Suppose our simulation change $A$ to $1$ first then $B$ to $0$ (during the same simulation time segment). Both these changes of state will add a procedure to the agenda. When $A$ is set to $1$ a procedure telling to change the output to $1$ is added to the agenda (because both $A$ and $B$ equal $1$ during evaluation). Then $B$ change to $1$ a procedure telling to change the output to $0$ is added to the agenda. As you can see the last procedure added to the agenda gives us the correct value the output should change to. Hence we need to use a queue (first in, first out) to get the correct state at the end of each time segment.

Such pitfalls arise when mutating objects at the same simulation time.
