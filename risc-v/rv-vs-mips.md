## RISC-V vs MIPS

RISC-V has many extensions. In CSE 3666, we mostly study RV32I, the 32-bit base
instruction set of RISC-V. The instructions are similar to those in MIPS.

### Registers

RISC-V has 32 general-purpose registers, denoted as `x0`, `x1`, and so on.
Like in MIPS, register 0 `x0` is always 0. 

Register names are also very similar to MIPS register names, but there is no
`$`.  For example, write `s0`, instead of `$s0`, in RISC-V.
See the table on [this page](rv-registers.md) for
the list of register names and their numbers.

### Instructions

The immediate field in instructions like ADDI has only 12 bits. In MIPS, the immediate has 16 bits.

The immediate is always signed. In MIPS, logical instructions have unsigned immediate.

LUI (load upper immediate) has a 20-bit immediate. Like in MIPS, LUI and ADDI pair can 
load any 32-bit constant in a register.

Load/store instructions are the same. Words, half words, and bytes are
supported.

The memory addressing mode is displacement, like `-8(s0)`. Always include 
the offset, even if it is 0, for example, `0(s0)`.

RISC-V has more branch instructions, including BEQ and BNE.

    * BEQ: branch if equal.
    * BNE: branch if not equal
    * BLT: branch if less than
    * BGE: branch if greater than
    * BLTU: branch if less than, unsigned
    * BGEU: branch if greater than, unsigned

There is no JUMP instruction in RISC-V. JUMP is done by Jump and Link, 
with the destination register set to `x0` (recall that `x0` is always 0).

The following are commonly used RISC-V instructions in CSE 3666.

```
    # arithmetic and logical

    add     x1, x2, x3
    sub     x1, x2, x3
    and     x1, x2, x3
    or      x1, x2, x3
    xor     x1, x2, x3
    sll     x1, x2, x3      # MIPS: sllv, shift amount is in x3
    srl     x1, x2, x3      # MIPS: srlv, shift amount is in x3
    sra     x1, x2, x3      # MIPS: srav, shift amount is in x3
    xori    x1, x2, -1      # NOT is a pseudoinstruction 
   
    # each of the above, except sub, has the immediate version 
    # immediate is 12-bit 2's complement number

    addi    x1, x2, 100     
    andi    x1, x2, 0xF
    ori     x1, x2, 0xFF 
    xori    x1, x2, -1      
    slli    x1, x2, 10      # MIPS: sll $1, $2, 10 
    srli    x1, x2, 10      # MIPS: srl $1, $2, 10 
    srai    x1, x2, 10      # MIPS: sra $1, $2, 10 

    # dealing with large constants

    lui     x1, immd20      # deposit 20 bits to the higher end of a word, sign extended to 64 bits

    # load/store

    lw      x1, 100(x2)     # load doublewords
    sw      x1, 100(x2)     # store doublewords

    # load/store instructions for other data types include
    # lh, lhu, sh       halfwords
    # lb, lbu, sb       bytes

    # branches

    beq     x1, x2, L       # branch if equal
    bne     x1, x2, L       # branch if not equal
    blt     x1, x2, L       # branch if less than 
    bge     x1, x2, L       # branch if greater than or equal
    bltu    x1, x2, L       # branch if less than, unsigned
    bgeu    x1, x2, L       # branch if greater than or equal, unsigned

    # function call/return and jump

    jal     x1, funcion     # jump and link
    jalr    x1, 0(x2)       # jump and link to the address in x2

    # the following two are pseudoinstructions
    j       L               # jal  x0, L
    jr      x2              # jalr x0, 0(x2) 
```

### Encoding

RISC-V instruction encoding is a little more complicated than MIPS.

The opcode has 7 bits. There are a few function code fields (funct) of different sizes.

Brief summary: 

    *  R-Type: funct7 (7-bit), rs2, rs1, funct3 (3-bit), rd, opcode
    *  I-Type: immd (12-bit), rs1, funct3, rd, opcode
    *  S-Type: immd (7-bit), rs2, rs1, funct3, immd (5-bit), opcode
    *  SB-Type (for branches): immd (7-bit), rs2, rs1, funct3, immd (5-bit), opcode
    *  U-Type: immd (20-bit), rd, opcode
    *  UJ-Type: immd (20-bit), rd, opcode

### Calling convention

The first eight arguments are placed in registers `a0` to `a7`.

The return values are placed in `a0` and `a1`.

The a and t registers are not preserved through functino calls:
`a0` to `a7`, and `t0` to `t6`.

`x1` is `ra`.
`x2` is `sp`.
`x3` is `gp`.
`x8` is `fp` (and also `s0`).

### Floating-Point support

To be added.

