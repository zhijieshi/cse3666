from myhdl import block, always_comb, Signal, StopSimulation

## Implementation using logical expressions
@block
def Mux4(z, a, b, c, d, s):
    """ Multiplexer.

    z -- mux output
    a, b, c, d -- data inputs. Single bits.
    s -- select signal. Two bits. 0 for a and 3 for d
    """

    @always_comb
    def mux_logic():
        s1, s0 = int(s[1]), int(s[0])
        s1_, s0_ = not s1, not s0
        z.next = ((s1_ & s0_ & a) 
                | (s1_ & s0  & b) 
                | (s1  & s0_ & c) 
                | (s1  & s0  & d)) 

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

        # instantiating a MUX
        u_mux = Mux4(z, a, b, c, d, s)

        @instance
        def stimulus():
            sel = opt_s & 3
            print("Select", ["a", "b", "c", "d"][sel])  
            print("a b c d s  | z")
            s.next = sel
            for i in range(16):
                a.next, b.next, c.next, d.next = intbv(i)[4:]
                yield delay(10)
                print(f"{a} {b} {c} {d} {bin(s,2)} | {z}")
            raise StopSimulation()

        return u_mux, stimulus

    parser = argparse.ArgumentParser(description='MyHDL MUX4 Example')
    parser.add_argument('select', type=int, nargs='?', default="0", help='select signal value')
    parser.add_argument('--trace', action='store_true', help='generate trace file')

    args = parser.parse_args()

    tb = test_mux(args.select)
    tb.config_sim(trace=args.trace)
    tb.run_sim()
