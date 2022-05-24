---
layout: post
title:  "Math background" 
usemath: true
tag: math
---

# Math 

We need some basic math skills in this course.

* Solve (simple) equations 
* Compute average

## Find the unknowns 

Suppose we know the relation of $n$ varaibles. If we know the value of
$n-1$ variables, we can find the value of the remaining one.

For example, we know the relation among distance, time, and speed.

$$ d = t \times s $$

where $d$ is distance, $t$ is time, and $s$ is spped. If 
we know the value of two of the three variables, we can calculate the third.

If a car travels 60 miles/hour for two hours, the distance it has travelled
is 120 miles.

$$ d = t \times s = 2 \times 60 = 120 $$

If one runs 3 miles in 30 minutes (i.e., 0.5 hours), the average speed is 6 miles
per hour. 

$$ s = \frac{d}{t} = \frac{3}{0.5} = 6 $$

## Average

Example:

Consider a basket of $N$ fruits. By count, 20% are Fruit A, 30% are Fruit B,
and 50% are Fruit C.  Fruits A, B, and C have different weights. Fruit A weighs
100g each, Fruit B weighs 150g each, and Fruit C weighs 50g each. What is the
average weight of a fruit in the basket?

| Fruit | Percentage by count | Unit weight |
|:-----:|:-------------------:|------------:|
| A     | 20% | 100g | 
| B     | 30% | 150g | 
| C     | 50% | 50g  | 

### Method 1

We can divide the total weight by the total count. 

The total weight is:

$$ 
\begin{align} 
& 20\\% \times N \times 100 + 30\\% \times N \times 150 + 50\\% \times N \times 50 \\
= & 20 N + 45 N + 25 N \\
= & 90 N 
\end{align}
$$ 

Divide the total weight by count $N$.

$$ \frac{90 N}{N} = 90 $$ 

Therefore, the average weight is 90g.

Notice that $N$ is cancelled out eventually. We do not need to include it at
the beginning. This is actually a common way to compute weighted average. 

$$ 20\\% \times 100 + 30\\% \times 150 + 50\\% \times 50 = 90$$

### Method 2

We pick a fruit as the reference and look at the differences of each fruit to the reference.  

Let us use Fruit A's weight as the reference. 

$$ \begin{align} & 100 + 20\\% \times (100 - 100) + 30\\% \times (150 - 100) + 50\\% \times (50 - 100) \\ 
  = & 100 + 20\\% \times 0 + 30\\% \times 50 + 50\\% \times (-50) \\
  = & 100 + 15 - 25 \\
  = & 90 \end{align} $$

The methods are essentially the same. We can consider the reference in Method 1 is 0. 
The expression can also be obtained from Method 1 expression.

$$
\begin{align}
& 20\\% \times 100 + 30\\% \times 150 + 50\\% \times 50  \\
= & 20\\% \times (100 - 100 +  100) + 30\\% \times (150 - 100 + 100) + 50\\% \times (50 - 100 + 100) \\
= & (20\\% + 30\\% + 50\\%) \times 100 + 20\\% \times (100 - 100) + 30\\% \times (150 - 100) + 50\\% \times (50 - 100) \\
= & 100 + 20\\% \times (100 - 100) + 30\\% \times (150 - 100) + 50\\% \times (50 - 100) 
\end{align}
$$

<!-- 
* Apply ratio

## Ratio

Ratio is the quantitative relation of two variables. If the ratio of two variables is known, 
we can find the value of one variable from the value of the other. Actually, speed is a 
ratio of distance and time. 

-->
