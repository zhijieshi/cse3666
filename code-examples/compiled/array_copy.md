
A C funciton that copies array of 100 words.

```c
void copy_array(int A[], int B[])
{
	int i;
	for (i = 0; i < 100; i ++)
		A[i] = B[i];
}
```

A compiler generates the following instructions when optimization is on. 

```
copy_array(int*, int*):                     # @copy_array(int*, int*)
        mv      a2, zero
        addi    a3, zero, 400
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        add     a4, a1, a2
        lw      a4, 0(a4)
        add     a5, a0, a2
        addi    a2, a2, 4
        sw      a4, 0(a5)
        bne     a2, a3, .LBB0_1
        ret
```

The compiler generates similar instructions from the pointer version.

```
void copy_array(int A[], int B[])
{
	int *pa, *pb, *pend;

	pa = A, pend = &A[100], pb = B;
	while (pa < pend)
		*pb ++ = *pa ++;
}
```
