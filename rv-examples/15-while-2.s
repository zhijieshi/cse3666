#	RISC-V Example in RARS

	.text

main:	
	# compute sum(range(100))
	# method 2: check condition at the bottom of the loop 

        addi    s0, x0, 0       # reset the counter 
        addi    s1, x0, 0       # reset the sum 
        addi    s2, x0, 100     # upper limit 

	beq	x0, x0,	test    # go check condition

loop:	add	s1, s1, s0
	addi	s0, s0, 1
test:	blt	s0, s2, loop    # do the loop if condition is true
	
	# exit(0)
exit:   addi    a7, x0, 10
	ecall
