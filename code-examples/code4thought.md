### Swap two registers without using a third one

<details><summary>Answer</summary>

We use `xor` as an example.

```
    # swap x1 and x2
    xor     x1, x1, x2
    xor     x2, x1, x2  # now x2 is the original x1 
    xor     x1, x1, x2  # now x1 is the original x2
```
</details>

