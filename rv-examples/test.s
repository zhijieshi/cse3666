#       RISC-V Example in RARS
#       Comments.  Anything after # is comments.

        # .data starts data segments
        .data
        # msg is a label to a string, an ASCII string ends with a NUL character
        # we can also use ".string", instead of ".asciz"
msg:    .asciz  "Hello, welcome to CSE 3666.\n"

        # .text starts code segments
        .text
        .globl  main    # declare main to be global. Note it is ".globl"

        # define a label, in code segment
main:   

	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
		xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	xor 	x4, x8, x10
	lw   x16, -4(x10)
        la      a0, msg         # load the address of the string
        li      a7, 4           # set the system call number. 4 for printing a string
        ecall                   # system call
	not	a0, a0
	blt     x6, x7, main
        # system call 10: exit with code 0
exit:   li      a7, 10          # set the system call number
        ecall                   # system call
