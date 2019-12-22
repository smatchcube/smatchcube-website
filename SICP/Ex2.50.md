---
layout: page
title:  "Exercise 2.50"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the `wave` painter for comparison.  
![](/images/Ex2.50.png)
```scheme
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))
```
`(flip-horiz wave)`  
![](/images/Ex2.50a.png)

```scheme
(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 1)
                     (make-vect 1 0)))
```
`(rotate180 wave)`  
![](/images/Ex2.50b.png)

```scheme
(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))
```
`(rotate270 wave)`  
![](/images/Ex2.50c.png)
