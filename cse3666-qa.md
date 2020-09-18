---
title: Frequently Asked Questions in CSE 3666
layout: default
description: Some commonly asked questions from students in CSE 3666, Introduction to Computer Architecture.
---

# Frequently Asked Questions

## Why do computers use 2's complement numbers?

There are many explanations on the Internet. One of the reasons is we can use
the same method to do additon of unsigned and signed numbers. We just need to
build one adder in hardware to perform add/sub for unsigned binary nnumbers and
for 2's complement numbers.  

## How does the processor do additions on hexadecimal or decimal number?

The processors only deal with bits. They add bits. No matter what format we use
in the source code to specify numbers, they all are represented by bits in
computers. For example, you can write the following in your programs.

```
int x = 0xA0; 
int y = 160; 
```

Both ```x``` and ```y``` have the same value, represented by the same bits.

## Can you give me an example of MIPS code?  

There are many examples in textbook and slides. Here is a sample example. 

The problem is `Set register $s0 to 0.`. 

You could give an answer like 

```
	sub 	$s0, $s0, $s0
```

or 


```
	add 	$s0, $0, $0
```

You do not need to write an assembly program that can be assembled.

