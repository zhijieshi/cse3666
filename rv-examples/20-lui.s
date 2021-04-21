#	RISC-V Example
#	LUI 

	.data

d:	.space	64
e:	.word   1

	.globl	main
	.text

main:	
	# load 0x12345678 
	lui	t0, 0x12345		# higher 20 bits
	addi	t0, t0, 0x678		# lower 12 bits
		
	# load 0x89ABCDEF
	lui	t1, 0x89ABC
	addi	t1, t1, 0xFFFFFDEF	# 0xDEF, sign extended 
	# note that t1 does not have the correct value

	# adjust the upper 20 bits
	lui	t2, 0x89ABD	
	addi	t2, t2, 0xFFFFFDEF	# 0xDEF, sign extended
	
	# use pseudo instruction to load a 32-bit value
	# assembler adjusts the upper 20 bits
	li	t3, 0x89ABCDEF
	
	# use pseudoinstruction to load an address
	# la is converted to AUIPC and ADDI
	la	s1, d
	la	s2, e

		# system call to exit with code 0
exit:	li	a7, 10			# li is a pseudoinstruction
	ecall				# system call
