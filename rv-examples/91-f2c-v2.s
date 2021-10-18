#       CSE 3666 f2c
# 	Use fcvt instructions in this version

        .globl  main

	.data
	.align 2
	
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
	li	t0, 5
	li	t1, 9
	fcvt.s.w ft0, t0
	fcvt.s.w ft1, t1
	fdiv.s  ft0, ft0, ft1	# compute 5/9
	li	t1, 32
	fcvt.s.w ft1, t1
	fsub.s  fa0, fa0, ft1	# compute fahr - 32
	fmul.s  fa0, ft0, fa0	# multiply with 5/9
	jr	ra
