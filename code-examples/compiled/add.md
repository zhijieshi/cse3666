
Here is a simple C function that adds two arguments.
```
long long add(long long a, long long b)
{
	long long x;

	x = a + b;

	return x;
}
```

Compiled with clang, without optimization.
```
add:                                    # @add
        addi    sp, sp, -48
        sd      ra, 40(sp)
        sd      s0, 32(sp)
        addi    s0, sp, 48
        sd      a0, -24(s0)
        sd      a1, -32(s0)
        ld      a0, -24(s0)
        ld      a1, -32(s0)
        add     a0, a0, a1
        sd      a0, -40(s0)
        ld      a0, -40(s0)
        ld      s0, 32(sp)
        ld      ra, 40(sp)
        addi    sp, sp, 48
        ret
```

Compiled with clang, with '-O'.

```
add:                                    # @add
        add     a0, a0, a1
        ret
```
