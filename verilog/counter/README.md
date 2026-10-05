# A 16-bit Counter

To compile: 

```bash
iverilog *.v
# or the following 
iverilog counter.v tb_counter.v 
```

To run: 

```bash
vvp ./a.out
# more options
vvp ./a.out +iv=152 +step=4
# use +trace to generate the vcd file
vvp ./a.out +iv=256 +step=4 +trace
```
