---
layout: page
title:  "Exercise 2.52"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a
I added some segments to my `wave` painter to add a smile.
```scheme
(define wave
  (let ((p1 (make-vect 0 0.55)) (p2 (make-vect 0.15 0.4)) (p3 (make-vect 0.29 0.55))
        (p4 (make-vect 0.4 0.47)) (p5 (make-vect 0.14 0)) (p6 (make-vect 0.39 0))
        (p7 (make-vect 0.5 0.25)) (p8 (make-vect 0.6 0)) (p9 (make-vect 0.85 0))
        (p10 (make-vect 0.6 0.45)) (p11 (make-vect 1 0.16)) (p12 (make-vect 1 0.32))
        (p13 (make-vect 0.80 0.62)) (p14 (make-vect 0.6 0.62)) (p15 (make-vect 0.65 0.81))
        (p16 (make-vect 0.62 1)) (p17 (make-vect 0.37 1)) (p18 (make-vect 0.35 0.81))
        (p19 (make-vect 0.4 0.62)) (p20 (make-vect 0.29 0.62)) (p21 (make-vect 0.15 0.57))
        (p22 (make-vect 0 0.78))  (p23 (make-vect 0.43 0.73)) (p24 (make-vect 0.45 0.70))
        (p25 (make-vect 0.55 0.70)) (p26 (make-vect 0.57 0.73)))  
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
         (make-segment p21 p22)
         (make-segment p23 p24)
         (make-segment p24 p25)
         (make-segment p25 p26)))))
```
`wave`\\
![](/assets/Ex2.52a.png)
# b
I changed `corner-split` to have only one copy of the `up-split` and `right-split` instead of two.
```scheme
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner))))))
```
`(corner-split wave 4)`\\
![](/assets/Ex2.52b.png)

# c
I changed the orientation of the four images.
```scheme
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split (flip-horiz painter) n))))
```
Here is the `square-limit` after changing some changes at the three different levels.\\
`(square-limit wave 3)`\\
![](/assets/Ex2.52c.png)

For comparison here is the old result for the same painter before the modifications:\\
![](/assets/Ex2.52d.png)
