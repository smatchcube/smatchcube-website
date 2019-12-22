---
layout: page
title:  "Exercise 2.36"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init
                        (accumulate (lambda (x y) (cons (car x) y))
                                    nil seqs))
            (accumulate-n op init (map cdr seqs)))))
```
