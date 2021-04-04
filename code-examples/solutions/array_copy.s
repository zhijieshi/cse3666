# UConn CSE 3666 example
# array_copy

# for (i = 0; i < 100; i ++)
#        B[i] = A[i];

# i : s1
# A : s2
# B : s3

# study the two versions discussed in lecture first

# array version
# use scaled loop counter

        li      s4, 800         # end
        li      s1, 0           # i
loop:
        # s1 is already multiplied by 8
        add     t2, s1, s2      # compute addr of A[i]
        ld      t1, (s2)
        add     t3, s1, s3      # compute addr of B[i]
        sd      t1, (s3)
        addi    s1, s1, 8
        bne     s1, s4, loop    # blt works too 


# pointer version

# pa = A, pend = &A[100], pb = B;
# while (pa < pend)
#	*pb ++ = *pa ++;

	li   	s1, 800
	add	s4, s1, s2  	# pend = &A[100]
	mv	t2, s2		# pa = A
	mv	t3, s3 	        # pb = B
loop:
	ld	t0, (t2)	# t0 = *pa
	sd	t0, (t3) 	# *pb = t0
	addi	t2, t2, 8	# pa ++
	addi	t3, t3, 8 	# pb ++
	bne	t2, s4, loop

