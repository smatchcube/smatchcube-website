---
layout: page
title:  "Exercise 2.82"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my code, explanation below.
```scheme
(define (apply-generic op . args)
  (define (list-eq? list)
    (cond ((null? (cdr list)) true)
          ((eq? (car list) (cadr list)) (list-eq? (cdr list)))
          (else false)))
  (define (is-true-list? list)
    (cond ((null? list) true)
          ((car list) (is-true-list? (cdr list)))
          (else false)))
  (define (coercion-list type-tags args op)
    (define (coercion-list-iter before current after args op)
      (let ((before-convert (map (lambda (x) (get-coercion x current)) before))
            (after-convert (map (lambda (x) (get-coercion x current)) after)))
        (let  ((list-conversion (append before-convert
                                        (list (lambda (x) x))
                                        after-convert)))
          (cond ((is-true-list? list-conversion) (apply-generic-coercion-list
                                                  list-conversion
                                                  args
                                                  op))
                ((null? after) (error "No method for these types: APPLY-GENERIC"
                                      (append (list op) before (list current))))
                (else (coercion-list-iter (append before (list current))
                                          (car after)
                                          (cdr after) args op))))))
    (coercion-list-iter '() (car type-tags) (cdr type-tags) args op))
  (define (apply-generic-coercion-list list-conversion args op)
    (define (convert-list-with-converter-list list-converter list-to-be-converted)
      (if (null? list-to-be-converted)
          '()
          (cons ((car list-converter) (car list-to-be-converted))
                (convert-list-with-converter-list (cdr list-converter)
                                                  (cdr list-to-be-converted)))))
    (let ((converted-list (convert-list-with-converter-list list-conversion args)))
      (apply apply-generic op converted-list)))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (cond (proc (apply proc (map contents args)))
            ((list-eq? type-tags) (error "No method for these types: APPLY-GENERIC"
                                         (list op type-tags)))
            (else (coercion-list type-tags args op))))))
```
Explanation: If there is no specific procedure dealing with the corresponding type and the arguments we call `coercion-list`. This procedure will iteratively try to find a type in the list from which every other elements can be converted to, if no such type exist an erro is sent. The `is-true-list?` predicate verify if each conversion procedure exists for every arguments. Then if such a type exist, the list with every conversion procedures is used to convert every elements of the list to the same type. The converted list is then used in the `apply-generic` procedure, now every arguments are of the same type and the dispatch can be successfull, of course if every elements are of the same type coercion is not applied.

We can test our code to see if it works correctly, let's try to add 2 complex numbers and a scheme-number. We need a scheme-number to complex number converter:
```scheme
(define (scheme-number->complex n)
  (make-complex-from-real-imag n 0))
(put-coercion 'scheme-number 'complex scheme-number->complex)
```
And we need to be able to sum three complex numbers:
```scheme
;; inside the complex package
(put 'add3 '(complex complex complex) (lambda (x y z)
     (tag (make-from-real-imag (+ (real-part x) (real-part y) (real-part z))
                          (+ (imag-part x) (imag-part y) (imag-part z))))))
```
Now we can define the generic procedure `add3` to compute the sum of three objects:
```scheme
(define (add3 x y z) (apply-generic 'add3 x y z))
```
And we can finally try a little sum.
```scheme
(add3 (make-complex-from-real-imag 2 3)
      5
      (make-complex-from-real-imag 1 2))
; => (complex rectangular 8 . 5)
```
It works perfectly! We can add different convertors to combine more different objects.
