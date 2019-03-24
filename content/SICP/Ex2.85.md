---
layout: page
title:  "Exercise 2.85"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We works we the tower of type: `rational -> scheme-number -> complex`\\
Let's just define the `project` operation for complex numbers, it's not really useful to project a real to a rational:
```scheme
(put 'project '(complex)
     (lambda (x) (real-part x)))
(define (project x) (apply-generic 'project x))
```
Now we can define the `drop` procedure, it just project the object until it's no longer equal to the original object (using the `equ?` procedure we defined earlier for the equality test).
```scheme
(define (drop x)
  (let ((proj (get 'project (list (type-tag x)))))
    (display proj)
    (if proj
        (let ((dropped (proj x)))
          (if (equ? dropped x)
              dropped
              x))
        x)))
```
Now we can add call the `drop` procedure just before returning the result in `apply-generic`, we must be careful to not call `drop` when we are using `raise` or `equ?` because they are also generic operations in my implementation and that a raised number should not be dropped. Predicates should also not be droped as they are not tagged in my implementation.
```scheme
(define (apply-generic op . args)
  (define (successive-raising arg1 arg2 op)
    (define (raising-iter lower-type-arg upper-type-arg op)
      (let ((lower-type (type-tag lower-type-arg))
            (upper-type (type-tag upper-type-arg)))
        (if (eq? lower-type upper-type)
            (list op lower-type-arg upper-type-arg)
            (let ((raiser (get 'raise (list lower-type))))
              (if raiser
                  (raising-iter
                   (raise lower-type-arg)
                   upper-type-arg op)
                  false)))))
  (let ((try1 (raising-iter arg1 arg2 op))
        (try2 (raising-iter arg2 arg1 op)))
    (cond (try1 (apply apply-generic try1))
          (try2 (apply apply-generic try2))
          (else (error "No method for these types: APPLY-GENERICS"
                       (list op (list (type-tag arg1) (type-tag arg2))))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (if (or (eq? op 'raise) (eq? op 'equ?) (eq? op '=zero?))
              (apply proc (map contents args))
              (drop (apply proc (map contents args))))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    ((error "No method for these types: APPLY-GENERIC")
                     (list op type-tags))
                    (successive-raising a1 a2 op)))
              (error "No method for these types: APPLY-GENERIC"
                     (list op type-tags)))))))
```
Taking the example from the book, let's add \\(2 + 3i\\) to \\(4 - 3i\\):
```scheme
(add (make-complex-from-real-imag 2 3) (make-complex-from-real-imag 4 -3))
; => 6
```
As expected the result `(complex rectangle 6 . 0)` is simplified to `6`.
