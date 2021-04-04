### set a register to 0

<details><summary>Answer</summary>

There are many ways.

```
    addi    s1, x0, 0
    add     s1, x0, x0
    xor     s1, s1, s1  # works without registers like x0
```
</details>

### Swap two registers without a third one

<details><summary>Answer</summary>

We use `xor` as an example.

```
    # swap x1 and x2
    xor     x1, x1, x2
    xor     x2, x1, x2  # now x2 is the original x1 
    xor     x1, x1, x2  # now x1 is the original x2
```
</details>
