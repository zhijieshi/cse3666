## Commonly used operations 

### Set a register to 0

<details><summary>Answer</summary>

There are many ways. It is a special case of loading a constant into a register.

```
    addi    s1, x0, 0
    add     s1, x0, x0
    xor     s1, s1, s1  # works without registers like x0
```
</details>

### Write a for loop

```
for  (i = 0; i < 1000; i ++) {
    // loop body
}

// or 
j = 1000
for  (i = 0; i < j; i ++) {
    // loop body
}

```

<details><summary>Answer</summary>

Assume we assign `s1` to variable `i`, and `s2` to `j`.

```
    li      s1, 0
    li      s2, 1000
    # jump to loop_test if condition may fail on the first test
loop:
    # loop body

    addi    s1, s1, 1
loop_test:
    blt     s1, s2, loop
```

</details>


### Write a nested loop

```
for  (i = 0; i < UI; i ++) {
    for (j = 0; j < UJ; j ++) {
        // loop body
    }
}

```

<details><summary>Answer</summary>

Assume we assign `s1` to `i`, `s2` to `j`, `s3` to `UI`, and `s4` to `UJ`.
Try to implement the outer loop first, then add the inner loop, and then
the loop body.

```
    li      s1, 0
    beq     x0, x0, test_i
loop_i:

    # inner loop
    li      s2, 0
    beq     x0, x0, test_j
loop_j:

    # loop body

    addi    s2, s2, 1
test_j:
    blt     s2, s4, loop_j

    # do not forget to increment i
    addi    s1, s1, 1
test_i:
    blt     s1, s3, loop_i
```

</details>

### Load a data item from memory to register

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

We can use `la` pseudoinstructin to put an address in a register. 

```
    # suppose var is a variable defined in data section 
    la      s0, var
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

### Load arbitrary 32-bit constants

<details><summary>Answer</summary>
At most two instructions can load any 32-bit constants in a register.

```
    lui     t0, HI20      # load higher 20 bits to t0
    addi    t0, LO12      # add the lower 12 bits

    # Note LO12 are sign extended
    # Add 1 to HI20 if LO12 is negative
```

</details>

### Test bits. Check the value of selected bits in a register. 

```
if (both bits 3 and 6 in s0 are 0) goto L 
```

<details><summary>Answer</summary>

Since the mask is small, we can use ANDI.
Once bits are isolated, we can test for other values, too.

```
    andi    t0, s0, 0x28      #0b0100_1000 
    beq     t0, x0, L
```
</details>

### Clear higher 32 bits in s1 (i.e., set them to 0). 

<details><summary>Answer</summary>
We could use a single AND instruction, if the mask is already in a register. 

```
    slli    s1, s1, 32
    srli    s1, s1, 32      # note the logical shift
```
</details>

### Sign extension. For example, sign extend the byte value in s1.

<details><summary>Answer</summary>

```
    slli    s1, s1, 56
    srai    s1, s1, 56      # note the arithmetic shift
```
</details>
