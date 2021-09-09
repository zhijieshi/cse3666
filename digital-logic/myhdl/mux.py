from myhdl import block, always_comb, Signal, StopSimulation

@block
def mux(z, a, b, sel):

    """ Multiplexer.

    z -- mux output
    a, b -- data inputs
    sel -- control input: select a if asserted, otherwise b

    """

    @always_comb
    def comb():
        # we could build it with gates
        # logic is z = sel & a | (~ sel) & b
        if sel == 1:
            z.next = a
        else:
            z.next = b

    return comb


if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_mux():

        # create signals
        z, a, b, sel = [Signal(intbv(0)) for i in range(4)]

        # instantiating a block
        mux_1 = mux(z, a, b, sel)

        @instance
        def stimulus():
            print("a b sel | z")
            for i in range(8):
                b.next, a.next, sel.next = (i & 1), ((i >> 1) & 1), ((i >> 2) & 1)
                yield delay(10)
                print("{} {}  {}  | {}".format(a, b, sel, z))
            raise StopSimulation()

        return mux_1, stimulus

    tb = test_mux()
    # change trace to True will generate waveforms
    tb.config_sim(trace=False)
    tb.run_sim()
