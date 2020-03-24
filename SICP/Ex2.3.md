---
layout: page
title:  "Exercise 2.3"
tags: mit-scheme scheme SICP solution
categories: SICP
---
My first representation define a rectangle as a point with two vectors as described in the image.
![](/images/Ex2.3a.svg){height=450px}
```scheme
(define (make-rectangle px py v1x v1y v2x v2y)
  (cons (make-point px py)
        (cons (make-vector v1x v1y)
              (make-vector v2x v2y))))

(define (p rectangle) (car rectangle))
(define (v1 rectangle) (car (cdr rectangle)))
(define (v2 rectangle) (cdr (cdr rectangle)))
```
I used vectors from \\(\mathbb{R}^2\\) for my definition of a rectangle so i need to write the constructor and the selectors needed.
```scheme
(define (make-vector x y) (cons x y))

(define (x-vector v) (car v))
(define (y-vector v) (cdr v))
```
We can represent the data structure of a rectangle with the box-and-pointer notation.
![](/images/Ex2.3b.svg){height=350px}

Now we can define a procedure to compute the norm of the vectors and one procedure to directly find the length and the width of a rectangle.
```scheme
(define (vector-norm v)
  (sqrt (+ (square (x-vector v))
           (square (y-vector v)))))

(define (length rectangle)
  (vector-norm (v1 rectangle)))
(define (width rectangle)
  (vector-norm (v2 rectangle)))
```
We can finally write the procedures to find the perimeter and the area of a rectangle.
```scheme
(define (area rectangle)
  (* (length rectangle)
     (width rectangle)))

(define (perimeter rectangle)
  (* (+ (length rectangle)
        (width rectangle))
     2))
```
The second way of representing a rectangle is with three points (in clockwise or counterclockwise order). This representation is less elegant in my opinion so I will not explain it as my first representation.

So for this representation we need a new constructor and new selectors for our rectangles.
```scheme
(define (make-rectangle p1x p1y p2x p2y p3x p3y)
  (cons (make-point p1x p1y)
        (cons (make-point p2x p2y)
              (make-point p3x p3y))))

(define (p1 rectangle) (car rectangle))
(define (p2 rectangle) (car (cdr rectangle)))
(define (p3 rectangle) (cdr (cdr rectangle)))
```
Now we need to change the `length` and `width` procedures according to the new representation, I choose to use my already defined `vector-norm`.
```scheme
(define (make-vector-from-points p1 p2)
  (make-vector (abs (- (x-point p1) (x-point p2)))
               (abs (- (y-point p1) (y-point p2)))))

(define (length rectangle)
  (let ((v1 (make-vector-from-points (p1 rectangle) (p2 rectangle))))
    (vector-norm v1)))

(define (width rectangle)
  (let ((v2 (make-vector-from-points (p2 rectangle) (p3 rectangle))))
    (vector-norm v2)))
```
And now we can define the perimeter and the area.
```scheme
(define (area rectangle)
  (* (length rectangle)
     (width rectangle)))

(define (perimeter rectangle)
  (* (+ (length rectangle)
        (width rectangle))
     2))
```
As you can see these two last procedures are the same as the `area` and `perimeter` used in the first representation of a rectangle because we used different layers of abstractions.
