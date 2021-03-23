#	RISC-V Example in RARS

	.text
	.globl	main	

main:	
	# compute sum(range(100))
	# method 2: check condition at the bottom of the loop 

	addi	s0, x0, 0
	addi	s1, x0, 0	
	addi	s2, x0, 100
	beq	x0, x0,	test
loop:	add	s1, s1, s0
	addi	s0, s0, 1
test:	blt	s0, s2, loop
	
	# exit(0)
exit:	li	a7, 10
	ecall
