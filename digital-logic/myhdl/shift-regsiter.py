from myhdl import *

@block 
def Register(dout, din, clock, reset_l):
    """ 
    A register that always saves din to dout on positive edges
    """

    @always_seq(clock.posedge, reset=reset_l)
    def seq_reg():
        dout.next = din

    return seq_reg

@block
def ShiftRegisterL(dout, sin, clock, reset_l):
    """ Register shift left 

    dout    -- register output
    sin     -- bit shifted in  
    clock   -- clock input
    reset   -- asynchronous reset input
    """

    w = len(dout)
    # use modular bit vector (modbv) 
    reg_in = Signal(modbv(0)[w:])

    reg1 = Register(dout, reg_in, clock, reset_l) 

    @always_comb
    def comb_in():
        reg_in.next = (dout  << 1) | sin
        # Another method
        # reg_in.next = concat(dout[w-1:], sin) 

    return comb_in, reg1

# testing code
if __name__ == "__main__":
    import argparse, re

    ACTIVE_LOW, INACTIVE_HIGH = 0, 1

    @block
    def testbench():
        m = 8
        dout = Signal(intbv(0)[m:])
        sin = Signal(bool(0))
        clock  = Signal(bool(0))
        reset = ResetSignal(0, active=0, isasync=True)

        tut = ShiftRegisterL(dout, sin, clock, reset)

        HALF_PERIOD = delay(10)

        @always(HALF_PERIOD)
        def clockGen():
            clock.next = not clock

        @instance
        def stimulus():
            reset.next = ACTIVE_LOW
            yield clock.negedge
            reset.next = INACTIVE_HIGH
            yield clock.negedge

            # number of cycles
            numcycles = 1
            for s in args.bits:
                sin.next = s == '1'
                yield clock.negedge
                numcycles += 1

            while numcycles < args.cycles:
                yield clock.negedge
                numcycles += 1

            raise StopSimulation()

        @instance
        def monitor():
            yield reset.posedge
            while 1:
                yield clock.posedge
                yield delay(1)
                print("{}   {}".format(bin(dout, m), int(sin)))

        return clockGen, stimulus, tut, monitor

    parser = argparse.ArgumentParser(description='MyHDL Shift Register Example')
    parser.add_argument('bits', nargs='?', default="1001", help='bits to be shifted in')
    parser.add_argument('--cycles', type=int, default=16, help='Number of cycles')

    args = parser.parse_args()

    if not re.match(r"[01]+$", args.bits):
        print("Error: bits can only be 0 or 1")
        exit(1)

    tb = testbench()
    tb.config_sim(trace=False)
    tb.run_sim()
