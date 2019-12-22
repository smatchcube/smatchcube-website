---
layout: page
title:  "Exercise 2.84"
tags: mit-scheme scheme SICP solution
categories: SICP
---
For simplicity let's solve the case where we have only two arguments.
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
          (else (error "No method for these types: APPLY-GENERIC"
                       (list op (list (type-tag arg1) (type-tag arg2))))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
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
Explanation:\\
If the args are not of the same type we call `successive-raising`. This procedure try to "convert" the first argument to the second argument and vice versa. If one of the two conversion is successful the `apply-generic` procedure is then called on the converted arguments, if no conversion is successful an error is returned.

Now we can do operations like adding a rational number with a complex number:
```scheme
;; evaluation of (3/1) + (1+1i)
(add (make-rational 3 1) (make-complex-from-real-imag 1 1))
; => (complex rectangular 4 1)
```
During the evaluation the rational number is transformed to a scheme-number and then to a complex number which is the same type of the second argument: the `add` procedure can be finally applied.
