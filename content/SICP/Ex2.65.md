---
layout: page
title:  "Exercise 2.65"
tags: mit-scheme scheme SICP solution
categories: SICP
---
My solution is to transform trees in ordered lists, apply reunion or intersection and then transform the ordered list in the tree format. As we already wrote theses procedures this is straightforward, theses procedures are all \\(\Theta\(n\)\\) so `union-set` and `intersection-set` are also \\(\Theta\(n\)\\).
```scheme
(define (union-set set1 set2)
  (define (union-set-list set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else (let ((x1 (car set1))
                      (x2 (car set2)))
                  (cond ((= x1 x2) (cons x1 (union-set-list (cdr set1) (cdr set2))))
                        ((< x1 x2) (cons x1 (union-set-list (cdr set1) set2)))
                        (else (cons x2 (union-set-list set1 (cdr set2)))))))))
  (list->tree (union-set-list (tree->list-2 set1)
                              (tree->list-2 set2))))

(define (intersection-set set1 set2)
  (define (intersection-set-list set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2)
                 (cons x1 (intersection-set-list (cdr set1)
                                            (cdr set2))))
                ((< x1 x2)
                 (intersection-set-list (cdr set1) set2))
                ((< x2 x1)
                 (intersection-set-list set1 (cdr set2)))))))
  (list->tree (intersection-set-list (tree->list-2 set1)
                                     (tree->list-2 set2))))
```
