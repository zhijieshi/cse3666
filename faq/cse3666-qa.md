# Frequently Asked Questions

## Why computer architecture?

As a computer engineer/scientist, we should know how computer works. Programs
run on computers. Someone needs to do the dirty work, to actually build the
computers. 

Here is a video about [the Map of Computer
Science](https://www.youtube.com/watch?v=SzJ46YA_RaA).

## Why do I have to learn assembly language?

Well, processors only understand instructions. If we want to understand how
they work, we need to learn and program with instructions. So we learn assembly
language in this course. 

Here is Youtube video ["Why should I learn assembly language in
2020?"](https://www.youtube.com/watch?v=iYRl50gtprA).

## Why do computers use 2's complement numbers?

Two's complement numbers have nice math properties. We can use the same hardware
to perform addition/subtraction on both signed and unsigned numbers.

Here is an example. If we consider eight bits 11111111 as an unsigned binary
number, its value is 255 (in decimal). If we consider the bits as a two's
complement number, its value is -1. 255 and -1 are congruent modulo
256.  -1 mod 256 = 255.

## How does the processor do additions on hexadecimal or decimal numbers?

The processors do not work on hexadecimal or decimal numbers. They only deal
with bits. They add bits. No matter what format we use in the source code to
specify numbers, they all are represented by bits in computers. For example,
you can write the following in your programs.

```C
int x = 0xA0; 
int y = 160; 
```

Both ```x``` and ```y``` have the same value, represented by the same bits.

