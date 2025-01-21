#       RISC-V Example in RARS

        # .text starts code segments
        .text

        # define a label
main:   
        # performing  100 + 300 - 450
        
        addi    s1, x0, 100
        addi    s2, x0, 300
        addi    s3, x0, -450
        add     s1, s1, s2
        add     s1, s1, s3
        
        # or we can use three addi instructions
        addi    s3, x0, 100
        addi    s3, s3, 300
        andi    s3, s3, -450

        # we can specify the immediate in different ways
        # t0, t1, and t2 will have the same value
        # 0000 0000 0000 0000 0000 0000 0011 0000
        addi    t0, zero, '0'
        addi    t1, zero, 0x30
        addi    t2, zero, 48

        # t3 will be different
        addi    t3, zero, 0

        # system call to exit with code 0
exit:   addi    a7, zero, 10
        ecall                           # system call
