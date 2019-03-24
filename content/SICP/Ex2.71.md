---
layout: page
title:  "Exercise 2.71"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Tree for \\(n = 5\\) with only the weight on each node and leaf:
![](/assets/Ex2.71a.svg){: .center-image .medium-margin}
Tree for \\(n = 10\\) with only the weight on each node and leaf:
![](/assets/Ex2.71b.svg){: .center-image .medium-margin}
In such a tree only one bit is required to encode the most frequent symbol and \\(n-1\\) bits are required for the least frequent symbol. The shape of the tree come from the fact that \\(2^{n-1}>\sum\limits_{i=0}^{n-2} 2^i\\). To prove this we can see that \\(\sum\limits_{i=0}^{n-2} 2^i=2^{n-1}-1\\) (we can easily prove this by induction). 
