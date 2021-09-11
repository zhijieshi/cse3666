## Converting a decimal number to a binary number 

Given a decimal number, we are asked to find out the bits (binary digits) that
represent the same value. Suppose the bits are:

```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
```

Each bit `b0`, `b1`, et.c, can be 0 or 1. Each carries a different weight
(i.e., the value added to the total value when the bit is 1). For example, the
weight of `b0` is 1, that of `b1` is 2, and that of `b2` is 4.  `b0` is the
least significant bit because it is the least valuable. 

A conversion strategy is to figure out the value of the bits one by one,
starting from `b0`. Let us use decimal number 2021 as an example to explain the
process. 

### The least significant bit (LSB)

Can we figure out the value of `b0` in 2021's binary representation? And why? 

<details><summary>Answer</summary>

`b0` is 1. 

We divide 2021 by 2. The quotient is 1010 and the remainder is 1.

```
2021 = 1010 * 2 + 1 
```

The value carried by other bits `b1`, `b2`, etc., is a multiple 2.
It is divisible by 2.

</details>

### Continue to other bits 

Now we know `b0` in 2021's binary representation is 1. How can we 
continue to find the value of `b1`? 

```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                            ?  1  
```

Since we know that `2021 = 1010 * 2 + 1`. We just need to find out
1010's binary representation and append 1 to its right end.   

<details><summary>Explanation</summary>

When we append a 1 to the right end of a binary number `x`, we
are doing `x * 2 + 1`.

When we append a 0 to the right end of a binary number `x`, we
are doing `x * 2`.

</details>

To find the LSB of 1010's binary representation, we do division by
2 again. This time the remainder is 0. So the LSB in 1010's binary
representation is 0. 

```
1010 = 505 * 2 + 0
```

Therefore, `b1` in 2021's representation is 0. 

```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                         ?  0  1  
```

The next step is to find `b2`. Following the same strategy, we
divide 505, the quotient from the last division, by 2. The remainder
is 1. 

```
505 = 252 * 2 + 1
```
The LSB of 505's binary representation is 1 and `b2` in 
2021's representation is 1  

```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                      ?  1  0  1  
```

We repeat the process and continue to find out `b3`, `b4`, and so on, until the
quotient from a division becomes 0.  The process will terminate because the
quotient becomes smaller in each step. If we continue when the quotient is 0,
the bits we get will always be 0.

```
252 = 126 * 2 + 0       b3 = 0 
126 =  63 * 2 + 0       b4 = 0
 63 =  31 * 2 + 1       b5 = 1
 31 =  15 * 2 + 1       b6 = 1
 15 =   7 * 2 + 1       b7 = 1
  7 =   3 * 2 + 1       b8 = 1
  3 =   1 * 2 + 1       b9 = 1
  1 =   0 * 2 + 1       b10 = 1
```

So the binary representation of 2021 is: 

```
    b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
    1   1  1  1  1  1  0  0  1  0  1  
```

## Converting a decimal number to a hexadecimal number

The process is similar. The divisor in division is 16, not 2.

For example, we convert 2021 to a hexadecimal number in
following steps. The hexadecimal number is 0x7E5.

```
2021 = 126 * 16 +  5       d0 = 5
 126 =   7 * 16 + 14       d1 = E  
   7 =   0 * 16 +  7       d2 = 7 
```

## Binary numbers and hexadecimal numbers

Because 16 = 2<sup>4</sup>, the conversion between
binary and hexadecimal numbers are much eaiser. 

To convert a binary number to a hexadecimal number, 
we put bits in groups, each group 4 bits, starting from
the right end (LSB). Then, we convert each group of bits to
a hexadecimal digit.

```
Binary:            11111100101  
Bits in group:   111 1110 0101
Convert to hex:    7    E    5
```

Note that the left group has only 3 bits, but we can add more 0's. And that's
why it is important to start from the LSB.

Converting hexadecimal numbers to binary numbers is simply converting
each hexadecimal digit to 4 bits.  Here is an example.

```
Hexadecimal:     2021
Convert each hex digit to 4 bits:    
     2    0    2    1 
    0010 0000 0010 0001
```

