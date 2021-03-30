# RISC-V Example in RARS
# Read an integer (in decimal) and print it in different formats
# For UConn CSE 3666, by Jerry Shi
      
        # .text starts code segments
        .text
        .globl  main    # declare main to be global. Note it is ".globl"


main:   
        # system call
        # 5: read an integer
        # see the help file for more system calls
        # enter 0 to get out of the loop
        addi    a7, x0, 5
        ecall

        # the retun value is stored in a0
        mv      s1, a0

        # print the value in different formats, 
        # by the order of syscall numbers
        # also, use li pseudoinstruction

        # decimal
        li      a7, 1 
        ecall

        # print new line
        li      a0, '\n'
        li      a7, 11
        ecall 

        # hex
        mv      a0, s1
        li      a7, 34 
        ecall

        # print new line
        li      a0, '\n'
        li      a7, 11
        ecall 

        # bin
        mv      a0, s1
        li      a7, 35
        ecall

        # print new line
        li      a0, '\n'
        li      a7, 11
        ecall 

        # unsigned
        mv      a0, s1
        li      a7, 36
        ecall

        # print new line
        li      a0, '\n'
        li      a7, 11
        ecall 

        bne     s1, x0, main
         
        # system call to exit with code 0
exit:   li      a7, 10                  # li is a pseudoinstruction
        ecall                           # system call
