## Commonly used operations 

There are programming idioms in RISC-V too.

### Set a register to 0

<details><summary>Answer</summary>

There are many ways. It is a special case of loading a constant into a register.
Any of the following instructions works.

```
    addi    s1, x0, 0
    add     s1, x0, x0

    # there are other ways, but they are not as readable  
    sub     s1, s1, s1  
    xor     s1, s1, s1  
```
</details>

### Load a small constant into a register

Load -100 into register t0. 

<details><summary>Answer</summary>

Small means the value is in ragne [-2048, 2047].  

```
    addi    t0, x0, -100    
```
</details>

### Load an arbitrary 32-bit constant into a register

<details><summary>Answer</summary>

It depends on the value of the constant. If the constant can be represented by 
a 12-bit two's complement number, we need only one ADDI instruction. 

Otherwise, at most two instructions can load any 32-bit constants in a
register.

```
    # small constants
    addi    s1, x0, -100

    # for large constants
    lui     s1, 0x12345     
    addi    s1, s1, 0x678

    # in general
    lui     t0, HI20      # load higher 20 bits to t0
    addi    t0, LO12      # add the lower 12 bits

    # Note LO12 are sign extended
    # Add 1 to HI20 if LO12 is negative
    # for example, load 0x12345888 into t0
    # note that the immediate in lui is 0x12346, not 0x12345

    lui     t0, 0x12346     # note the right-most digit is not 5
    addi    t0, t0, 0xFFFFF888
```
</details>

### Copy a register to another

Copy register t0 to t1.

<details><summary>Answer</summary>

We just do t1 = t0 + 0.

        addi    t1, t0, 0 

</details>

### Write a for loop - 1

Assume we assign `s1` to variable `i`, and `s2` to `j`.

```
for  (i = 0; i < j; i ++) {
    // loop body
}
```

<details><summary>Answer</summary>

There are two ways to construct loops. The code below uses Method 2, which test
the condition at the end of the loop.

Note that there is a BEQ instruction so the condition can be tested for the
first iteration.

```
    addi    s1, x0, 0

    # jump to loop_test because condition may fail on the first test
    beq     x0, x0, loop_test

loop:

    # loop body

    addi    s1, s1, 1
loop_test:
    blt     s1, s2, loop
```
</details>

### Write a for loop - 2

Assume we assign `s1` to variable `i`.

```
for  (i = 0; i < 1000; i ++) {
    // loop body
}
```

<details><summary>Answer</summary>

Similar to the previous question. The only difference is tha tthe condition is
`i < 1000`. We can simly load 1000 into register s2 and then use the code in
the previous question.

The code below tests the condition at the beginning of the loop.

```
    addi    s1, x0, 0
    addi    s2, x0, 1000    # note 1000 is a small constant

loop:
    bge     s1, s2, loop_exit

    # loop body

    addi    s1, s1, 1
    beq     x0, x0, loop

loop_exit:

```
</details>

### Write a nested loop

Assume we assign `s1` to `i`, `s2` to `j`, `s3` to `UI`, and `s4` to `UJ`.

```
for  (i = 0; i < UI; i ++) {
    for (j = 0; j < UJ; j ++) {
        // loop body
    }
}

```

<details><summary>Answer</summary>

Try to implement the outer loop first, then add the inner loop, and then
the loop body. 

In the following code, both loops test the condition at the end/bottom 
of the loop.

```
    addi    s1, x0, 0
    beq     x0, x0, test_i
loop_i:

    #####
    # inner loop
    addi    s2, x0, 0
    beq     x0, x0, test_j
loop_j:

    # loop body

    addi    s2, s2, 1
test_j:
    blt     s2, s4, loop_j

    #####

    # do not forget to increment i
    addi    s1, s1, 1
test_i:
    blt     s1, s3, loop_i
```

</details>

### Test bit. 

Check a register s0 is odd.

<details><summary>Answer</summary>

We check the LSB in t0. Since the mask is small, we can use ANDI.

```
    andi    t0, s0, 1
    bne     t0, x0, L_EVEN 
```

</details>

### Test bits. 

Check a register s0 is divisible by 8.

<details><summary>Answer</summary>

We check the right-most three bits in s0. Since the mask is small, we can use ANDI.

```
    andi    t0, s0, 7           # 7 is 0b0111 
    beq     t0, x0, DIV8        # if t0 == 0, s0 is divisible by 8
```

