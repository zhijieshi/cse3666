## Reverse byte order

There are several ways. 

* We could move byte to byte

```
    # Suppose bytes are ABCDEFGH

    # Here are the values to be produced
    # operations can be placed in a loop
    # 0000000H  andi
    # 0000000G  shift andi
    # 000000H0  shfit
    # 000000HG  or
    # 0000000F  shift andi
    # 00000HG0  shift
    # 00000HGF  or
    # and so on, about 4 instructions per byte

    # or
    # ABCDEFGH  start
    # H0000000  
    # 0000000G  shift andi
    # HG000000  shift or
    # 0000000F  shift andi
    # HGF00000  shift or
    # and so on, about 4 instructions per byte

```

* Save the number into memory and we can access each byte

* Do it recursively in a register.

```
    # reverse byte order in s0
    # Suppose bytes are ABCDEFGH

    # swap words
    slli    t0, s0, 32 
    srli    t1, s0, 32 
    or      s0, t0, t1

    # now s0 has 

    # swap halfwords in each word
    # s0 is EFGHABCD
    # idea:
    # get EF00AB00, and then 00EF00AB  
    # get 00GH00CD, and then GH00CD00
    # set s0 to GHEFCDAB

    # swap bytes in each halfwords
    # s0 will be HGFEDCBA
    # 13 instructions if masks are already generated
```
