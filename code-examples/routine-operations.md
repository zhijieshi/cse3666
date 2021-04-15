1. set a register to 0

<details><summary>Answer</summary>

There are many ways.

```
    addi    s1, x0, 0
    add     s1, x0, x0
    xor     s1, s1, s1  # works without registers like x0
```
</details>

2. Swap two registers without a third one

<details><summary>Answer</summary>

We use `xor` as an example.

```
    # swap x1 and x2
    xor     x1, x1, x2
    xor     x2, x1, x2  # now x2 is the original x1 
    xor     x1, x1, x2  # now x1 is the original x2
```
</details>

3. Load arbitrary large constants to a register. 

<details><summary>Answer</summary>

```
    lui     t0, HI20      # load higher 20 bits to t0
    addi    t0, LO12      # add the lower 12 bits

    # Note HI20 and LO12 are sign extended
    # Add 1 to HI20 if LO12 is negative

    # we may also need to clear the higher half of t0
    slli    t0, t0, 32
    srli    t0, t0, 32
    # or we can load -x with 2 instructions and then negate

    # use shift and or to combine two words into a doubleword
    slli    t2, t0, 32
    add     t2, t2, t1     # adjust for signs if needed
    # 6 instructions in total for a 64-bit constant

```
</details>
