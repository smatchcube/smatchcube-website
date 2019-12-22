---
layout: page
title:  "Exercise 2.44"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
```
