#       RISC-V Example
#       print a string by printing each character individually
#       using pointes in this example

        .data
str:    .string         "This is an ASCII string. Each charater is 1 byte. It ends with a null byte."

        .globl  main
        .text

main:   
        # Step through the instructions to see 
        # what each instruciton does

        # use pseudoinstruction to load an address
        # la is converted to AUIPC and ADDI
        la      s1, str

        # pseudocode
        # p = str     # char *p
        # while (*p != 0)
        #       print *p
        #       p += 1

        addi      t0, s1, 0             # p = str

loop:
        # check s[i] == 0?
        lb      a0, 0(t0)              # a0 = *p
        beq     a0, x0, after_loop     # if a0 == 0, exit from the loop

        # loop body

        # *p is in a0, no need to load it again
        # a7 should not change during sys calls
        # we could just set it once outside of the loop
        addi    a7, x0, 11		
        ecall

        addi    t0, t0, 1               # p += 1
        beq     x0, x0, loop

after_loop:

        # system call to exit with code 0
exit:   li      a7, 10                  # li is a pseudoinstruction
        ecall                           # system call
