---
layout: page
title:  "Exercise 3.6"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define rand
  (let ((x 564568412687412)) ; set the default seed 
    (lambda (m)
      (cond ((eq? m 'generate) (set! x (rand-update x)) x)
            ((eq? m 'reset) (lambda (new-value) (set! x new-value)))
            (else (error "Unknow request: RAND" m))))))
```
We need to create the `rand-update` procedure to test if our solution works, we will follow the footnote 6 to write such a procedure. This is called a linear congruential generator.
```scheme
(define (rand-update x)
  ;; value used by Knuth, we will trust him
  (remainder (+ (* 6364136223846793005 x)
                1442695040888963407)
             18446744073709551616))
```
Let's see if everything work as expected:
```scheme
(define seed 849435216543568)

((rand 'reset) seed)
(rand 'generate)
; => 7312519740415644255
(rand 'generate)
; => 14028490350542609666
(rand 'generate)
; => 9268857025530681513

((rand 'reset) seed)
(rand 'generate)
; => 7312519740415644255
(rand 'generate)
; => 14028490350542609666
(rand 'generate)
; => 9268857025530681513
```
As expected the sequence of pseudo-random numbers is exactly the same if we use the same initial value (seed).
