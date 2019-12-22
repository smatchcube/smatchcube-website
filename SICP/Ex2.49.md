---
layout: page
title:  "Exercise 2.49"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a
```scheme
(define outline-frame
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 0))
         (make-segment (make-vect 0 0) (make-vect 0 1))
         (make-segment (make-vect 1 0) (make-vect 1 1))
         (make-segment (make-vect 0 1) (make-vect 1 1)))))
```
# b
```schme
(define x-frame
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 1))
         (make-segment (make-vect 0 1) (make-vect 1 0)))))

```
# c
```scheme
(define diamond-frame
  (segments->painter
   (list (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
         (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
         (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
         (make-segment (make-vect 0 0.5) (make-vect 0.5 0)))))
```
# d
```scheme
(define wave
  (let ((p1 (make-vect 0 0.55)) (p2 (make-vect 0.15 0.4)) (p3 (make-vect 0.29 0.55))
        (p4 (make-vect 0.4 0.47)) (p5 (make-vect 0.14 0)) (p6 (make-vect 0.39 0))
        (p7 (make-vect 0.5 0.25)) (p8 (make-vect 0.6 0)) (p9 (make-vect 0.85 0))
        (p10 (make-vect 0.6 0.45)) (p11 (make-vect 1 0.16)) (p12 (make-vect 1 0.32))
        (p13 (make-vect 0.80 0.62)) (p14 (make-vect 0.6 0.62)) (p15 (make-vect 0.65 0.81))
        (p16 (make-vect 0.62 1)) (p17 (make-vect 0.37 1)) (p18 (make-vect 0.35 0.81))
        (p19 (make-vect 0.4 0.62)) (p20 (make-vect 0.29 0.62)) (p21 (make-vect 0.15 0.57))
        (p22 (make-vect 0 0.78)))   
    (segments->painter
   (list (make-segment p1 p2)
         (make-segment p2 p3)      
         (make-segment p3 p4)
         (make-segment p4 p5)
         (make-segment p6 p7)
         (make-segment p7 p8)
         (make-segment p9 p10)
         (make-segment p10 p11)
         (make-segment p12 p13)
         (make-segment p13 p14)
         (make-segment p14 p15)
         (make-segment p15 p16)
         (make-segment p17 p18)
         (make-segment p18 p19)
         (make-segment p19 p20)
         (make-segment p20 p21)
         (make-segment p21 p22)))))
```
Let's test our new painters to create cool images:

`(square-limit outline-frame 6)`  
![](/images/Ex2.49a.png)

`(square-limit x-frame 6)`  
![](/images/Ex2.49b.png)

`(square-limit diamond-frame 6)`  
![](/images/Ex2.49c.png)

`(square-limit wave 6)`  
![](/images/Ex2.49d.png)
