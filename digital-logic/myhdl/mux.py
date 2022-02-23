from myhdl import block, always_comb, Signal, StopSimulation

## Implementation 1 
@block
def Mux2(c, a, b, s):
    """ Multiplexer.

    c -- mux output
    a, b -- data inputs
    s -- control input: select b if s is asserted, otherwise a
    """

    @always_comb
    def mux_logic():
        if s:
            c.next = b
        else:
            c.next = a

    return mux_logic

## Implementation 2 
@block
def Mux2_v2(c, a, b, s):
    """ Multiplexer.

    c -- mux output
    a, b -- data inputs
    s -- control input: select b if s is asserted, otherwise a
    """

    @always_comb
    def mux_logic():
        # c.next = ((~s) & a | s & b) & 1
        c.next = (not s and a) or (s and b)

    return mux_logic

## Implementation 3. using other modules/gates

@block
def And2(c, a, b):
    """ 
    c = a & b
    """
    @always_comb
    def comb():
        c.next = a and b

    return comb

@block
def Or2(c, a, b):
    """ 
    c = a | b
    """
    @always_comb
    def comb():
        c.next = a or b

    return comb

@block
def Not(z, a):
    """ 
    z = ~ a
    """
    @always_comb
    def comb():
        z.next = a == 0

    return comb

@block
def Mux2_gates(c, a, b, s):

    """ Multiplexer.

    c -- mux output
    a, b -- data inputs
    s -- control input: select b if asserted, otherwise a

    """
    # c = (~s) & a | s & b

    # create instances of the gates and connect them
    # create signals first
    # need signals when we instantiating gates 
    n1_out, a1_out, a2_out = [Signal(bool(0)) for _ in range(3)]

    n1 = Not(n1_out, s)
    a1 = And2(a1_out, n1_out, a) 
    a2 = And2(a2_out, s, b) 
    o1 = Or2(c, a1_out, a2_out)

    # return all instances 
    return n1, a1, a2, o1

## Main
if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_mux():

        # create signals. 
        z3, z2, z1, a, b, s = [Signal(bool(0)) for i in range(6)]

        # instantiating different MUXes
        mux_1 = Mux2(z1, a, b, s)
        mux_2 = Mux2_v2(z2, a, b, s)
        mux_3 = Mux2_gates(z3, a, b, s)

        @instance
        def stimulus():
            print("a b s | z1 z2 z3")
            for i in range(8):
                b.next, a.next, s.next = intbv(i)[3:0]
                yield delay(10)
                # convert to bool to int to see 0 or 1, instead of True or False
                print("{} {} {} | {}  {}  {}".format(int(a), int(b), int(s), 
                    int(z1), int(z2), int(z3) ))
            raise StopSimulation()

        return mux_1, mux_2, mux_3, stimulus

    tb = test_mux()
    # change trace to True will generate waveforms
    tb.config_sim(trace=False)
    tb.run_sim()
