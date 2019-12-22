---
layout: page
title:  "Exercise 2.32"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (v) (append (list (car s)) v)) rest)))))
```
This works because the power set of a set is the union of the subsets not using one element and the subsets using this element.\\
Here is the mathematical representation of the idea we used in our procedure: \\(\mathcal{P}(\\{x_1,x_2,...,x_n\\})=\mathcal{P}(\\{x_2,x_3,...,x_n\\})\cup \\{x_1\cup X:X\in \mathcal{P}(\\{x_2,x_3,...,x_n\\})\\}\\)
