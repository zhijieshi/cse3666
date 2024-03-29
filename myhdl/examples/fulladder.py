from myhdl import block, always_comb, Signal, StopSimulation

@block
def And2(c, a, b):

    """ 2-input AND gate
    c    -- output 
    a, b -- inputs
    """

    @always_comb
    def comb():
        c.next = a and b

    return comb

@block
def Xor2(c, a, b):

    """ 2-input XOR gate
    c    -- output
    a, b -- inputs
    """

    @always_comb
    def comb():
        c.next = a ^ b

    return comb


@block
def Or3(z, a, b, c):

    """ 3-input OR gate
    z       -- output 
    a, b, c -- inputs
    """

    @always_comb
    def comb():
        z.next = a or b or c

    return comb

@block
def Fulladder1(a, b, cin, s, cout):

    """ a full adder

    add a, b, and cin

    s is the sum and cout is the carry out

    """

    # let us built it with gates, in the way we discussed in lecture

    # define internal signals
    x1_out, a1_out, a2_out, a3_out = [Signal(intbv(0)) for i in range(4)]

    # instantiating gates and connect them

    # two XOR gates to compute sum
    u_x1 = Xor2(x1_out, a, b)
    u_x2 = Xor2(s, x1_out, cin)

    # compute carry
    # cout = a & b + a & cin + b & cin
    u_a1 = And2(a1_out, a, b) 
    u_a2 = And2(a2_out, a, cin) 
    u_a3 = And2(a3_out, b, cin) 
    u_o1 = Or3(cout, a1_out, a2_out, a3_out)

    # that's it 

    return u_x1, u_x2, u_a1, u_a2, u_a3, u_o1

if __name__ == "__main__":
    import argparse
    from myhdl import intbv, delay, instance
    @block
    def test_comb():

        # create output signals, individually
        # Note we also specify the number of bits in it
        # we can also use Signal(bool(0)) for 1 bit signals
        s = Signal(bool(0)) 
        cout = Signal(intbv(0)[1:]) 

        # all 3 input signals
        all_input = Signal(intbv(0)[3:])

        # example of shadow signals
        # consider they are alias of existing signals
        # a, b, and cin are not new signals
        # a follows bit 2 in all_input
        # b follows bit 1 in all_input
        # cin follows bit 0 in all_input
        a = all_input(2)
        b = all_input(1)
        cin = all_input(0)

        # instantiating a block
        comb1 = Fulladder1(a, b, cin, s, cout)

        @instance
        def stimulus():
            print("a   b  cin  | cout s")
            for i in range(8):
                all_input.next = i  # a, b, and cin will be updated, too
                yield delay(10)
                # note that we need explicitly convert bool to int, to see 0 or 1 
                print("{}   {}   {}   |  {}   {}".format(int(a), int(b), int(cin), cout, int(s)))
            raise StopSimulation()

        return comb1, stimulus

    parser = argparse.ArgumentParser(description='MyHDL 1-bit full adder example')
    parser.add_argument('--trace', action='store_true', help='generate trace file')

    args = parser.parse_args()

    tb = test_comb()
    tb.config_sim(trace=args.trace)
    tb.run_sim()
