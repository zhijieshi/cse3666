# RISC-V Example in RARS
# Read an integer (in decimal) and print it in different formats
# For UConn CSE 3666, by Jerry Shi
      
        # .text starts code segments
        .text
main:   
        # system call
        # 5: read an integer
        # see the help file for more system calls
        # enter 0 to get out of the loop
        addi    a7, x0, 5
        ecall

        # the retun value is stored in a0
        addi    s1, a0, 0

        # print the value in different formats, 
        # by the order of syscall numbers

        # decimal
        addi    a7, x0, 1 
        ecall

        # print new line
        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 

        # hex
        addi    a0, s1, 0
        addi    a7, x0, 34
        ecall

        # print new line
        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 

        # bin
        addi    a0, s1, 0
        addi    a7, x0, 35
        ecall

        # print new line
        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 

        # unsigned
        addi    a0, s1, 0
        addi    a7, x0, 36
        ecall

        # print new line
        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 
         
        # system call to exit with code 0
        addi    a7, x0, 10
        ecall