</details>

### Test bits. 

Check the value of selected bits in a register, for example, s0. 

    if (both bits 3 and 6 in s0 are 0) goto L 

<details><summary>Answer</summary>

Since the mask is small, we can use the immediate in ANDI to specify it.  Once
bits are isolated, we can test them for specific values.

```
    andi    t0, s0, 0x48      #0b0100_1000 
    beq     t0, x0, L
```

</details>

### Clear bits in a register 

For example, clear the higher 16 bits in register s1.

If s1 is 0x10203040, it will become 0x00003040.

<details><summary>Answer</summary>

We could use an AND instruction. The mask is 0x0000FFFF.  If the mask is not
already in a register, we need two instructions to load it in a register.

It can also be done with two shift instructions, in this problem. 

```
    slli    s1, s1, 16
    srli    s1, s1, 16      # note this is logical shift
```
</details>

### Set a set of bits in a register to 1

For example, set bits 24 to 31 in register s1 to 1.

If s1 is 0x10203040, it will become 0xFF203040.

<details><summary>Answer</summary>

The generic method is to have a mask and then OR the mask with
the bits we would like to change.

The mask in this questin is 0xFF000000. 

The code is as follows.

    lui     t0, 0xFF000
    or      s1, s1, t0 

</details>

### Sign extension

Sign extend the byte value in s1.

<details><summary>Answer</summary>

```
    slli    s1, s1, 24
    srai    s1, s1, 24      # note the arithmetic shift
```
</details>

### Load the address of a variable into a register

Suppose var is a label we define in the data section.
Load the address into register s1.

```
        .data
var:    .word   0
```

<details><summary>Answer</summary>

In CSE 3666, we find out the address of var and use LUI and ADDI to 
load the 32 bits into a register.

If allowed, we can use `la` pseudoinstruction to put an address in a register.
The operation is done with two instructions: AUIPC and ADDI.

AUIPC does not appear in exam questions.

```
    # suppose var is a variable defined in data section 
    la      s0, var
```
</details>

### Load a data item from memory to register

Assume register s1 has the address of a word.
Load the word into register t1.

<details><summary>Answer</summary>

If the address of the data item is already in a register, we 
can use the proper load instruction.

```
    # assume s1 has the address
    lw      t1, 0(s1)       # word
    lhu     t2, 0(s1)       # unsigned half word
    lh      t2, 0(s1)       # signed half word
    lbu     t2, 0(s1)       # unsigned byte
    lb      t2, 0(s1)       # signed byte
```

</details>

### Access array elements - 1

Suppose `s2` is the starting address of a word array `A`. Load `A[10]` into register `t0`.

<details><summary>Answer</summary>

The offset is known and fixed. We just need one instruction. Think about 
why we use `lw` and why the offset is 40.

```
    lw      t0, 40(s2)
```
</details>

### Access array elements - 2

Suppose `s2` is the starting address of a word array `A` and variable `i`
is assigned to `s3`. Load  `A[i]` into register `t0`.

<details><summary>Answer</summary>

We calculate `A[i]`'s address first. Then load it into `t0`.

```
    slli    t1, s3, 2       # offset in bytes
    add     t1, t1, s2      # add to base
    lw      t0, 0(t1)
```
</details>

### Enumerate characters in an ASCII string

Assume `s1` is the starting address of string s. 

```
    i = 0
    while  (s[i] != 0)
        loop body
        i += 1
```

The loop can also be written as a for loop.

```
    for (i = 0; s[i] != 0; i += 1)
        loop body
```

<details><summary>Answer</summary>

Let us keep i in register s2.

```
        add     s2, x0, x0

    loop:
        add     t1, s1, s2      # addr of s[i]
        lbu     t0, 0(t1)       # load s[i]
        beq     t0, x0, loop_exit

        # more instructions for loop body

        
        addi    s2, s2, 1       # i += 1
        beq     x0, x0, loop
    loop_exit:
```
</details>

### Implement a leaf function 

A leaf function does not call any other functions. 

Important questions: 

*   Where does the function get the arguments? 
*   How does the function return a value to the caller?
*   What registers can the function overwrite?  

<details><summary>Answer</summary>

According to RISC-V calling convention, first 8 arguments are placed in
registers `a0`, `a1`, and so on. The return value is placed in `a0` and `a1`.

