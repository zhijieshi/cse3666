1. Set a register to 0.

<details><summary>Answer</summary>

There are many ways.

```
    addi    s1, x0, 0
    add     s1, x0, x0
    xor     s1, s1, s1  # works without registers like x0
```
</details>

3. Write a loop.

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


3. Write a nested loop.

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

3. Load a data item from memory to register. 

<details><summary>Answer</summary>

If the address of the data item is already in a register, we 
can use the proper load instruction.

```
    # assume s1 has the address
    ld      t0, 0(s1)       # doubleword
    lw      t1, 0(s1)       # word
    lwu     t2, 0(s1)       # unsigned word
    # similar for half words and byes
```

We can use `la` pseudoinstructin to put an address in a register. 

```
    # suppose var is a variable defined in data section 
    la      s0, var
```

</details>

4. Suppose `s2` is the starting address of a doubleword array `A`. Load  
`A[10]` into register `t0`.

<details><summary>Answer</summary>

The offset is known and fixed. We just need one instruction. Think about 
why we use `ld` and why the offset is 80.

```
    ld      t0, 80(s2)
```
</details>

4. Suppose `s2` is the starting address of a doubleword array `A` and variable
   `i` is assigned to `s3`. Load  `A[i]` into register `t0`.

<details><summary>Answer</summary>

We calculate `A[i]`'s address first. Then load it into `t0`.

```
    slli    t1, s3, 3       # offset in bytes
    add     t1, t1, s2      # add to base
    ld      t0, 0(t1)
```
</details>


3. Load arbitrary large constants to a register. 

<details><summary>Answer</summary>
At most two instructions can load any 32-bit constants in a register.

```
    lui     t0, HI20      # load higher 20 bits to t0
    addi    t0, LO12      # add the lower 12 bits

    # Note HI20 and LO12 are sign extended
    # Add 1 to HI20 if LO12 is negative
```

We may also need to clear the higher half of `t0`.
```
    slli    t0, t0, 32
    srli    t0, t0, 32
    # or we can load -x with 2 instructions and then negate
```

For 64-bit constants, we can use shift and OR to combine two words. 
```
    # 4 instructions to t0 and t1 
    # the combine t0 and t1 into t2
    slli    t2, t0, 32
    add     t2, t2, t1     # adjust for signs if needed
```
</details>

