---
layout: page
title:  "Exercise 2.74"
tags: mit-scheme scheme SICP solution
categories: SICP
---
# a.
```scheme
(define (get-record employee-name personnel-file)
  ((get 'get-record (type-tag personnel-file))
   employee-name
   (contents personnel-file)))
```
The individual divisions files must be tagged the same way and use the same order for the arguments.
# b.
```scheme
(define (get-salary employee-name personnel-file)
  ((get 'get-salary (type-tag record-file))
   (get-record (contents record-file)))
```
In order to works, the records must also be tagged.
# c.
I chose that if a lookup ended with no results, the returned value is `#f` (false), as anything else is considered true we can easily implement an iterative procedure to search a record in every divisions's files.
```scheme
(define (find-enployee-record employee-name list-of-divisions-file)
  (if (null? list-of-divisions-file)
      (error "No record found with this name")
      (let ((employee-record (get-record (car list-of-divisions-file))))
        (if employee-record
            employee-record
            (find-enployee-record employee-name (cdr list-of-divisions-file))))))
```
# d.
We must add the new procedures to the table with the correct type.\\
Even if tagged data is really useful, we should always have some sort of application programming interface (API) when everything is decentralized. Without any API big systems becomes really hard to change.
