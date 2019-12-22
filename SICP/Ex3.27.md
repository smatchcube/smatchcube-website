---
layout: page
title:  "Exercise 3.27"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the environment structure with `memo-fib` defined:

![](/assets/Ex3.27a.svg){width=650px}

<br/>
Here is the environment structure during the call of `(memo-fib 3)`, when the procedure is checking if `(memo-fib 3)` has already been computed.

![](/assets/Ex3.27b.svg){width=650px}

Following the environment structure model we can see how memoization is working. The environment structure is changing with time (mutation and new frames) so you need to follow the steps to actually understand everything.

It's also easy to see how `memo-fib` computes the $n$^th^ Fibonacci number in a number of steps proportional to $n$. When calling `(memo-fib n)` it will recursively call itself, storing the result of `memo-fib` and hence only really computing up to $n$ Fibonacci numbers.

Notice how `memo-fib` calls `memo-fib` recursively, on the contrary if we define `memo-fib` to be `(memoize fib)` the memoization will not works as intended because `fib` will be called instead of `memo-fib` during the recursive step and memoization will be lost.
