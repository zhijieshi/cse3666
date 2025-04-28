# Array copy example (UConn CSE 3666)

We study different implementatons of `array_copy` code.

Assume A and B are word arrays. The C code that copies 100 elements from B to A
is:

```C
for (int i = 0; i < 100; i += 1)
     B[i] = A[i];
```

In assembly code, we assume the following registe allocation.

```
a0: B's address
a1: A's address
a3: i
```

Since we know the number of elements is 100, the loop condition is not tested
at the beginning when `i` is 0. If the number of elements to copy is unknown,
the test is necessary.

### Array version 

Translate to assembly diretly from the C code above. Seven instructions are in
the loop. 

```
        addi    a2, zero, 100
        addi    a3, zero, 0     # i = 0
loop:
        slli    a4, a3, 2       # a4 = 4 * i
        add     a5, a1, a4      # compute addr of A[i]
        lw      a7, 0(a5)
        add     a6, a0, a4      # compute addr of B[i]
        sw      a7, 0(a6)
        addi    a3, a3, 1       # i += 1
        bltu    a3, a2, loop 
```

### Array version with scaled loop counter

We remove SLLI by incrementing the loop counter by 4 in
each iteration. We keep track of the offset to control the 
loop. Six instructions are in the loop. 

```
        addi    a4, zero, 400   # end. 100 * 4
        addi    a3, zero, 0     # i = 0
loop:
        # i is already multiplied by 4
        add     a5, a1, a3      # compute addr of A[i]
        lw      a7, 0(a5)
        add     a6, a0, a3      # compute addr of B[i]
        sw      a7, 0(a6)
        addi    a3, a3, 4   # i += 4, scaled
        bltu    a3, a4, loop 
```

### Pointer version

The C code is:

```C
    int *pa, *pb, *pend;

    pend = &A[100]; 
    pa = A; 
    pb = B;

    while (pa < pend)
        *pb ++ = *pa ++;
```

We increment addresses by four in each iteration and use addresses to control
the loop.

```
    addi    a4, zero, 400   # end. 100 * 4
    add     a4, a4, a1      # pend = &A[100]
    addi    a2, a1, 0       # pa = A
    addi    a3, a0, 0       # pb = B
loop:
    lw      t0, 0(a2)       # t0 = *pa
    sw      t0, 0(a3)       # *pb = t0
    addi    a2, a2, 4       # pa ++
    addi    a3, a3, 4       # pb ++
    bltu    a2, a4, loop
```
