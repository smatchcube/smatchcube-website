---
layout: page
title:  "Exercise 1.13"
tags: mit-scheme scheme SICP solution
categories: SICP
---
### Proof that $\text{Fib}(n)$ is the closest integer to $\varphi^n/\sqrt{5}$.

$\varphi=\frac{1+\sqrt{5}}{2}$ and $\psi=\frac{1-\sqrt{5}}{2}$  
Let's begin to prove that $\text{Fib}(n)=(\varphi^n - \psi^n)/\sqrt{5}$ by induction.

$\text{P}(n):\quad \text{Fib}(n)=(\varphi^n - \psi^n)/\sqrt{5}$

**Base case**:

$\text{P}(n)$ is easily seen to be true for $n=0$ and $n=1$:  
$\text{Fib}(0)=0$ by definition and $(\varphi^0 - \psi^0)/\sqrt{5}=0$  
$\text{Fib}(1)=1$ by definition and $(\varphi^1 - \psi^1)/\sqrt{5}=1$  

**Inductive step**: Show that if $\text{P}(k)$ and $\text{P}(k+1)$ holds, then also $\text{P}(k+2)$ holds. This can be done as follows.

$$\begin{align}\text{Fib}(k+2) & =\text{Fib}(k+1)+\text{Fib}(k)\quad \text{, by definition of the Fibonacci numbers.} \newline
& = \frac{\varphi^{k+1} - \psi^{k+1}}{\sqrt{5}}+\frac{\varphi^k - \psi^k}{\sqrt{5}} \newline
& = \frac{\varphi^{k+1} + \varphi^k - (\psi^{k+1}+\psi^k)}{\sqrt{5}}
\end{align}$$


Keeping in mind that $\varphi^2=\varphi+1$, we show that:  
$$\varphi^{k+1}+\varphi^k=\varphi^k(\varphi+1)=\varphi^k\varphi^2=\varphi^{k+2}$$
As $\psi=\varphi-\sqrt{5}$, we see that:  
$$\begin{align}\psi^{k+1}+\psi^k&=\psi^k(\psi+1)\newline
&=\psi^k(\varphi+1-\sqrt{5})\newline
&=\psi^k(\varphi^2-\sqrt{5})\newline
&=\psi^k((\psi+\sqrt{5})^2-\sqrt{5})\newline
&=\psi^k(\psi^2+2\psi\sqrt{5}+5-\sqrt{5})\newline
&=\psi^k\psi^2\newline
&=\psi^{k+2}
\end{align}$$

So now we have:  
$$\text{Fib}(k+2)=\frac{\varphi^{k+2}-\psi^{k+2}}{\sqrt{5}}$$

Since both the base case and the inductive step have been performed, by mathematical induction the statement $\text{P}(n)$ holds for all natural numbers $n$.

As $\left | \frac{\psi^n}{\sqrt{5}} \right | < \frac{1}{2}$ for $n\geq 0$, we finally know that $\text{Fib}(n)$ is the closest integer to $\varphi^n/\sqrt{5}$. $\blacksquare$
