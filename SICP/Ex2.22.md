---
layout: page
title:  "Exercise 2.22"
tags: mit-scheme scheme SICP solution
categories: SICP
---
The first rewrite of the `square-list` procedure doesn't work as intended because it's appending the square of each element of the list to the left of the list, so the final list is reversed.

The second procedure doesn't work either because the end of the list marker is at the beginning of the "malformed list".
