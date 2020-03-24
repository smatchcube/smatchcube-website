---
layout: page
title:  "Exercise 3.11"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Environments created during the evalutation of `((acc 'deposit) 40)`:

![](/images/Ex3.11a.svg){width=650px}

Here E1 is created during the definition of `acc` and E2 and E3 are created during the evaluation of the deposit operation.
<br/>
<br/>
Environments used during the evaluation of `((acc 'withdraw) 60)`:

![](/images/Ex3.11b.svg){width=650px}

<br/>
<br/>
Result environments of evaluating `(define acc2 (make-account 100))`:

![](/images/Ex3.11c.svg){width=650px}

Here each account object has an associated environment so the accounts are kept distinct.
The only part of the environment structure shared between `acc` and `acc2` is the global environment.
