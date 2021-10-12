## Why do we ever need the frame pointer? 

Functions may have local storage allocated on the stack. For example, the
following code allocates 4 words from the stack.  We can use the space to save
registers or for local varaibles.


```
    addi    sp, sp, -16
    sw      ra, 12(sp)    # save ra
    sw      x0, 0(sp)     # initialzie a local variable, say, i, to 0
```

We use `sp` as the base register in our examples because our code is simple. If
`sp` changes during the function, we would have to adjust the offset. For example, 

```
    addi    sp, sp, -32   # adjust sp for more storage 
    lw      x0, 32(sp)    # have to change offset from 0 to 32 to access i
```

The frame pointer just holds a stable address so we do not have to adjust the offset
in the same function. The compiler normally sets the frame pointer to be the sp
when function starts. For example, we may change our earlier code to the following. 
The offset for accessing variable `i` will still be -16 even if `sp` changes.

```
    addi    sp, sp, -16
    sw      ra, 12(sp)    # save ra
    sw      fp, 8(sp)     # save fp
    addi    fp, sp, 16    # let fp = old sp 
    sw      x0, -16(fp)   # initialzie a local variable, say, i, to 0
```

