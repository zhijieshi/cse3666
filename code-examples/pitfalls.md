## Pitfalls  

* Use large immediates. The immeidate and offset in The assembler may report
  error and abort.

```
	# Some assemblers may do sign extension and load -1 into t0 
	# RARS considers this is unsigned and report error
	addi	t0, x0, 0xFFF		

	# All 32 bits are specified
	# RARS accepts it as -1
	addi	t0, x0, 0xFFFFFFFF	
```

* Forget to skip the else block. The else block is always executed.

* Forget to update the loop control variable. Infinite loop.

* Forget to go back to the top of a loop. 

* Conditions in if or while structure are inverted For example, `<` becomes
  `>=`

* When accessing word arrays, forget to multiply the index by 4.

* When accessing characters in a string, multiply the index by 4. Since
  each character takes only one byte, we do not scale the index for strings. 

## Unnecessary instructions

This does not affect the correctness, but not code is not elegant and rquires
more registers. It shows your coding skills (to your future interviewer)

* Copy values between registers unnecessarily.

* Use extra registers to keep 0 and 1 for comparison. `x0` is always 0. To
  check if a condition is true, compare a register with `x0` with a `bne`
  instruction.

```
    # Instead of doing 
    addi    t1, x0, 1
    beq     s1, t1, L1

    # Do this
    bne     s1, x0, L1
```
    

