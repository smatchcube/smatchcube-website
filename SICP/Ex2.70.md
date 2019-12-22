---
layout: page
title:  "Exercise 2.70"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Let's start by defining the lyrics and the associated tree.
```scheme
(define lyrics
  '(Get a job
    Sha na na na na na na na na
    Get a job
    Sha na na na na na na na na
    Wah yip yip yip yip yip yip yip yip yip
    Sha boom))

(define lyrics-tree
  (generate-huffman-tree '((A    2) (GET 2) (SHA 3) (WAH 1)
                           (BOOM 1) (JOB 2) (NA 16) (YIP 9))))
```
As we can see the frequency matches the lyrics so the tree is "perfect" for this message.  
We can verify if the encoding is working by checking if encoding and decoding the message return the original message:
```scheme
(equal? (decode (encode lyrics lyrics-tree) lyrics-tree) lyrics)
; => #t
```
Now let's see the length of the encoded message to see how many bits are required for the lyrics.
```scheme
(length (encode lyrics lyrics-tree))
; => 84
```
If we use a fixed-length, we would need to encode each symbol of the height-symbol alphabet with $\log_2(8)=3$ bits.
```scheme
(length lyrics)
; => 36
```
As there are $36$ symbols in the lyrics we would need $36 \times 3 = 108$ bits to encode the lyrics. We see that using variable-length code saves more than 20% in space in comparison with the fixed-length code.
