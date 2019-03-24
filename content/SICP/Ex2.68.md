---
layout: page
title:  "Exercise 2.68"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my `encode-symbol` procedure to encode a symbol.
```scheme
(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (cond ((element-of-set? symbol (symbols left))
               (cons 0 (encode-symbol symbol left)))
              ((element-of-set? symbol (symbols right))
               (cons 1 (encode-symbol symbol right)))
              (else (error "bad symbol: ENCODE-SYMBOL" symbol))))))
```
We can test the procedure to see if we get the correct encoded message:
```scheme
(encode '(A D A B B C A) sample-tree)
; => (0 1 1 0 0 1 0 1 0 1 1 1 0)
```
We can optimize the `encode-symbol` procedure by checking if the symbol is in the global set of symbols then we only need to check the left branch (if the symbol is not in the left branch it means it's in the right branch). Here is my optimization:
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
In most cases this procedure requires less steps.
