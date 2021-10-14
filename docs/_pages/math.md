---
layout: post
title:  "Math background" 
usemath: true
tag: math
---

# Math 

We need some basic math skills in this course.

* Solve (simple) equations 
* Apply ratio
* Compute average

## Find the unknowns 

If we know the relationship of $$n$$ varaibles and the value of $$n-1$$ variables,
we can find the value of the remaining one.

For example, given

$$ d = t \times v $$

where $$d$$ is distance, $$t$$ is time, and $$v$$ is velocity, if 
we know the value of two of the three variables, we can calculate the third.

If a car travels 60 miles/hour for two hours, the distance it has travelled
is 120 miles.

$$ d = t \times v = 2 \times 60 = 120 $$

If one runs 3 miles in 30 minutes (i.e., 0.5 hours), the average speed is 6 miles
per hour. 

$$ v = \frac{d}{t} = \frac{3}{0.5} = 6 $$

## Ratio

Ratio is the quantitative relation of two variables. If the ratio of two variables is known, 
we can find the value of one variable from the value of the other. Actually, speed is a 
ratio of distance and time. 

## Average

Example:

Consider a basket of $$N$$ fruits. By count, 20% are Fruit A, 30% are Fruit B,
and 50% are Fruit C.  Fruits A, B, and C have different weights. Fruit A weighs
100g each, Fruit B weighs 150g each, and Fruit C weighs 50g each. What is the
average weight of a fruit in the basket?

|-------+---------------------+-------------|
| Fruit | Percentage by count | Unit weight |
|:-----:|:-------------------:|------------:|
| A     | 20% | 100g | 
| B     | 30% | 150g | 
| C     | 50% | 50g  | 
|-------+---------------------+-------------|

### Method 1

We can divide the total weight by the total count. 

The total weight is:

$$ 20\% \times N \times 100 + 30\% \times N \times 150 + 50\% \times N \times 50 $$

$$ = 20 N + 45 N + 25 N $$

$$ = 90 N $$ 

Divide the total weight by count $$N$$.

$$ \frac{90 N}{N} = 90 $$ 

Therefore, the average weight is 90g.

Notice that $$N$$ is cancelled out eventually. We do not need to include it at
the beginning. This is actually a common way to compute weighted average. 

$$ 20\% \times 100 + 30\% \times 150 + 50\% \times 50 = 90$$

### Method 2

We pick a fruit as the reference and look at the differences of each fruit to the reference.  

Let us use Fruit A's weight as the reference. 

$$ 100 + 20\% \times (100 - 100) + 30\% \times (150 - 100) + 50\% \times (50 - 100) $$

$$ \begin{align} & = 100 + 20\% \times 0 + 30\% \times 50 + 50\% \times (-50) \\
  & = 100 + 15 - 25 \\
  & = 90 \end{align} $$

The methods are essentially the same. We can consider the reference in Method 1 is 0. 
