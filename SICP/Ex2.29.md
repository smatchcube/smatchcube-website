---
layout: page
title:  "Exercise 2.29"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
```scheme
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))
```
# b.
```scheme
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
        (total-weight structure)
        structure)))
```
# c.
```scheme
(define (mobile-balanced? mobile)
  (let ((l-branch (left-branch mobile))
        (r-branch (right-branch mobile)))
    (and (= (* (branch-length l-branch) (branch-weight l-branch))
            (* (branch-length r-branch) (branch-weight r-branch)))
         (branch-balanced? l-branch)
         (branch-balanced? r-branch))))

(define (branch-balanced? branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
        (mobile-balanced? structure)
        true)))
```
# d.
Thanks to abstraction we only need to change some selectors.
```scheme
(define (right-branch mobile)
  (cdr mobile)) ; cdr instead of cadr

(define (branch-structure branch)
  (cdr branch)) ; cdr instead of cadr
```
