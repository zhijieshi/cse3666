# Example of handling arguments in RARS
# The command to run the program is 
#       java -jar rars.jar args.s pa arg1 Hello world

        .text

        .global main

main:   
        # print a0, the number of arguments
        addi    a7, zero, 1         # argc
        ecall 

        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 

        # print each argument
        addi    s0, a0, 0
        addi    s1, a1, 0           # argv
        addi    t0, x0, 0           # i
loop:
        beq     t0, s0, exit        # exit if i == argc
        slli    t1, t0, 2
        add     t1, s1, t1          # addr of argv[i]
        lw      a0, 0(t1)           # load argv[i] into a0 
        addi    a7, zero, 4         # print the argument
        ecall

        addi    a0, x0, '\n'
        addi    a7, x0, 11
        ecall 

        addi    t0, t0, 1           # i += 1
        beq     x0, x0, loop

exit:
        addi    a7, zero, 10
        ecall 
