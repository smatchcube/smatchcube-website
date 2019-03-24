---
layout: page
title:  "Exercise 2.81"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
With Louis's coercion procedures installed we enter in an infinite loop if we try to call the `exp` procedure on two complex numbers. 
# b.
I think Louis's is not totally wrong, even if `apply-generic` seems to work correctly as it is, we enter in an infinite loop if the procedure does not exist because it will try coercion infinitely.
# c. 
For more precaution we can prevent coercion with arguments of the same type, here is the code for doing that.
```scheme
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get type1 type2))
                      (t2->t1 (get type2 type1)))
                  (cond ((eq? type1 type2)
                         (error "No method for these types")
                                (list op type-tags))
                        (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else (error "No method for these types"
                                     (list op type-tags))))))
              (error "No method for these types: APPLY-GENERIC"
                     (list op type-tags)))))))
```
