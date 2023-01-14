#       RISC-V Example in RARS
#       Comments.  Anything after # is comments.

        # .data starts data segments
        .data
        # msg is a label in data segment 
        # .asciz specifies an ASCII string ends with a NUL character
        # we can also use ".string", instead of ".asciz"
msg:    .asciz  "Hello, welcome to CSE 3666.\n"

        # .text starts code segments
        .text
        .globl  main    # declare main to be global. Note it is ".globl"

        # define a label, in code segment
main:   
        la      a0, msg         # load the address of the string
        addi    a7, zero, 4     # set the system call number. 4 for printing a string
        ecall                   # system call

        # system call 10: exit with code 0
        addi    a7, zero, 10    # set the system call number
        ecall                   # system call
