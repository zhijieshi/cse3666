## Converting a decimal number to a binary number 

Given a decimal number, we are asked to find out the bits (binary digits) that
represent the same value. Suppose the bits are:

```
b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
```

Each bit `b0`, `b1`, et.c, can be 0 or 1. Each carries a different weight
(i.e., the value added to the total value when the bit is 1). For example, the
weight of `b0` is 1, that of `b1` is 2, and that of `b2` is 4.  `b0` is the
least significant bit because it is the least valuable. 

A conversion strategy is to figure out the value of the bits one by one,
starting from `b0`. Let us use decimal number 2021 as an example to explain the
process. 

### Find b0, the least significant bit (LSB)

Can we figure out the value of `b0` in 2021's binary representation? And why? 

<details><summary>Answer</summary>

`b0` is 1. 

We divide 2021 by 2. The quotient is 1010 and the remainder is 1.

$$2021 = 1010 \times 2 + 1$$

Notice that the values carried by other bits `b1`, `b2`, etc., are divisible by 2.

</details>

### Find out b1

Now we know `b0` is 1 in 2021's binary representation. We continue to find the
value of the next bit. 

Can you figure out the value of `b1`? 

Hint: $2021 = 1010 \times 2 + 1$

```
b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                            ?  1  
```

<details><summary>Answer</summary>

If we remove the right most digit in a decimal number, we divide the number by
10.  For example, if we remove the right most digit in decimal number 1234, we
get 123, whcih is `1234 // 10`, where `//` denotes integer division. 

Similarly, when we remove a bit at the right end of a binary number, we divide
the number by 2 (using integer division). If we remove `b0` in 2021's binary
representation, the remaining bits denote value 1010, which is `2021 // 2`. 

The following bits represent 2021 (although we only know `b0` is 1).

```
b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                            ?  1
```

After removing `b0`, the following bits represent 1010.

```
b10 b9 b8 b7 b6 b5 b4 b3 b2 b1
                            ? 
```

`b1` is the right most bit in 1010's binary representation. To find its 
value, we divide 1010 by 2. 
        
    1010 % 2 = 0
    1010 // 2 = 505
    1010 = 505 * 2 + 0

The quotient is 505 and the remainder is 0. So the right-most bit of 1010's
binary representation is 0. Therefore, `b1` in 2021's representation is 0. 


```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                         ?  0  1  
```

</details>

### Continue to other bits

Following the same strategy, we can find the value of `b2`, `b3`, and so on. 

To figiure `b2`, we divide 505 by 2, where 505 is the quotient we got from the last division. 
The quotient is 252 and the remainder is 1. So `b2` is 1. 

    505 = 252 * 2 + 1

```
... b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
                      ?  1  0  1  
```

We repeat the process and continue to find out the remaning bits until the
quotient becomes 0. The process will terminate because the quotient becomes
smaller in each step. If we continue when the quotient is 0, the bits we get
will always be 0.

The following line shows the process of finding remaining bits. On the first
line, we divide 252 by 2. The quotient is 126 and the remainder is 0.  So `b3`
is 0.  

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

Converting a decimal number to a hexadecimal number is similar to the process
of converting it to a binary number. The difference is that we use 16, instead
of 2, as the divisor in divisions.

For example, we take the following steps to convert 2025 to a hexadecimal
number. 

```
2025 = 126 * 16 +  9       d0 = 9
 126 =   7 * 16 + 14       d1 = E  
   7 =   0 * 16 +  7       d2 = 7 
```

On the first line, we divide 2025 by 16. The quotient is 126 and the
remainder is 9. So the right most hex digit d0 is 9. 

We then divide 126 by 16 on the second line, where 126 is the quotient we got
from the first division. The remainder is 14. So the next hex digit (d1) is E. 

The quotient from the second division is 7. So we divide 7 by 16 on the third
line. The remainder is 7. So the third hex digit is 7. 

We can terminate the process because the quotient became 0. The hexadecimal
representation of 2025 is `0x7E9`.

## Conversion between binary numbers and hexadecimal numbers

Because $16 = 2^4$, the conversion between binary and hexadecimal numbers are
much eaiser. 

To convert a binary number to a hexadecimal number, we put bits in groups, each
group 4 bits, starting from the right end. Then, we convert each group of bits
to a hexadecimal digit.

```
Binary:            11111101001  
Bits in group:   111 1110 1001
Convert to hex:    7    E    9
```

Note that the left-most group has only 3 bits. In this case, we add a 0 to the
left of the bits. That's why it is important to start from the right end.

Converting hexadecimal numbers to binary numbers is simply converting each
hexadecimal digit to 4 bits.  Here is an example.

```
Hexadecimal:     C0FFEE
Convert each hex digit to 4 bits:    
    C    0    F    F    E    E   
    1010 0000 1111 1111 1110 1110
```

In CSE 3666, each register has 32 bits. We normally use 8 hexadecimal digits to
represent these bits.
