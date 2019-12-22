---
layout: page
title:  "Exercise 3.34"
tags: mit-scheme scheme SICP solution
categories: SICP
---
`multiplier` needs to know two values to deduce the third one. In the case of `(mutliplier a a b)`, if `b` has a value we could compute the value of `a` but `multiplier` is not aware that the first two operands refer to the same variable hence the square root is not found. Louis `squarer` procedure would not work as expected.
