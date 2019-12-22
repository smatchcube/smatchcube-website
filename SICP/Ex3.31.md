---
layout: page
title:  "Exercise 3.31"
tags: mit-scheme scheme SICP solution
categories: SICP
---
If we don't call the procedure during the creation of our gates the initial state of our digital circuit will be wrong.

Let's see how this can lead to bad results with the example of the half-adder.

![](/assets/Ex3.31.svg){width=650px}

Suppose we have these wires:
```scheme
(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))
```

We monitor the wires `e` and `c`:
```scheme
(probe 's s)
(probe 'e e)
```

We create the half-adder:
```scheme
(or-gate a b d)
(and-gate a b c)
(inverter c e)
(and-gate d e s)
```

Then we start the simulation with `(propagate)` with all signals set to 0 (default value). This message is printed:
```scheme
e 2 New-value = 1
```

We see that the signal of wire `e` is correctly set to `1` because the `invert-output` procedure was called when we created the inverter.

If we now set the signal `a` to `1` we get the desired output:
```scheme
(set-signal! a 1)

(propagate)
```
The printed result is `s 13 New-value = 1` because setting signal of wire `a` to `1` triggered the or-gate then the end-gate resulting in setting the signal of wire `s` to `1`. 

Now let's suppose that `accept-action-procedure!` was defined as
```scheme
(define (accept-action-procedure! proc)
  (set! action-procedures
        (cons proc action-procedures)))
```
Then when the inverter was created the `invert-output` procedure would not be called and the signal of wire `e` would not be set to `1` as intended. The initial state of the circuit would be wrong so setting the signal of wire `a` to `1` as we did would not result in signal of wire `s` to change to `1`.
