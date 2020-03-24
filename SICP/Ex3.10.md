---
layout: page
title:  "Exercise 3.10"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Result of defining `make-withdraw` in the global environment:

![](/images/Ex3.10a.svg){width=650px}

<br/>
<br/>
Result of evaluating `(define W1 (make-withdraw 100))`:

![](/images/Ex3.10b.svg){width=650px}

The two versions of `make-withdraw` create objects with the same behavior, the body of the `W2` procedure is exactly the same with both versions. The difference comes from the environment structures, the new version uses two frames linked to together to the global environment when the old version used only one frame.

Environments created by applying the procedure object `W1` with argument `50`:

![](/images/Ex3.10c.svg){width=650px}
<br/>
<br/>
Environments after the call to `W1`:

![](/images/Ex3.10d.svg){width=650px}

Result of evaluating `(define W2 (make-withdraw 100))`:
<br/>
<br/>
![](/images/Ex3.10e.svg){width=650px}
