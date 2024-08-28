## Reverse byte order

There are several ways. 

* We could move byte to byte.

```
    # Assume we first move the lowest bytes to the highest destination

    # here are the (intermediate) values produced in each step
    # Suppose bytes are 0xAABBCCDD
    s0 = AABBCCDD 
    t1 = 000000DD 
    t2 = DD000000   lowest byte is set
    t3 = 000000CC   
    t4 = 00CC0000   
    t5 = DDCC0000   the second byte is set
    t6 = 000000BB   
    t7 = 0000BB00
    t8 = DDCCBB00   the third byte
    t9 = 000000AA
    s0 = DDCCBBAA   the last byte
```

* Save the number into memory and we can access each byte.

* Do it recursively in a register.

```
    # reverse byte order in s0
    # Suppose bytes in s0 are 0xAABBCCDD

    # Step 1: swap halfwords. s0 becomes 0xCCDDAABB
    # Step 2: swap bytes in each halfword.  s0 becomes 0xDDCCBBAA
```
