## Pitfalls  

* Use large immediates. The immeidate and offset in The assembler may report
  error and abort.

* Forget to skip the else block. The else block is always executed.

* Forget to update the loop control variable. Infinite loop.

* Conditions in if or while structure are inverted For example, `<` becomes
  `>=`

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
    

