#	RISC-V Example
#	function

	.data


	.globl	main
	.text

main:	
	
	# function call
	li	a0, -10
	jal	ra, abs
	
	# system call to exit with code 0
exit:	li	a7, 10			# li is a pseudoinstruction
	ecall				# system call


abs:	# when the function is called, a0 is n
	bge	a0, x0, abs_exit	# n < 0?
	sub	a0, x0, a0		# rv = -n
abs_exit:
	jalr	x0, 0(ra)		
