---
layout: page
title:  "Exercise 2.17"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
```
