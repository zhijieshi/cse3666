# UConn CSE 3666 Example 

        .data   
dst:    .space  100
src:    .string "this is an example string"

        .text
main: 

        la      a0, dst
        la      a1, src
        jal     strcpy

        li      a7, 10
        ecall

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
strcpy: 
        # d is a0, s is a1
        addi    t2, a0, 0       # t2: saved_d

        # use t0 for c
loop:
        lbu     t0, (a1)
        sb      t0, (a0)          
        addi    a1, a1, 1
        addi    a0, a0, 1
        bne     t0, x0, loop
exit:  
        addi    a0, t2, 0       # return d
        jalr    x0, ra, 0

