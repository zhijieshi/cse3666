from myhdl import block, always_comb, Signal, StopSimulation

## Implementation using logic operations  
@block
def Mux4(z, a, b, c, d, s):
    """ Multiplexer.

    z -- mux output
    a, b, c, d -- data inputs
    s -- select signal. Two bits. 0 for a and 3 for d
    """

    @always_comb
    def mux_logic():
        # use not instead of ~ to remove warnings in recent Python
        z.next = (((not s[1]) & (not s[0]) & a) | 
                  ((not s[1]) &      s[0]  & b) | 
                  (     s[1]  & (not s[0]) & c) | 
                  (     s[1]  &      s[0]  & d)) & 1

    return mux_logic

## Main
if __name__ == "__main__":
    import argparse
    from myhdl import intbv, delay, instance,  bin
    @block
    def test_mux(opt_s):

        # create signals. 
        z, a, b, c, d = [Signal(intbv(0)[1:]) for i in range(5)]
        s = Signal(intbv(0)[2:])

        # instantiating different MUXes
        mux_1 = Mux4(z, a, b, c, d, s)

        @instance
        def stimulus():
            print("a b c d s  | z")
            s.next = opt_s & 3
            for i in range(16):
                a.next, b.next, c.next, d.next = intbv(i)[4:]
                yield delay(10)
                # convert to bool to int to see 0 or 1, instead of True or False
                print("{} {} {} {} {} | {} ".format(int(a), int(b), int(c), int(d), 
                                                    bin(s,2), int(z)))
            raise StopSimulation()

        return mux_1, stimulus

    parser = argparse.ArgumentParser(description='MyHDL Mux4 Example')
    parser.add_argument('select', type=int, nargs='?', default="0", help='select signal value')
    parser.add_argument('--trace', action='store_true', help='generate trace file')

    args = parser.parse_args()

    tb = test_mux(args.select)
    # change trace to True will generate waveforms
    tb.config_sim(trace=args.trace)
    tb.run_sim()
