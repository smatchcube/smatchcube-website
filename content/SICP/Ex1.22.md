---
layout: page
title:  "Exercise 1.22"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my procedure for computing primes in a certain range and display the time needed to check their primality.
```scheme
(define (search-for-primes lower upper)
  (cond ((> lower upper) (newline) (display "Done"))
	((even? lower) (search-for-primes (+ lower 1) upper))
	(else (timed-prime-test lower)
	      (search-for-primes (+ lower 2) upper))))
```
As my computer is way more powerful than the average computer of the 90s, i need to check much bigger primes to be able to measure a significant time duration.

We can recap the results of the procedure in a table:

| Prime number | Power of ten | Average time to check (seconds) |
|----------------:|:--------:|---------------------------:|
|$100000000003$<br/>$100000000019$<br/>$100000000057$|$10^{11}$|$0.39$
|$1000000000039$<br/>$1000000000061$<br/>$1000000000063$|$10^{12}$|$1.23$
|$10000000000037$<br/>$10000000000051$<br/>$10000000000099$|$10^{13}$|$3.86$
|$100000000000031$<br/>$100000000000067$<br/>$100000000000097$|$10^{14}$|$12.22$

Table: Time to check for primality

$\sqrt{10}\approx 3.16$, $\frac{1.23}{0.39}\approx 3.15$, $\frac{3.86}{1.23}\approx 3.14$ and $\frac{12.22}{3.86}\approx 3.17$.

If a prime is approximately $10$ times bigger than another prime then the time to check this number is approximately $\sqrt{10}$ times longer than the other.