---
layout: page
title:  "Exercise 2.75"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (make-from-mag-ang m a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) m)
          ((eq? op 'angle) a)
          ((eq? op 'real-part)
           (* (cos a) m))
          ((eq? op 'imag-part)
           (* (sin a) m))
          (else (error "Unknown op:
                        MAKE-FROM-MAG-ANG" op))))
  dispatch)
```
