# This implementation of MUX is built on gates 
from myhdl import block, always_comb, Signal, StopSimulation

@block
def AND2(c, a, b):
    """ 
    c = a & b
    """
    @always_comb
    def comb():
        c.next = a and b

    return comb

@block
def OR2(c, a, b):
    """ 
    c = a | b
    """
    @always_comb
    def comb():
        c.next = a or b

    return comb

@block
def NOT1(z, a):
    """ 
    z = ~ a
    """
    @always_comb
    def comb():
        z.next = a == 0

    return comb


@block
def MUX2(c, a, b, s):

    """ Multiplexer.

    c -- mux output
    a, b -- data inputs
    s -- control input: select b if asserted, otherwise a

    """
    # logic is z = (~ sel) & a | (sel) & b

    # create instances of the gates
    # create signals first
    n1_out, a1_out, a2_out = [Signal(bool(0)) for _ in range(3)]

    # need signals when we instantiating gates 

    n1 = NOT1(n1_out, s)
    a1 = AND2(a1_out, n1_out, a) 
    a2 = AND2(a2_out, s, b) 
    o1 = OR2(c, a1_out, a2_out)

    # return all instances 
    return n1, a1, a2, o1

if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_mux():

        # create signals
        c, a, b, s = [Signal(bool(0)) for i in range(4)]

        # instantiating a block
        mux_1 = MUX2(c, a, b, s)

        @instance
        def stimulus():
            print("a b s | c")
            for i in range(8):
                b.next, a.next, s.next = (i & 1), ((i >> 1) & 1), ((i >> 2) & 1)
                yield delay(10)
                print("{} {} {} | {}".format(int(a), int(b), int(s), int(c)))
            raise StopSimulation()

        return mux_1, stimulus

    tb = test_mux()
    # change trace to True will generate waveforms
    tb.config_sim(trace=False)
    tb.run_sim()
