#	RISC-V Example in RARS

	# .text starts code segments
	.text
	.globl	main	# declare main to be global. Note it is ".globl"

main:	
	# s1, s2, and s3 will have the same bits 
	# 0000...0000 0011 0000
	addi  	s2, x0, '0'
	addi  	s3, x0, 48
	addi  	s4, x0, 0x30

	# s5 will be 0 
	add   	s5, x0, x0
	
	# system call to exit with code 0
exit:	li	a7, 10			# li is a pseudoinstruction
	ecall				# system call
