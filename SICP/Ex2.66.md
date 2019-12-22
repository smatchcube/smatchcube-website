---
layout: page
title:  "Exercise 2.66"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Here is my solution:
```scheme
(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((current-record (car set-of-records)))
        (cond ((= given-key (key current-record)) current-record)
              ((< given-key (key current-record))
               (lookup given-key (left-branch set-of-records)))
              ((> given-key (key current-record))
               (lookup given-key (right-branch set-of-records)))))))
```
As an example to how we can use this procedure, let's represent records as a pair of a key and a name.
```scheme
(define r1 '(4 . "Lucas"))
(define r2 '(7 . "Theo"))
(define r3 '(9 . "Paul"))
(define records (list r2 (list r1 '() '()) (list r3 '() '())))

(define key car)
```
Now for example if we call `(lookup 4 records)` we get `(4 . "Lucas")` as intended. If no records have the desired key the returned value is `#f` (false). We could easily implement procedures to return only the name of a record from a given key, the possibilities are endless with this convenient representation.
