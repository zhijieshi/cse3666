#       RISC-V Example in RARS

        .text

main:   
        # compute sum(range(100))
        # method 1: check condition at the top of the loop 

        addi    s0, x0, 0      # reset the counter 
        addi    s1, x0, 0      # reset the sum 
        addi    s2, x0, 100    # upper limit 

loop:   bge     s0, s2, exit    # check condition 
        add     s1, s1, s0
        addi    s0, s0, 1       # increment the counter
        beq     x0, x0, loop    # go back and check condition
        
        # exit(0)
exit:   addi    a7, x0, 10
        ecall
