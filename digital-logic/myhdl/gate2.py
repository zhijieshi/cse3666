from myhdl import block, always_comb, Signal

@block
def gate2(c, a, b):

    """ 2-input gate

    c    -- output c = a & b
    a, b -- data inputs

    """

    @always_comb
    def comb():
        # currently doing AND
        # it is easy to change to other gates
        # AND: &, OR: |, XOR: ^
        c.next = a & b

    return comb


if __name__ == "__main__":
    from myhdl import intbv, delay, instance
    @block
    def test_comb():

        # create signals
        c, a, b = [Signal(intbv(0)) for i in range(3)]

        # instantiating a block
        comb1 = gate2(c, a, b)

        @instance
        def stimulus():
            print("c a b")
            for i in range(8):
                a.next, b.next = (i & 1), ((i >> 1) & 1)
                yield delay(10)
                # for comb, we can just get the value here
                print("{} {} {}".format(c, a, b))

        return comb1, stimulus

    tb = test_comb()
    tb.config_sim(trace=True)
    tb.run_sim()
