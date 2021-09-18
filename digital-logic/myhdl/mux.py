from myhdl import block, always_comb, Signal, StopSimulation

@block
def Mux2(c, a, b, s):

    """ Multiplexer.

    c -- mux output
    a, b -- data inputs
    s -- control input: select b if s is asserted, otherwise a

    """

    @always_comb
    def comb():
        if s:
            c.next = b
        else:
            c.next = a

    return comb

if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_mux():

        # create signals
        z, a, b, s = [Signal(bool(0)) for i in range(4)]

        # instantiating a block
        mux_1 = Mux2(z, a, b, s)

        @instance
        def stimulus():
            print("a b s | z")
            for i in range(8):
                b.next, a.next, s.next = (i & 1), ((i >> 1) & 1), ((i >> 2) & 1)
                yield delay(10)
                # convert to bool to int to see 0 or 1, instead of True or False
                print("{} {} {} | {}".format(int(a), int(b), int(s), int(z)))
            raise StopSimulation()

        return mux_1, stimulus

    tb = test_mux()
    # change trace to True will generate waveforms
    tb.config_sim(trace=False)
    tb.run_sim()
