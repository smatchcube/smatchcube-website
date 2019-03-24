---
layout: page
title:  "Exercise 2.15"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Yes she is right, `par2` is better because it does not reuse a interval.\\
As also explained in my answer of the previous exercise, Alicia's system does not take into account whether some intervals in the formula are linked or not.\\
Alicia's system treat independently each interval, the procedures are not aware of each dependency between the intervals and it leads to serious problems.
