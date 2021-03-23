#	RISC-V Example in RARS

	.text
	.globl	main	

main:	
	# compute sum(range(100))
	# method 1: check condition at the top of the loop 

	addi	s0, x0, 0
	addi	s1, x0, 0	
	addi	s2, x0, 100
loop:	bge	s0, s2, exit
	add	s1, s1, s0
	addi	s0, s0, 1
	beq	x0, x0, loop
	
	# exit(0)
exit:	li	a7, 10
	ecall
