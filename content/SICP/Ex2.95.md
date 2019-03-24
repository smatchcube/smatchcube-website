---
layout: page
title:  "Exercise 2.95"
tags: mit-scheme scheme SICP solution
categories: SICP
---
```scheme
;; definition of P1, P2, P3
(define P1 (make-polynomial 'x '((2 1) (1 -2) (0 1))))
(define P2 (make-polynomial 'x '((2 11) (0 7))))
(define P3 (make-polynomial 'x '((1 13) (0 5))))

(define Q1 (mul P1 P2))
(define Q2 (mul P1 p3))

(greatest-common-divisor Q1 Q2)
; => (polynomial x (2 1458/169) (1 -2916/169) (0 1458/169))
```
Indeed the result is not the same as \\(P_1\\). \\
Let's trace the GCD algorithm for \\(Q_1\\) and \\(Q_2\\):
```scheme
(greatest-common-divisor Q1 Q2)

(gcd-terms '((4 11) (3 -22) (2 18) (1 -14) (0 7))
           '((3 13) (2 -21) (1 3) (0 5)))

(gcd-terms '((3 13) (2 -21) (1 3) (0 5))
           (remainder-terms '((4 11) (3 -22) (2 18) (1 -14) (0 7))
                            '((3 13) (2 -21) (1 3) (0 5))))
```
Now we can compute the `remainder-terms` by hand and we quickly see that the first coefficient of the quotient is \\(\frac{11}{13}\\), this is not an integer and we can see that the remainder is not a polynomial with integer coefficients breaking the GCD algorithm.\\
I just learned from the [documentation](https://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user/index.html "mit-scheme online documentation") that mit-scheme has a `trace` procedure built in. We just need to add `(trace gcd-terms)` to display the calls of `gcd-terms`, the arguments used and the returned value.\\
Here is the complete trace of the `gcd-terms` procedure.
```scheme
[Entering #[compound-procedure 49 gcd-terms]
    Args: ((4 11) (3 -22) (2 18) (1 -14) (0 7))
          ((3 13) (2 -21) (1 3) (0 5))]
[Entering #[compound-procedure 49 gcd-terms]
    Args: ((3 13) (2 -21) (1 3) (0 5))
          ((2 1458/169) (1 -2916/169) (0 1458/169))]
[Entering #[compound-procedure 49 gcd-terms]
    Args: ((2 1458/169) (1 -2916/169) (0 1458/169))
          ()]
[((2 1458/169) (1 -2916/169) (0 1458/169))
      <== #[compound-procedure 49 gcd-terms]
    Args: ((2 1458/169) (1 -2916/169) (0 1458/169))
          ()]
[((2 1458/169) (1 -2916/169) (0 1458/169))
      <== #[compound-procedure 49 gcd-terms]
    Args: ((3 13) (2 -21) (1 3) (0 5))
          ((2 1458/169) (1 -2916/169) (0 1458/169))]
[((2 1458/169) (1 -2916/169) (0 1458/169))
      <== #[compound-procedure 49 gcd-terms]
    Args: ((4 11) (3 -22) (2 18) (1 -14) (0 7))
          ((3 13) (2 -21) (1 3) (0 5))]
```
After a quick check in the book I can see that tracing is only concretely defined in the part 5.2.4. I feel like the `trace` procedure should be explained earlier in the book, debugging skills are really important and it can really help solving complex exercises.\\
You can learn more about the `trace` procedure [here](https://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user/Advising-Procedures.html#Advising-Procedures "Advising-Procedures").
