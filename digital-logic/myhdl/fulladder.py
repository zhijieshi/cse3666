from myhdl import block, always_comb, Signal, StopSimulation

# we are using multiple AND gates
@block
def and2(c, a, b):

    """ 2-input gate
    c    -- output c = a & b
    a, b -- data inputs
    """

    @always_comb
    def comb():
        c.next = a & b

    return comb

@block
def xor2(c, a, b):

    """ 2-input gate
    c    -- output c = a ^ b
    a, b -- data inputs
    """

    @always_comb
    def comb():
        c.next = a ^ b

    return comb


@block
def or3(z, a, b, c):

    """ 3-input OR gate
    z       -- output z = a | b | c
    a, b, c -- inputs
    """

    @always_comb
    def comb():
        z.next = a | b | c

    return comb

@block
def fulladder(a, b, cin, s, cout):

    """ a full adder

    add a, b, and cin

    s is the sum and cout is the carry out

    """

    # let us built it with gates, in the way we discussed in lecture

    # define internal signals
    x1_out, a1_out, a2_out, a3_out = [Signal(intbv(0)) for i in range(4)]

    # instantiating gates and connect them

    # two XOR gates to compute sum
    x1 = xor2(x1_out, a, b)
    x2 = xor2(s, x1_out, cin)

    # compute carry
    # cout = a & b + a & cin + b & cin
    a1 = and2(a1_out, a, b) 
    a2 = and2(a2_out, a, cin) 
    a3 = and2(a3_out, b, cin) 
    o1 = or3(cout, a1_out, a2_out, a3_out)

    # that's it 

    return x1, x2, a1, a2, a3, o1

if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_comb():

        # create signals
        a, b, cin, s, cout = [Signal(intbv(0)) for i in range(5)]

        # instantiating a block
        comb1 = fulladder(a, b, cin, s, cout)

        @instance
        def stimulus():
            print("a   b  cin  | cout s")
            for i in range(10):
                a.next, b.next, cin.next = (i & 1), ((i >> 1) & 1), ((i >> 2) & 1)
                yield delay(10)
                # for comb, we can just get the value here
                print("{}   {}   {}   |  {}   {}".format(a, b, cin, cout, s))
            raise StopSimulation()

        return comb1, stimulus

    tb = test_comb()
    # tb.config_sim(trace=True)
    tb.run_sim()
