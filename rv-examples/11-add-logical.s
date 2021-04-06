# Test 64-bit operations in RARS
# For UConn CSE 3666, by Jerry Shi
      
        # .text starts code segments
        .text
        .globl  main    # declare main to be global. Note it is ".globl"

main:   
	# try to find out the bits in destination registers and 
	# compare them with the results in RARS 
	
	li	x1, 0x5A5

	slli	x2, x1, 12
	
	add	x3, x1, x2
	
	slli	x4, x3, 24
	
	add	x5, x3, x4

        slli	x6, x5, 44
        
        add	x7, x5, x6
        
        or	x8, x5, x6

        add	x9, x7, x7

        and	x10, x8, x9
        
        xori	x11, x10, -1
        
        # system call to exit with code 0
exit:   li      a7, 10                  # li is a pseudoinstruction
        ecall                           # system call
