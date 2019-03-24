---
layout: page
title:  "Exercise 1.22"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my procedure for computing primes in a certain range and display the time needed to check their primality.
```scheme
(define (search-for-primes start end)
  (cond ((= start (+ end 1))
         (newline) (display "Done!"))
        (else (timed-prime-test start)
              (search-for-primes (+ start 1) end))))
```
As my computer is more powerful than the average computer of the 90s, i need to check much bigger numbers to be able to measure a difference in run time.
We can recap the results of the procedure in a table:

| **Prime number**|**Factor**|**Time to check in seconds**|
|-----:|:----:|-----:|
\\(100000000003\\)<br/>\\(100000000019\\)<br/>\\(100000000057\\)|\\(10^{11}\\)|\\(0.33\\)
\\(1000000000039\\)<br/>\\(1000000000061\\)<br/>\\(1000000000063\\)|\\(10^{12}\\)|\\(1.01\\)
\\(10000000000037\\)<br/>\\(10000000000051\\)<br/>\\(10000000000099\\)|\\(10^{13}\\)|\\(3.19\\)

\\(\sqrt{10}\approx 3.16\\), \\(\frac{1.00}{0.32}=3.125\\) and \\(\frac{3.16}{1.00}=3.16\\).\\
If a prime is approximately \\(10\\) times bigger than another prime then the time to check this number is approximately \\(\sqrt{10}\\) longer than the other.\\
This is really interesting to see that computers are pretty much working the same way twenty years after (just much faster).
