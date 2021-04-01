from myhdl import *

# based on the counter example from MyHDL repo

@block
def counter(count, deltain, load, loadin, clock, reset):
    """ Incrementer with enable.

    count   -- output
    deltain -- control input, increment amount
    loadin  -- the bits to be loaded into counter when load is 1
    load    -- load control
    clock   -- clock input
    reset   -- asynchronous reset input
    """

    adderout = Signal(modbv(0)[len(count):])
    muxout = Signal(intbv(0)[len(count):])

    @always_comb
    def adder():
        adderout.next = count + deltain

    @always_comb
    def mux():
        if load:
            muxout.next = loadin   
        else:
            muxout.next = adderout

    @always_seq(clock.posedge, reset=reset)
    def register():
        count.next = muxout

    return register, mux, adder

