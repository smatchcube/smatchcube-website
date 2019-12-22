---
layout: page
title:  "Exercise 2.43"
tags: mit-scheme scheme SICP solution
categories: SICP
---
**Note** : *my solution may be extremely wrong as comparing the times doesn't give expected ratios, maybe because the `safe?` procedure takes more time when as the number of queens on the board increase. This question is not trivial. My analyze may not be 100% false though, `queen-cols` is called too many times.*


  The original `queens` procedure calls `queen-cols` only \\(n+1\\) times. Louis's procedure calls the `queen-cols` procedure for both each `new-row` and each column, hence for a board of size \\(n\\) the procedure `queen-cols` is called \\(n^n\\) times in contrary to only \\(n+1\\) times from the original procedure.\\
  So if the original procedure solves the puzzle in time \\(T\\), Louis's procedure may solves the puzzle in approximately time \\(T^T\\).
