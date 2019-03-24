---
layout: page
title:  "Exercise 2.13"
tags: mit-scheme scheme SICP solution
categories: SICP
---
Let's take two intervals defined by their center and percentage tolerance:
- interval \\(A\\) with center \\(c_1\\) and percentage \\(p_2\\)
- interval \\(B\\) with center \\(c_2\\) and percentage \\(p_2\\)

We can easily find the lower bound and upper bound of each interval using the ideas of the `make-center-percent` procedure defined in the previous exercise:

\\(A=(c_1-\frac{c_1\cdot p_1}{100},c_1+\frac{c_1\cdot p_1}{100})\quad B=(c_2-\frac{c_2\cdot p_2}{100},c_2+\frac{c_2\cdot p_2}{100})\\)

Assuming that the bounds are positives (as proposed by the exercise), we can determine the product of the two intervals :

\\(A.B=((c_1-\frac{c_1\cdot p_1}{100})\cdot (c_2-\frac{c_2\cdot p_2}{100}),(c_1+\frac{c_1\cdot p_1}{100})\cdot (c_2+\frac{c_2\cdot p_2}{100}))\\)

\\(\quad \\ \\ \\ \\ =(c_1\cdot c_2+\frac{c_1\cdot c_2\cdot p_1\cdot p_2}{100}-\frac{c_1\cdot c_2\cdot p_2}{100}-\frac{c_1\cdot c_2\cdot p_1}{100},c_1\cdot c_2+\frac{c_1\cdot c_2\cdot p_1\cdot p_2}{100}+\frac{c_1\cdot c_2\cdot p_2}{100}+\frac{c_1\cdot c_2\cdot p_1}{100})\\)

Now we can easily see the center and the with of our new interval.\\
Next we can evaluate the percentage of our new interval following the ideas of our `percent` procedure:\\
 \\[\text{percentage}(A\cdot B)=\frac{c_1\cdot c_2\cdot (p_1+p_2)}{c_1\cdot c_2+\frac{c_1\cdot c_2\cdot p_1\cdot p_2}{100}}\\] You can verify that this percentage is correct with substitution using the `percent` procedure.
 
 If the percentages \\(p_1\\) and \\(p_2\\) are small then \\(\frac{c_1\cdot c_2\cdot p_1\cdot p_2}{100}\\) is negligible and we get:
 \\[\text{percentage}(A\cdot B)\approx p_1\cdot p_2\\]
 
 We just proved that the percentage tolerance of the product of two intervals is approximately the sum of the two percentage tolerance of the factors if these percentages are small.
