---
layout: page
title:  "Exercise 1.35"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We need to verify that $1 + 1/\varphi = \varphi$.

$\varphi = \frac{1 + \sqrt{5}}{2}$ by definition (as described in Section 1.2.2).

Therefore we have, $$\begin{align}
1+1/\varphi &= 1 + \frac{1}{\frac{1+\sqrt{5}}{2}}\newline &= 1 + \frac{2}{1+\sqrt{5}}\newline&=1+\frac{2}{1+\sqrt{5}}\cdot \frac{1-\sqrt 5}{1-\sqrt 5}\newline &= 1 + \frac{\sqrt 5 - 1}{2}\newline&=\frac{1+\sqrt{5}}{2}\newline&=\varphi 
\end{align}$$
```scheme
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.6)
; => 1.6180327868852458
```