# RISC-V opcode

## RV32I

```
Location of fields:

funct7   Instr[3l:25]
rs2      Instr[24:20]
rs1      Instr[19:15]
funct3   Instr[14:12]
rd       Instr[11:7]
opcode   Instr[6:0]

## R-Type

        funct7       rs2 rs1 funct3 rd          opcode
add     0000000      rs2 rs1 000    rd          0110011(0x33)
sub     0100000      rs2 rs1 000    rd          0110011(0x33)
sll     0000000      rs2 rs1 001    rd          0110011(0x33)
slt     0000000      rs2 rs1 010    rd          0110011(0x33)
sltu    0000000      rs2 rs1 011    rd          0110011(0x33)
xor     0000000      rs2 rs1 100    rd          0110011(0x33)
srl     0000000      rs2 rs1 101    rd          0110011(0x33)
sra     0100000      rs2 rs1 101    rd          0110011(0x33)
or      0000000      rs2 rs1 110    rd          0110011(0x33)
and     0000000      rs2 rs1 111    rd          0110011(0x33)

## SB-Type

        funct7       rs2 rs1 funct3 rd          opcode
beq     imm[12|10:5] rs2 rs1 000    imm[4:1|11] 1100011(0x63)
bne     imm[12|10:5] rs2 rs1 001    imm[4:1|11] 1100011(0x63)
blt     imm[12|10:5] rs2 rs1 100    imm[4:1|11] 1100011(0x63)
bge     imm[12|10:5] rs2 rs1 101    imm[4:1|11] 1100011(0x63)
bltu    imm[12|10:5] rs2 rs1 110    imm[4:1|11] 1100011(0x63)
bgeu    imm[12|10:5] rs2 rs1 111    imm[4:1|11] 1100011(0x63)

## I-Type

sa5 is the 5-bit shift amount

        funct7       rs2 rs1 funct3 rd          opcode
                                           
lb      imm[11:0]        rs1 000    rd          0000011(0x03)
lh      imm[11:0]        rs1 001    rd          0000011(0x03)
lw      imm[11:0]        rs1 010    rd          0000011(0x03)
lbu     imm[11:0]        rs1 100    rd          0000011(0x03)
lhu     imm[11:0]        rs1 101    rd          0000011(0x03)
                                           
addi    imm[11:0]        rs1 000    rd          0010011(0x13)
slli    0000000      sa5 rs1 001    rd          0010011(0x13)
slti    imm[11:0]        rs1 010    rd          0010011(0x13)
sltiu   imm[11:0]        rs1 011    rd          0010011(0x13)
xori    imm[11:0]        rs1 100    rd          0010011(0x13)
srli    0000000      sa5 rs1 101    rd          0010011(0x13)
srai    0100000      sa5 rs1 101    rd          0010011(0x13)
ori     imm[11:0]        rs1 110    rd          0010011(0x13)
andi    imm[11:0]        rs1 111    rd          0010011(0x13)
                                            
jalr    imm[11:0]        rs1 000    rd          1100111(0x67)
                                            
## S-Type

        funct7       rs2 rs1 funct3 rd          opcode

sb      imm[11:5]    rs2 rs1 000    imm[4:0]    0100011(0x23)
sh      imm[11:5]    rs2 rs1 001    imm[4:0]    0100011(0x23)
sw      imm[11:5]    rs2 rs1 010    imm[4:0]    0100011(0x23)

## U-Type and UJ-Type 

        funct7       rs2 rs1 funct3 rd          opcode
auipc   imm[31:12]                  rd          0010111(0x17)
lui     imm[31:12]                  rd          0110111(0x37)
jal     imm[20|10:1|11|19:12]       rd          1101111(0x6F)  

```

## Links

* [RISC-V RV32I opcode](https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv32i)
* [RISC-V RV64I opcode](https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv64i).

