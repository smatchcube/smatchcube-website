---
layout: page
title:  "Exercise 2.25"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is how to extract 7:
```scheme
(define first-list (list 1 3 (list 5 7) 9)) ; (1 3 (5 7) 9)
(car (cdr (car (cdr (cdr first-list))))) ; 7

(define second-list (list (list 7))) ; ((7))
(car (car second-list)) ; 7

(define third-list
  (list 1
        (list 2
              (list 3
                    (list 4
                          (list 5
                                (list 6 
                                      7))))))) ; (1 (2 (3 (4 (5 (6 7))))))
(cadr (cadr (cadr (cadr (cadr (cadr third-list)))))) ; 7
``` 
