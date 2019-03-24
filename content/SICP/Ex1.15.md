---
layout: page
title:  "Exercise 1.15"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The number of times the `sine` procedure is applied is \\(5\\) because \\(12.15 \times (1/3)^4=0.15>0.1\\) and \\(12.15\times(1/3)^5=0.05<0.1\\) (the angle is divided by \\(3\\) each time the function is applied).
The number of times the `sine` procedure is applied on an angle \\(a\\) is the integer \\(n\\) such that \\(a \times (1/3)^n < 0.1\\) and the solution is the logarithm of \\(0.1/a\\) in base \\(1/3\\) (the answer is the ceiling of that logarithm to be exact).
So this procedure has an order of growth of \\(\Theta(\lceil \log_{1/3}{(3)} \rceil)\\) in time if I'm not wrong.

As explain later in the book, it's quite useless to have a really precise idea of the order of growth so we can simply say that the order of growth in time of the `sine` procedure is \\(\Theta(\log(n))\\).
The order of growth in space is \\(\Theta(n)\\).
