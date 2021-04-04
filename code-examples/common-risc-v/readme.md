### set a register to 0

<details><summary>Answer</summary>
<p>
There are many ways.

#### 

```
    addi    s1, x0, 0
    add     s1, x0, x0
    xor     s1, s1, s1  # works without registers like x0
```
</p>
</details>
