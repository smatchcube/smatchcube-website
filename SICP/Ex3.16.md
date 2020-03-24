---
layout: page
title:  "Exercise 3.16"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
(define x (list 'a 'b 'c))
(count-pairs x)
; => 3
```
![](/images/Ex3.16a.svg){width=650px}

<br/>
```scheme
(define y (list 'a 'b 'c))
(set-car! y (cddr y))
(count-pairs y)
; => 4
```
![](/images/Ex3.16b.svg){width=650px}

<br/>
```scheme
(define z (list 'a 'b 'c))
(set-car! z (cdr z))
(set-car! (cdr z) (cddr z))
(count-pairs z)
; => 7
```
![](/images/Ex3.16c.svg){width=650px}

<br/>
```scheme
(define w (list 'a 'b 'c))
(set-car! (cddr w) w)
(count-pairs w) ;; infinite loop
```
![](/images/Ex3.16d.svg){width=650px}
