#	RISC-V Example in RARS
#	Comments.  Anything after # is comments.

	# .text starts code segments
	.text
	.globl	main	# declare main to be global. Note it is ".globl"

	# define a label
main:	
	# performing  100 + 300 - 450
	
	addi	s1, x0, 100
	addi	s2, x0, 300
	addi	s3, x0, -450
	add	s1, s1, s2
	add	s1, s1, s3
	
	# or we can use three addi instructions
	addi	s3, x0, 100
	addi	s3, s3, 300
	andi    s3, s3, -450
	
	# system call to exit with code 0
exit:	li	a7, 10			# li is a pseudoinstruction
	ecall				# system call
