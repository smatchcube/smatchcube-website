---
layout: page
title:  "Exercise 2.64"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
The `partial-tree` procedure take an ordered list of element and the size of this list as arguments. At the beginning, if there are arguments, the procedure split the list of element in two lists, one list for the left branch, another one for the right branch and the element in the middle of the list is kept (the entry). The procedure calls itself to compute the left and right branches. At the end a pair is returned, the car is a tree constructed with the entry and both branches, the cdr is the elements remaining.

Here is the tree produced by `list->tree` for the list `(1 3 5 7 9 11)`.
![](/images/Ex2.64.svg){height=350px}

# b.
The procedure requires $n$ steps as the procedure is called for each node.
