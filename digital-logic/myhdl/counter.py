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

    # use modular bit vector (modbv) for the output adder
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

# testing code
if __name__ == "__main__":
    import argparse

    ACTIVE_LOW, INACTIVE_HIGH = 0, 1

    @block
    def testbench():
        m = 16
        count = Signal(intbv(0)[m:])
        deltain = Signal(intbv(0)[m:])
        loadin = Signal(intbv(0)[m:])
        load = Signal(bool(0))
        clock  = Signal(bool(0))
        reset = ResetSignal(0, active=0, isasync=True)

        counter1 = counter(count, deltain, load, loadin, clock, reset)

        HALF_PERIOD = delay(10)

        @always(HALF_PERIOD)
        def clockGen():
            clock.next = not clock

        @instance
        def stimulus():
            reset.next = ACTIVE_LOW
            yield clock.negedge
            reset.next = INACTIVE_HIGH
            loadin.next = args.loadin
            load.next = 1
            yield clock.negedge
            load.next = 0

            # number of cycles
            numcycles = 1
            for s in args.deltain:
                deltain.next = s
                yield clock.negedge
                numcycles += 1

            while numcycles < args.cycles:
                yield clock.negedge
                numcycles += 1

            raise StopSimulation()

        @instance
        def monitor():
            print("load delta  counter")
            yield reset.posedge
            while 1:
                yield clock.posedge
                yield delay(1)
                print("{}    {:04x}   {}".format(load, int(deltain), count))

        return clockGen, stimulus, counter1, monitor

    parser = argparse.ArgumentParser(description='Python Example')
    parser.add_argument('deltain', type=int, nargs='*', default=[1], help='delta input')
    parser.add_argument('--loadin', '-l', type=int, default=0, help='load input')
    parser.add_argument('--cycles', type=int, default=16, help='Number of cycles')

    args = parser.parse_args()

    tb = testbench()
    tb.config_sim(trace=False)
    tb.run_sim()
