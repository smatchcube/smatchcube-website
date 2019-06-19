---
layout: page
title:  "Exercise 1.26"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The `square` procedure takes a variable already computed and square this value. Using a multiplication instead of the `square` procedure tells the program to compute two times the `expmod` value. Thus we loose the advantage of divising by two the steps needed at each recusrsive call to `expmod`, transforming our $\Theta(\log{n})$ process in a $\Theta(n)$ process.
