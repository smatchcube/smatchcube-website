---
layout: page
title:  "Exercise 2.51"
tags: mit-scheme scheme SICP solution
categories: SICP
---
First implementation:
```scheme
(define (below painter1 painter2) 
  (let ((paint-bottom
         (transform-painter
          painter1
          (make-vect 0.0 0.0)
          (make-vect 1.0 0.0)
          (make-vect 0.0 0.5)))
        (paint-top
         (transform-painter
          painter2
          (make-vect 0.0 0.5)
          (make-vect 1.0 0.5)
          (make-vect 0.0 1.0))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-top frame))))
```
Second implementation:
```scheme
(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))
```

Result:  
`(below wave (rotate90 wave))`  
![](/images/Ex2.51.png)