The function does not need to preserve argument registers (`a0`, `a1`, and so
on) and temporary register (`t0`, `t1`, and so on), which means the function
can use these registers without saving/restoring their values. Since we do not
write complicated functions in this course, these registers are enough for us
to implement leaf functions and we do not need to use stack in leaf functions.

</details>

### Allocate storage on stack.

1.   Allocate 64 bytes on the stack.

<details><summary>Answer</summary>

Depends on the number of words we need storage for. For example, 
if we want space for 16 words, we can adjust `sp` as follows.

```
   addi     sp, sp, -64
```

Note that we assume sp is alway aligned to word addresses in this course.
So even if we need only 61 bytes, we allocate 64 bytes from the stack.

</details>

2.  Allocate n words on the stack, where n is in register a1. Assume n is postive
and there is enough space on the stack.

<details><summary>Answer</summary>

If the number of words is a variable, we can calculate the 
size in bytes first. For example, if the number of words is 
in `a1`, we can do the following.

```
    slli    t0, a1, 2
    sub     sp, sp, t0
```
</details>

### Save/restore registers on the stack

Save register ra, s1 on the stack, and restore them.

<details><summary>Answer</summary>

We allocate space from the stack first, then store
registers to the allocated space. When restoring
them, we load them back from memory and also 
restore sp.

```
    # push ra and s1 onto the stack 
    addi    sp, sp, -8
    sw      ra, 4(sp)
    sw      s1, 0(sp)

    # some code goes here to use the value

    # restore ra ans s1. Then restore sp
    lw      ra, 4(sp)
    lw      s1, 0(sp)
    addi    sp, sp, 8
```

</details>

### Function calls

```C
puts(str);
```

<details><summary>Answer</summary>

According to RISC-V calling convention, first 8 arguments are placed in
registers `a0`, `a1`, and so on. The return value is placed in `a0` and `a1`.
Then JAL instruction goes to the function and saves the return address in `ra`. 

The following code calls `puts` to print a string, assuming the address of
`str` is not in any register.

```
    la      a0, str         # la is a pseudoinstruction.
    jal     ra, _puts
```

If the address of `str` is already in a register, say, `s2`, we can copy it 
to register `a0`.

```
    addi    a0, s2, 0
    jal     ra, _puts
```

If the address of `str` is 0x100010000, we use LUI to load it into register
`a0`.

```
    lui     a0, 0x10010
    jal     ra, _puts
```

</details>

### Implement non-leaf functions

A non-leaf function has one or more function calls.

Questions: 

*   Where is `n` kept upon entry of function `foo()`?
*   Do we keep `n` in the same register? 
*   What kind of registers should we assign to variable `i`?
*   What registers does function `foo()` need to save/restore?

```
void foo(int n)
{
    for (int i = 0; i < n; i ++) 
        bar();
}
```

<details><summary>Answer</summary>

Argument `n` is in register `a0` upon the entry of function `foo()`.

Since `a0` is not perserved during call to function `bar()`, we copy `n` into a
saved register, say, `s1`, at the beginning of function `foo()`. If we just
keep `n` in `a0`, we will need to save it on stack before the loop and restore
it after calling `bar()` in the loop. Restoring, i.e., loading `n` from the
stack to `a0`, will have to be performed in every iteration.

We use one of saved registers, say, `s2`, to keep variable `i`. If we use a
temporary register for `i`, it needs to be saved and restored in every
iteration.

Function `foo()` needs to save `ra`, `s1`, and `s2`. `ra` is changed when
calling `bar()`. Function `foo()` needs to preserve `s1` and `s2`.

Try to write the code first. 

</details>

<details><summary>Code</summary>

```
foo:
    addi    sp, sp, -12
    sw      ra, 8(sp)
    sw      s1, 4(sp)
    sw      s2, 0(sp)

    addi    s1, a0, 0       # copy n
    addi    s2, x0, 0       # i = 0    

loop:
    bge     s2, s1, exit    # exit if i >= n 
    jal     ra, bar
    addi    s2, s2, 1       # i += 1
    beq     x0, x0, loop

exit:

    lw      ra, 8(sp)
    lw      s1, 4(sp)
    lw      s2, 0(sp)
    addi    sp, sp, 12

    jalr    x0, ra, 0
```
</details>
