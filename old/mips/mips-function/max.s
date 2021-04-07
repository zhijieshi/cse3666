	.text
	.globl myabs, max

# int myabs(int n)
# {
#	int	rv = n;
#	if (n < 0) 
#		rv = -n; 
#	return rv;
# }

myabs:	# when the function is called, $a0 is n
	add	$v0, $a0, $0	# rv = n
	slt	$t0, $a0, $0	# n < 0?
	beq	$t0, $0, exit	# not ture, goto exit
	sub	$v0, $0, $a0	# rv = -n
exit:
	jr	$ra


# more functions, including main, can be defined
# For example, we can define a max function 

# int max(int a, int b) 
# {
#	return (a > b) ? a : b; 
# }

# 
max:	# when the function is called, $a0 is a, $a1 is b 
	add	$v0, $a0, $0	# rv = a
	slt	$at, $a1, $a0	# a > b ?   doing b < a ? 
	bne	$at, $0, max_exit   # if true, return a (in $v0)
	add	$v0, $a1, $0	# move b to $v0
max_exit:
	jr	$ra

