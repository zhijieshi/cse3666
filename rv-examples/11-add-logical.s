# For UConn CSE 3666, by Jerry Shi
      
        # .text starts code segments
        .text

main:   
        # try to find out the bits in destination registers and 
        # compare them with the results in RARS 
        
        addi    x1, zero, 0x5A5

        slli    x2, x1, 12
        
        add     x3, x1, x2
        
        slli    x4, x3, 12

        add     x5, x4, x1

        srli    x6, x5, 28

        srai    x7, x5, 28        
        
        # pay attention to sign extension
        ori     x8, x1, 0xFFFFFF00

        andi    x9, x1, 0xF
      
        xori    x10, x1, -1
        
        add     x11, x10, x10
        
        # system call to exit with code 0
exit:   addi    a7, zero, 10
        ecall
