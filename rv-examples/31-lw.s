#       RISC-V Example
#       LW

        .data

i:      .word   1
wa:     .word   10, 20, 30, 40, 50, 60, 70, 80, 90

        .globl  main
        .text

main:   
        # Step through the instructions to see 
        # what each instruciton does

        # use pseudoinstruction to load an address
        # la is converted to AUIPC and ADDI
        la      s1, i
        la      s2, wa

        # what is the value of s1 and t0? 
        # s1 is the address and t0 is the word from that address 
        lw      t0, 0(s1)

        #load wa[i] into t3
        slli    t1, t0, 2
        add     t2, t1, s2
        lw      t3, 0(t2)

        sw      t3, 0(s1)

        # system call to exit with code 0
exit:   li      a7, 10                  # li is a pseudoinstruction
        ecall                           # system call
