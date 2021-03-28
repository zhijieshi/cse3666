// Here is a simple C function
int add(int a, int b)
{
	int x = 0;

	x = a + b;

	return x;
}

# Compiled MIPS code. No optimization. 
# Directives are removed.
add:
	# allocate space 
	addiu   $sp, $sp, -24

	# save $fp
	sw  	$fp, 20($sp)
	# note that $fp does not point the first word.
	# instead, it is the current $sp (pointing to the last wrod).
	move    $fp, $sp

	# save arguments a and b onto the stack
	# the space is allocated by the caller
	sw  	$4, 24($fp)
	sw  	$5, 28($fp)

	# x = 0   x's is located at 8($fp)
	sw  	$0, 8($fp)	

	# load a and b
	lw  	$3, 24($fp)
	lw  	$2, 28($fp)

	# x = a + b 
	addu    $2, $3, $2
	sw  	$2, 8($fp)

	# set return value
	lw  	$2, 8($fp)

	# restore stack 
	move    $sp, $fp

	lw  	$fp, 20($sp)
	addiu   $sp, $sp, 24

	jr  $31
	nop			# we will learn later why nop is needed here

# explanation of some directives

#    	.frame   framereg, framesize, returnreg
# argument 1: framereg is normally $sp or $fp; 
# argument 2: the size of the frame, and
# argument 3: the register that holds the return address (almost always $31).
#    .frame  $fp, 24, $31      # vars= 8, regs= 1/0, args= 0, gp= 8

# 	.mask    bitmask, frameoffset
# argument 1: 32-bit mask indicates what regiters are saved. 
# argument 2: offset for the location where the first register (from higher numbered) is saved.  
# In this example, only $fp is saved. So only bit 30 is set (0x40000000).
# $fp is saved at the location (framesize - 4)($fp), which is 20($fp).
#    .mask   0x40000000, -4
