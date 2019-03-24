---
layout: page
title:  "Exercise 2.31"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))
```
