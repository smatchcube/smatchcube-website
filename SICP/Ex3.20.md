---
layout: page
title:  "Exercise 3.20"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is the environment structure after defining `x` and `z`:

![](/assets/Ex3.20a.svg){width=650px}

Evaluation of `(set-car! (cdr z) 17)`:

`E3` is created during the call of `set-car!` then the arguments must be evaluated. `(cdr z)` is evaluated in `E4` using passing-message style creating `E5`. After evaluating the arguments the `'set-car!` message is passed in `E6` and the `set!` procedure is called to change the value to `17`.

![](/assets/Ex3.20b.svg){width=750px}

<br/>
<br/>
Here is the environment structure after the call of `(set-car! (cdr z) 17)`. It's easy to see that `(car x)` returns `17`.

![](/assets/Ex3.20c.svg){width=650px}
