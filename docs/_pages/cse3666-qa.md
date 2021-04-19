---
title: FAQs
layout: default
description: Some commonly asked questions from students in CSE 3666, Introduction to Computer Architecture.
---

# Frequently Asked Questions

## Why do I have to learn assembly language?

Well, processors only understand instructions. If you want to understand how
they work, you would need to learn and program with instructions. So we learn
assembly language in this course.

Here is Youtube video ["Why should I learn assembly language in
2020?"](https://www.youtube.com/watch?v=iYRl50gtprA).

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

## How do I find out what an instruction does?

Most of instructions are straightfoward. You can start with the slides,
textbook, and the reference card in the textbook. Then, you can also check the
reference manual and otther online resources. Please take a look at the links
on the [this page](https://github.com/zhijieshi/cse3666/blob/master/misc/risc-v.md).

