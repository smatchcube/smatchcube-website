---
layout: page
title:  "Exercise 2.11"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Warning: sorry for the mess, my solution is really ugly.\\
My solution just compute the multiplications needed depending of the signs of the endpoints of the intervals.\\
Note that some cases are impossibles and not tested (when the lower bound is greater than the upper bound).
```scheme
(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (if (negative? x1)
        (if (negative? x2)
            (if (negative? y1)
                (if (negative? y2)
                    (make-interval (* x2 y2)
                                   (* x1 y1))
                    (make-interval (* x1 y2)
                                   (* x1 y1)))
                (make-interval (* x1 y2)
                               (* x2 y1)))
            (if (negative? y1)
                (if (negative? y2)
                    (make-interval (* x2 y1)
                                   (* x1 y1))
                    (make-interval (min (* x1 y2)
                                        (* x2 y1))
                                   (max (* x1 y1)
                                        (* x2 y2))))
                (make-interval (* x1 y2)
                               (* x2 y2))))
        (if (negative? y1)
            (if (negative? y2)
                (make-interval (* x2 y1)
                               (* x1 y2))
                (make-interval (* x2 y1)
                               (* x2 y2)))
            (make-interval (* x1 y1)
                           (* x2 y2))))))
```
