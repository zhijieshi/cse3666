from myhdl import block, always_comb, Signal, StopSimulation

## Implementation using logical expressions
@block
def Mux4(z, a, b, c, d, s):
    """ Multiplexer.

    Inputs:

        a, b, c, d -- data inputs. Single bits.

        s -- 2-bit select signal.
            0 for a, 1 for b, 2 for c, and 3 for d.

    Output:
        z -- mux output
    """

    @always_comb
    def mux_logic():
        # it is recommended to use `and`, `or`, and `not` on single bits.
        s1, s0 = s[1], s[0]
        z.next = ( (not s1 and not s0 and a) 
                or (not s1 and     s0 and b) 
                or (    s1 and not s0 and c) 
                or (    s1 and     s0 and d)) 

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
    parser.add_argument('select', type=int, nargs='?', default="0", choices = [0, 1, 2, 3], help='select signal value')
    parser.add_argument('--trace', action='store_true', help='generate trace file')

    args = parser.parse_args()

    tb = test_mux(args.select)
    tb.config_sim(trace=args.trace)
    tb.run_sim()
