# A 16-bit Counter

To compile: 

    iverilog *.v
    # or the following 
    iverilog counter.v tb_counter.v 

To run: 

    vvp ./a.out
    # more options
    vvp ./a.out +iv=152 +step=4
    # use +trace to generate the vcd file
