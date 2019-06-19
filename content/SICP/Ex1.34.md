---
layout: page
title:  "Exercise 1.34"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Using the substitution model we can see that `(f f)` will evaluates `(f 2)` which will evaluates `(2 2)`. As `2` is not a valid procedure, we have an error:
```scheme
(f f)
;The object 2 is not applicable.
```