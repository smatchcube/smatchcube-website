---
layout: page
title:  "Exercise 2.72"
tags: mit-scheme scheme SICP solution
categories: SICP
---
This kind of question is really difficult, my answer is a big approximation.\\
We will give the order of growth in the case the tree is shaped as in the previous exercise.\\
The answer is dependent of my `encode-symbol` procedure so here is mine:
```scheme
(define (encode-symbol symbol tree)
  (define (encode-symbol-checking-only-left symbol tree)
    (if (leaf? tree)
        '()
        (let ((left (left-branch tree))
              (right (right-branch tree)))
          (if (element-of-set? symbol (symbols left))
              (cons 0 (encode-symbol-checking-only-left symbol left))
              (cons 1 (encode-symbol-checking-only-left symbol right))))))
  (if (element-of-set? symbol (symbols tree))
      (encode-symbol-checking-only-left symbol tree)
      (error "bad symbol: ENCODE-SYMBOL" symbol)))
```
For the most frequent element we only need to check in the element is in the tree and if the first left branch contain the most frequent element so the order of grow of the number of steps needed to encode the most frequent element is \\(\Theta\(n\)\\) (for checking if the element is in the "alphabet").\\
For the least frequent element the order of growth is also \\(\Theta\(n\)\\) (but requiring two times more steps than for the most frequent element) because we need to check if the element is in the tree and then traverse the tree of depth \\(n\\) checking if the element is in the left branch containing each time only one element.\\
My `encode-symbol` procedure is really optimized for this kind of tree.
