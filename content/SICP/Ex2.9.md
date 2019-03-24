---
layout: page
title:  "Exercise 2.9"
tags: mit-scheme scheme SICP solution
categories: SICP
---
We takes two intervals represented by a double similarly to the representation in our program:

\\(a=(x_1,y_1)\quad\text{width}(a)=\frac{x_1+y_1}{2}\\)

\\(b=(x_2,y_2)\quad\text{width}(b)=\frac{x_2+y_2}{2}\\)

Now we can do the sum of the two intervals:

\\(a+b=(x_1+x_2,y_1+y_2)\\)

\\(\text{width}(a+b)=\frac{x_1+x_2+y_1+y_2}{2}=\frac{x_1+y_1}{2}+\frac{x_2+y_2}{2}=\text{width}(a)+\text{width}(b)\\)

We can see that the width function is a linear map so the same thing works for the difference of two intervals.

It's not true for the multiplication as for example:

\\(c = (0,1)\quad \text{width}(c)=\frac{1}{2}\\)

\\(d = (-1,1)\quad \text{width}(d)=1\\)

\\(\text{width}(c)\times \text{width}(d)=\frac{1}{2}\\)

But we have \\(c\times d=(-1,1)\\) using the `mul-interval` function and \\(\text{width}(c\times d)=1\\)

Using the same \\(c\\) and \\(d\\) and the `div-interval` function we show as example:

\\(\text{width}(c)/\text{width}(b)=\frac{1}{2}\neq 1 = \text{width}(c/d)\\)

Therefore the width of the division of two intervals is not equal to the division of the width of the two intervals.
