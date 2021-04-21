
Here is the C function that computes factorial. This is the example in lecture.

```c
int fact (int n)
{ 
    if (n < 1) 
	return 1;
    else 
        return n * fact(n - 1);
}
```

Compiled with clang, without optimization. Pay attention to how frame pointer `s0` is used.

```
fact:                                   # @fact
        addi    sp, sp, -32
        sw      ra, 28(sp)
        sw      s0, 24(sp)
        addi    s0, sp, 32
        sw      a0, -16(s0)
        lw      a0, -16(s0)
        mv      a1, zero
        blt     a1, a0, .LBB0_2
        j       .LBB0_1
.LBB0_1:
        addi    a0, zero, 1
        sw      a0, -12(s0)
        j       .LBB0_3
.LBB0_2:
        lw      a0, -16(s0)
        addi    a1, a0, -1
        sw      a0, -20(s0)
        add     a0, zero, a1
        call    fact
        lw      a1, -20(s0)
        mul     a0, a1, a0
        sw      a0, -12(s0)
        j       .LBB0_3
.LBB0_3:
        lw      a0, -12(s0)
        lw      s0, 24(sp)
        lw      ra, 28(sp)
        addi    sp, sp, 32
        ret
```

Compiled with clang, with '-O'.

```
fact:                                   # @fact
        addi    sp, sp, -16
        sw      ra, 12(sp)
        sw      s0, 8(sp)
        addi    a1, zero, 1
        blt     a0, a1, .LBB0_2
        add     s0, zero, a0
        addi    a0, a0, -1
        call    fact
        mul     a1, a0, s0
.LBB0_2:
        add     a0, zero, a1
        lw      s0, 8(sp)
        lw      ra, 12(sp)
        addi    sp, sp, 16
        ret
```
