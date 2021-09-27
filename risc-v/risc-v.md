# RISC-V Resources

## RISC-V 

* [RISC-V Official spec](https://riscv.org/technical/specifications/) 
We only need Volumn 1.
* [RISC-V Github repo](https://github.com/riscv/riscv-isa-manual)
* [List of RISC-V instructions](https://msyksphinz-self.github.io/riscv-isadoc/html/index.html)
* [Calling convenion](https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc)
* [RISC-V assembly manual](https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm.md). Incomplete.

## RARS

Of course, RARS goes first. RARS is written in Java and built upon MARS, 
a MIPS simulator, which we used in CSE 3666 before switching to RISC-V.

[RARS Github repo is here.](https://github.com/TheThirdOne/rars)


## Online simulator at Cornell

Cornell has an online simulator for their CS3410. 

[Link is here](https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/) 

## Venus

"venus is a RISC-V instruction set simulator built for education."

Venus is written in Kotlin.

[Venus Github repo is here.](https://github.com/kvakil/venus)

UC Berkeley CS61C has an online terminal. 
[CS61C Venus Web Terminal](https://venus.cs61c.org/)

## rv8

[rv8](https://michaeljclark.github.io/) is a RSIC-V simulator for x86-64.  The
rv8 binary translator performs JIT (Just In Time) translation of RISC-V code to
X86-64 code.

## QEMU

[QEMU](https://wiki.qemu.org/Documentation/Platforms/RISCV) supports RISC-V.
You can run Linux on a simulated RISC-V core. 
[Here are some instructions.](https://risc-v-getting-started-guide.readthedocs.io/en/latest/linux-qemu.html)

