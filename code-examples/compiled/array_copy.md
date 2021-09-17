A C funciton that copies array of n words. The versions with a fixed array size of 100
are in the solutions directory.

```c
void copy_array(int A[], int B[],int n)
{
	int i;
	for (i = 0; i < n; i ++)
		A[i] = B[i];
}
```

CLANG 12.0.1 with `-O` generates the following instructions.
Six are in the loop.

```
copy_array(int*, int*, int):                    # @copy_array(int*, int*, int)
        addi    a3, zero, 1
        blt     a2, a3, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        lw      a3, 0(a1)
        sw      a3, 0(a0)
        addi    a2, a2, -1
        addi    a0, a0, 4
        addi    a1, a1, 4
        bnez    a2, .LBB0_1
.LBB0_2:
        ret
```

gcc 10.2.0 with `-O` generates the following instructions. Five are in the loop.
```
copy_array(int*, int*, int):
        ble     a2,zero,.L1
        mv      a5,a1
        slli    a2,a2,2
        add     a1,a1,a2
.L3:
        lw      a4,0(a5)
        sw      a4,0(a0)
        addi    a5,a5,4
        addi    a0,a0,4
        bne     a5,a1,.L3
.L1:
        ret
```

The compiler generates similar instructions from the pointer version.

```
void copy_array(int A[], int B[], int n)
{
	int *pa, *pb, *pend;

	pa = A, pend = &A[n], pb = B;
	while (pa < pend)
		*pb ++ = *pa ++;
}
```

CLANG. There are 7 instructions in the loop. Two `mv` can be removed.  Note
that `lw` and `sw` are separated. We will learn why in later part for the
course.  

```
copy_array(int*, int*, int):                    # @copy_array(int*, int*, int)
        addi    a3, zero, 1
        blt     a2, a3, .LBB0_3
        slli    a2, a2, 2
        add     a2, a2, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
        lw      a3, 0(a0)
        addi    a4, a0, 4
        addi    a5, a1, 4
        sw      a3, 0(a1)
        mv      a0, a4
        mv      a1, a5
        bltu    a4, a2, .LBB0_2
.LBB0_3:
        ret
```


gcc. 
```
copy_array(int*, int*, int):
        slli    a2,a2,2
        add     a2,a0,a2
        bgeu    a0,a2,.L1
.L3:
        addi    a0,a0,4
        addi    a1,a1,4
        lw      a5,-4(a0)
        sw      a5,-4(a1)
        bgtu    a2,a0,.L3
.L1:
        ret
```
