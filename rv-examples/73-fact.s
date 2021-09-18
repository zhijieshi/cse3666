# RISC-V example
# fact 
        .text
        .globl  main

main:   
        li      a0, 5
        jal     ra, fact
        
        # system call to exit with code 0
        li      a7, 10         # li is a pseudoinstruction
        ecall                  # system call

# int fact(int n)
fact:
        addi    sp, sp, -8     # adjust stack for 2 words
        sw      ra, 4(sp)      # save return address
        sw      a0, 0(sp)      # save argument

	# if n >= 1 goto ELSE
        addi    t0, zero, 1
        bge     a0, t0, ELSE   # go to else branch if n >= 1
        
        # return 1
        addi    a0, zero, 1    # Otherwise, a0 = 1
        beq     x0, x0, EXIT   # goto exit

	# n >= 1
ELSE: 
        addi    a0, a0, -1     # else decrement n  
        jal     ra, fact       # recursive call
        lw      t0, 0(sp)      # restore original n
        mul     a0, a0, t0     # n * (n-1)!
EXIT:   
        lw      ra, 4(sp)      # restore return address
        addi    sp, sp, 8      # pop 2 words from stack
        jalr    x0, 0(ra)      # and return

