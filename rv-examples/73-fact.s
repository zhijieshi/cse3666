# RISC-V example
# fact 
        .text
        .globl  main

main:   
        li      a0, 19
        jal     ra, fact
        
        # set a breakpoint to see all bits in a0
        # 1 for decimal, 34 for hex
        li      a7, 34
        ecall

        # system call to exit with code 0
        li      a7, 10         # li is a pseudoinstruction
        ecall                  # system call

fact:
        addi    sp, sp, -16    # adjust stack for 2 DWs
        sd      ra, 8(sp)      # save return address
        sd      a0, 0(sp)      # save argument

	# if n >= 1 goto ELSE
        addi    t0, zero, 1
        bge     a0, t0, ELSE   # go to else branch if n >= 1
        
        # return 1
        addi    a0, zero, 1    # Otherwise, v0 = 1
        beq     x0, x0, EXIT   # goto exit

	# n >= 1
ELSE: 
        addi    a0, a0, -1     # else decrement n  
        jal     fact           # recursive call
        ld      t0, 0(sp)      # restore original n
        mul     a0, a0, t0     # n * (n-1)!
EXIT:   
        ld      ra, 8(sp)      # restore return address
        addi    sp, sp, 16     # pop 2 DWs from stack
        jalr    x0, 0(ra)      # and return


