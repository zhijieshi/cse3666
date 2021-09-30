# Frequently Asked Questions on RISC-V

## How do I find out what an instruction does?

Most of instructions are straightfoward. We can start with the slides,
textbook, and the reference card in the textbook. Then, you can also check the
reference manual and other online resources. Please take a look at the links
on [this page](https://github.com/zhijieshi/cse3666/blob/master/risc-v/risc-v.md).

## How do I know if the bits are signed or unsigned?

When coding with assembly lanugage, we, the programmers, need to keep track of
data types. If signed and unsigned operations produce the same results, like ADD, 
one instruction is provided. If they produce different results, two versions
are provided, for example, SRAI vs SRLI, BLT vs BLTU, and LB vs LBU.  
We need to pick the correct one for the data type.

## Immediate operand in instructions like ADDI 

How do I know if a number is in the range of the immediate operand?

The immediate must be in the range [-2048, 2047] in the instructions like ADDI.  

If we have an immediate in decimal, it is easy to tell. 

If we have a number in hexadecimal or binary, it is not hard either.  We check if all
bits higher than bit 11 are the same as bit 11. If yes, it is in the range. Otherwise
it is not. In hexdecimal representation, the lower 3 hexadecimal digits are for
lower 12 bits. Bit 11 is the highest bit in the third hexadecimal digit from the right.

Examples:
```
0xFFFF_FABC
Yes.
Bit 11 is 1 (the highest bit in A). All higher bits are 1.

0x0000_07AB
Yes.
Bit 11 is 0 (the highest bit in 7). All higher bits are 0.

0xAB00_08FF
No.
Bits 31 to 12 do not have the same value. 
```

## How do I tell if an instruction is a pseudoinstruction? 

At beginning, we rely on the reference card. The card lists instructions and
pseudoinstructions. 

There are not many instructions/pseudoinstructions. We can remember what are real
instructions after a while.

After we learn instruction encodidng, we can challenge ourselves to encode an
instruction. Pseudoinstructions must be converted into real instructions first and
then into machine code.    

We can also check in RARS. After code is assembled, RARS lists machine code, basic
instructions (the real ones), and the ones in the source file. We can also 
turn off the pseudoinstruction support in RARS (Settings/Permit extended (pseudo)
instructions and formats).

## Where are the arguments to a function?

According to the calling convention, arguments are placed in registers `a0`,
`a1`, and so on. It does not matter how the arguments are named in high-level
languages/pseudocode. 

For example, when we implement the following funciton in Python, we do not
expect the funciton only works on varaibles `a` and `b`. They are just names
for arguments. Other programmers can pass other variables/constants to the
funciton, for example, `max2(c, 10)`. When we write the function in RISC-V, `a`
is in `a0` and `b` is in `a1`. The caller needs to set up `a0` and `a1`
correctly before the function call instruction if it needs to get the correct
return value.

```
def	max2(a, b):
    if a >= b:
        r = a
    else:
        r = b
    return r
```

