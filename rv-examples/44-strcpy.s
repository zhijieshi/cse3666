# UConn CSE 3666 Example 

        .data   
dst:    .space  64
src:    .string "this is an example string"

        .text
main: 
#        la      a0, dst
	lui     a0, 0x10010
        addi    a1, a0, 64
        jal     ra, strcpy

        addi    a7, zero, 10
        ecall

# copy string s to d and return d
# char *strcpy(char *d, char *s) 
# use array syntax
# char *strcpy(char *d, char *s) 
# {
#       char c;
#       int i = 0;
#       do {
#               c = s[i];
#               d[i] = c;
#               i += 1;
#       } while (c);
#       return d;
# }
strcpy: 
        # d is a0, s is a1
        addi    a2, x0, 0       # i = 0

        # use t3 for c
loop:
        add     t1, a1, a2
        lbu     t3, 0(t1)
        add     t0, a0, a2
        sb      t3, 0(t0)          
        addi    a2, a2, 1
        bne     t3, x0, loop
exit:  
        # a0 is already set
        jalr    x0, ra, 0

# copy string s to d and return d
# char *strcpy(char *d, char *s) 
# {
#       char *saved_d = d;
#       char c;
#       do {
#               c = *s;
#               *d = c;
#               s += 1;
#               d += 1;
#       } while (c);
#       return saved_d;
# }

# leave function
# use pointers
strcpy1: 
        # d is a0, s is a1
        addi    t2, a0, 0       # t2: saved_d

        # use t0 for c
loop1:
        lbu     t0, 0(a1)
        sb      t0, 0(a0)          
        addi    a1, a1, 1
        addi    a0, a0, 1
        bne     t0, x0, loop
exit1:  
        addi    a0, t2, 0       # return d
        jalr    x0, ra, 0

