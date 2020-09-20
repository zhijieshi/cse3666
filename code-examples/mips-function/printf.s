#	printf function
## Daniel J. Ellard -- 03/13/94
## printf.asm--
## an implementation of a simple printf work-alike.

## printf--
## A simple printf-like function. Understands just the basic forms
## of the %s, %d, %c, and %% formats, and can only have 3 embedded
## formats (so that all of the parameters are passed in registers).
## If there are more than 3 embedded formats, all but the first 3 are
## completely ignored (not even printed).
## Register Usage:
## $a0,$s0 - pointer to format string
## $a1,$s1 - format argument 1 (optional)
## $a2,$s2 - format argument 2 (optional)
## $a3,$s3 - format argument 3 (optional)
## $s4 - count of formats processed.
## $s5 - char at $s4.
## $s6 - pointer to printf buffer
##
	.text
	.globl printf

printf:
	subu $sp, $sp, 36 # set up the stack frame,
	sw $ra, 32($sp) # saving the local environment.
	sw $fp, 28($sp)
	sw $s0, 24($sp)
	sw $s1, 20($sp)
	sw $s2, 16($sp)
	sw $s3, 12($sp)
	sw $s4, 8($sp)
	sw $s5, 4($sp)
	sw $s6, 0($sp)
	addu $fp, $sp, 36

	# grab the arguments:
	move $s0, $a0 # fmt string
	move $s1, $a1 # arg1 (optional)
	move $s2, $a2 # arg2 (optional)
	move $s3, $a3 # arg3 (optional)

	li $s4, 0 # set # of formats = 0

	# sent up the temporay buffer 36 bytes
	# it was defined as a global buffer. -- Z. Shi
	subu $sp, $sp, 36	
	move $s6, $sp
	#la $s6, printf_buf # set s6 = base of printf buffer.

printf_loop: # process each character in the fmt:
	lb $s5, 0($s0) # get the next character, and then
	addu $s0, $s0, 1 # bump up $s0 to the next character.

	beq $s5, '%', printf_fmt # if the fmt character, then do fmt.
	beq $0, $s5, printf_end # if zero, then go to end.

printf_putc:
	sb $s5, 0($s6) # otherwise, just put this char
	sb $0, 1($s6) # into the printf buffer,
	move $a0, $s6 # and then print it with the
	li $v0, 4 # print_str syscall
	syscall

	b printf_loop # loop on.

printf_fmt:
	lb $s5, 0($s0) # see what the fmt character is,
	addu $s0, $s0, 1 # and bump up the pointer.

	#beq $s4, 3, printf_loop # if we've already processed 3 args,
	beq $s4, 3, printf_invalidtag # 

	# then *ignore* this fmt.
	beq $s5, 'd', printf_int # if 'd', print as a decimal integer.
	beq $s5, 'u', printf_intu # if 'u', print as an unsigned decimal integer.
	beq $s5, 'x', printf_intx # if 'x', print as an unsigned integer.
	beq $s5, 's', printf_str # if 's', print as a string.
	beq $s5, 'c', printf_char # if 'c', print as a ASCII char.
	beq $s5, '%', printf_perc # if '%', print a '%'
	#b printf_loop # otherwise, just continue.

	# Added by Z. Shi 
printf_invalidtag: # print out invalid tags
	sb $0, 2($s6) # the a null.
	sb $s5, 1($s6) # the tag specifier
	li $s5, '%'   # %,
	sb $s5, 0($s6) 
	move $a0, $s6 # and then do a print_str syscall
	li $v0, 4 # on the buffer.
	syscall
	b printf_loop # branch to printf_loop

printf_shift_args: # shift over the fmt args,
	move $s1, $s2 # $s1 = $s2
	move $s2, $s3 # $s2 = $s3

	add $s4, $s4, 1 # increment # of args processed.

	b printf_loop # and continue the main loop.

printf_int: # deal with a %d:
	move $a0, $s1 # do a print_int syscall of $s1.
	li $v0, 1
	syscall
	b printf_shift_args # branch to printf_shift_args

printf_intu: # deal with a %u: Added by Z. Shi
	move $a0, $s1 	# do a print_int syscall of $s1.
	li $v0, 36	# 36 for unsigned integer
	syscall
	b printf_shift_args # branch to printf_shift_args

printf_intx: # deal with a %u: Added by Z. Shi
	move $a0, $s1 	# do a print_int syscall of $s1.
	li $v0, 34	# 36 for unsigned integer
	syscall
	b printf_shift_args # branch to printf_shift_args

printf_str: # deal with a %s:
	move $a0, $s1 # do a print_string syscall of $s1.
	li $v0, 4
	syscall
	b printf_shift_args # branch to printf_shift_args

printf_char: # deal with a %c:
	sb $s1, 0($s6) # fill the buffer in with byte $s1,
	sb $0, 1($s6) # and then a null.
	move $a0, $s6 # and then do a print_str syscall
	li $v0, 4 # on the buffer.
	syscall
	b printf_shift_args # branch to printf_shift_args

printf_perc: # deal with a %%:
	li $s5, '%' # (this is redundant)
	sb $s5, 0($s6) # fill the buffer in with byte %,
	sb $0, 1($s6) # and then a null.
	move $a0, $s6 # and then do a print_str syscall
	li $v0, 4 # on the buffer.
	syscall
	b printf_loop # branch to printf_loop

printf_end:
	subu $sp, $fp, 36	
	lw $ra, 32($sp) # restore the prior environment:
	lw $fp, 28($sp)
	lw $s0, 24($sp)
	lw $s1, 20($sp)
	lw $s2, 16($sp)
	lw $s3, 12($sp)
	lw $s4, 8($sp)
	lw $s5, 4($sp)
	lw $s6, 0($sp)
	addu $sp, $sp, 36 # release the stack frame.
	jr $ra # return.

	## end of printf.asm

