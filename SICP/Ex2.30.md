---
layout: page
title:  "Exercise 2.30"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))
```
