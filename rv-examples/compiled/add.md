Here is a simple C function that adds two arguments.

```c
int add(int a, int b)
{
	int x;

	x = a + b;

	return x;
}
```

Compiled with clang, without optimization.
```
add:                                    # @add
        addi    sp, sp, -32
        sw      ra, 28(sp)
        sw      s0, 24(sp)
        addi    s0, sp, 32
        sw      a0, -12(s0)
        sw      a1, -16(s0)
        lw      a0, -12(s0)
        lw      a1, -16(s0)
        add     a0, a0, a1
        sw      a0, -20(s0)
        lw      a0, -20(s0)
        lw      s0, 24(sp)
        lw      ra, 28(sp)
        addi    sp, sp, 32
        ret
```

Compiled with clang, with '-O'.

```
add:                                    # @add
        add     a0, a0, a1
        ret
```
