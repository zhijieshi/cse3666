Summary of RISC-V encoding
============================

Format
-------

RISC-V instructions have 6 types of formats. SB is similar to S, with different
bit placements. UJ is similar to U, with different bit placements. Also, bit 0
in the offset (ofst) in SB and UJ is always 0 and is not included in the
instruction word. 

+--------+----------------+--------+--------+------+------------+-------+
|Type    |31-25           |24-20   |19-15   |14-12 |11-7        |6-0    |
+--------+----------------+--------+--------+------+------------+-------+
|R       |funct7          |rs2     |rs1     |funct3|rd          |opcode |
+--------+----------------+--------+--------+------+------------+-------+
|I       |imm[11:0]                |rs1     |funct3|rd          |opcode |
+--------+----------------+--------+--------+------+------------+-------+
|S       |imm[11:5]       |rs2     |rs1     |funct3|imm[4:0]    |opcode |
+--------+----------------+--------+--------+------+------------+-------+
|SB      |imm[12,10:5]    |rs2     |rs1     |funct3|imm[4:1,11] |opcode |
+--------+----------------+--------+--------+------+------------+-------+
|U       |imm[31:12]                               |rd          |opcode |
+--------+-----------------------------------------+------------+-------+
|UJ      |imm[20,10:1,11,19:12]                    |rd          |opcode |
+--------+-----------------------------------------+------------+-------+

Opcodes
--------

Opcodes are listed on the following pages.

* `rv32i-opcode.md <rv32i-opcode.md>`_

* `Opcodes in RISC-V repo <https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv32i>`_


