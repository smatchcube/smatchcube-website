---
layout: page
title:  "Exercise 2.60"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The `element-of-set?` procedure is exactly the same, though it's obviously performing worse if there are duplicates in the list.

The `adjoin-set` procedure doesn't have to check if the element is already in the list so the number of steps required by `adjoin-set` is simply \\(\Theta \(1\)\\), with the previous representation the order of growth was \\(\Theta \(n\)\\).
```scheme
(define (adjoin-set x set) (cons x set))
```
The `union-set` procedure is also straightforward, as `adjoin-set` the order of growth is \\(\Theta \(1\)\\) which is way better than the growth with the previous representation which was \\(\Theta \(n^2\)\\). 
```scheme
(define (union-set set1 set2) (append set1 set2))
```
For the `intersection-set` procedure we need to at least check if the elements are in both sets so we need to do a `element-of-set?` check for each element of `set2`, hence with this representation the `intersection-set` procedure is also \\(\Theta \(n^2\)\\). I have transformed the procedure to be iterative so the procedure is now \\(\Theta \(1\)\\) in space compared to \\(\Theta\(n\)\\) in the previous procedure with \\(n\\) the number of elements in the intersection (because the old procedure used `cons` recursively). 
```scheme
(define (intersection-set set1 set2)
  (define (intersection-iter intersection set2-rest)
    (cond ((null? set2-rest) intersection)
          ((element-of-set? (car set2-rest) set1)
           (intersection-iter (cons (car set2-rest) intersection)
                              (cdr set2-rest)))
          (else (intersection-iter intersection (cdr set2-rest)))))
  (intersection-iter '() set2))
```
Even if it's faster to compute `adjoin-set` and `union-set` with this representation I can't really think of applications for which the duplicate representation is better. It may be useful if we are dealing with a lot of union and adjoin operations but that's it. The non-duplicate version is better when dealing with cardinals of sets. 
