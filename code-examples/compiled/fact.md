
Here is the C function that computes factorial. This is the example in lecture.

```
long long fact (long long n)
{ 
    if (n < 1) 
	return 1;
    else 
        return n * fact(n - 1);
}
```

Compiled with clang, without optimization.
```
fact:                                   # @fact
        addi    sp, sp, -48
        sd      ra, 40(sp)
        sd      s0, 32(sp)
        addi    s0, sp, 48
        sd      a0, -32(s0)
        ld      a0, -32(s0)
        mv      a1, zero
        blt     a1, a0, .LBB0_2
        j       .LBB0_1
.LBB0_1:
        addi    a0, zero, 1
        sd      a0, -24(s0)
        j       .LBB0_3
.LBB0_2:
        ld      a0, -32(s0)
        addi    a1, a0, -1
        sd      a0, -40(s0)
        add     a0, zero, a1
        call    fact
        ld      a1, -40(s0)
        mul     a0, a1, a0
        sd      a0, -24(s0)
        j       .LBB0_3
.LBB0_3:
        ld      a0, -24(s0)
        ld      s0, 32(sp)
        ld      ra, 40(sp)
        addi    sp, sp, 48
        ret
```

Compiled with clang, with '-O'.

```
fact:                                   # @fact
        addi    sp, sp, -16
        sd      ra, 8(sp)
        sd      s0, 0(sp)
        addi    a1, zero, 1
        blt     a0, a1, .LBB0_2
        add     s0, zero, a0
        addi    a0, a0, -1
        call    fact
        mul     a1, a0, s0
.LBB0_2:
        add     a0, zero, a1
        ld      s0, 0(sp)
        ld      ra, 8(sp)
        addi    sp, sp, 16
        ret
```
