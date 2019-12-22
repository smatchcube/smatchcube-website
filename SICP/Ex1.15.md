---
layout: page
title:  "Exercise 1.15"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The `sine` procedure is applied $5$ times because that's the minimum number of times we need to divide $12.15$ by $3$ to get a number smaller than $0.1$.
The number of times the `sine` procedure is applied on an angle $a$ is the smallest positive integer $n$ such that $\left|a \times (1/3)^n \right|< 0.1$, solving this equation we get $n > \log_{3}\left(\frac{|a|}{0.1}\right)$. We can conclude that the `sine` procedure requires approximately $\log_{3}\left(\frac{|a|}{0.1}\right)$ steps, the order of growth in time is logarithmic.

Similarly we can see that the order of growth in space is logarithmic.
