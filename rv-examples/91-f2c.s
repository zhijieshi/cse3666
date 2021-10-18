#       CSE 3666 f2c
# 	load float constants from memory

        .globl  main

	.data
	.align 2
# constants used in calculation
fconst: .float 5, 9, 32
	
fv:	.float	100

        .text
main:   

	la	s0, fv
	flw	fa0, 0(s0)
	jal	f2c

	li	a7, 2		# print float
        ecall

exit:   addi    a7, x0, 10      
        ecall

# float f2c(float f)
f2c: 	
	la	t0, fconst
	flw     f0, 0(t0)	# load 5
	flw     f1, 4(t0)	# load 9
	fdiv.s  f0, f0, f1	# compute 5/9
	flw     f1, 8(t0)# load 32     
	fsub.s  f10, f10, f1	# compute fahr - 32
	fmul.s  f10, f0, f10	# multiply with 5/9
	jalr    x0, 0(ra)
	jr	ra
