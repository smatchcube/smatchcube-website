---
layout: page
title:  "Exercise 2.47"
tags: mit-scheme scheme SICP solution
categories: SICP
---
First implementation:
```scheme
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (caddr f))
```
Second implementation:
```scheme
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (cddr f))
```
