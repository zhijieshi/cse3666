from myhdl import *

@block 
def Register(dout, din, clock, reset):
    """ 
    A register that always saves din to dout on positive edges
    """

    @always_seq(clock.posedge, reset=reset)
    def seq_reg():
        dout.next = din

    return seq_reg

@block
def ShiftRegisterL(dout, sin, clock, reset, method = 0):
    """ Register shift left 

    dout    -- register output
    sin     -- bit shifted in  
    clock   -- clock input
    reset   -- asynchronous reset input
    """

    w = len(dout)
    # use modular bit vector (modbv) 
    reg_in = Signal(modbv(0)[w:])

    reg1 = Register(dout, reg_in, clock, reset) 

    @always_comb
    def comb0():
        reg_in.next = (dout << 1) | sin

    @always_comb
    def comb1():
        # Another method
        reg_in.next = concat(dout[w-1:], sin) 

    @always_comb
    def comb2():
        # Yet another method
        reg_in.next[w:1] = dout[w-1:]
        reg_in.next[0] = sin

    if method == 0:
        return comb0, reg1
    elif method == 1:
        return comb1, reg1
    elif method == 2:
        return comb2, reg1
    else:
        raise NotImplementedError

# testing code
if __name__ == "__main__":
    import argparse, re

    ACTIVE_LOW, INACTIVE_HIGH = 0, 1

    @block
    def testbench(args):
        m = 8
        dout = Signal(intbv(0)[m:])
        sin = Signal(bool(0))
        clock  = Signal(bool(0))
        reset = ResetSignal(0, active=0, isasync=True)

        tut = ShiftRegisterL(dout, sin, clock, reset, args.m)

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
    parser.add_argument('-m', type=int, default=0, choices=[0, 1, 2], help='Implementation method')
    parser.add_argument('--trace', action='store_true', help='generate trace file')

    args = parser.parse_args()

    if not re.match(r"[01]+$", args.bits):
        print("Error: bits can only be 0 or 1")
        exit(1)

    tb = testbench(args)
    tb.config_sim(trace=args.trace)
    tb.run_sim()
