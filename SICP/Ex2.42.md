---
layout: page
title:  "Exercise 2.42"
tags: mit-scheme scheme SICP solution
categories: SICP
---
I chose to represent board positions with a list of integers designing the row of each queen from right to left (queens are added to the left of the list).\\
Here is an example of how I represented the board from Figure 2.8:\\
![](/images/Ex2.42.svg ){: .center-image .medium-margin}
Representation of the above board position: `(6 2 7 1 4 8 5 3)`
```scheme
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board nil)

(define (safe? k positions)
  (let ((current-row (car positions)))
    (define (iter positions-remaining number-column-left)
      (cond ((null? positions-remaining) true)
            ((or (= current-row (car positions-remaining))
                 (= (abs (- current-row (car positions-remaining)))
                    (abs (- k number-column-left))))
             false)
            (else (iter (cdr positions-remaining)
                        (- number-column-left 1)))))
    (iter (cdr positions) (- k 1))))
```
