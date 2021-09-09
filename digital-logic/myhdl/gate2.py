from myhdl import block, always_comb, Signal, StopSimulation

# block is a hardware module
# input/output signals are arguments
@block
def gate2(c, a, b):

    """ 2-input gate

    c    -- output c = a & b
    a, b -- data inputs

    """

    # the 'always_comb' decorator indicates a combinational circuit
    # the funciton name is not important. we could name it 'a_circuit'
    @always_comb
    def comb():
        # currently doing AND
        # it is easy to change to other gates
        # AND: &, OR: |, XOR: ^
        c.next = a & b

    # return the logic  
    return comb

if __name__ == "__main__":
    from myhdl import intbv, delay, instance

    # testbench itself is a block
    @block
    def test_comb():

        # create signals
        a, b, z = [Signal(intbv(0)) for i in range(3)]

        # instantiating a block
        comb1 = gate2(z, a, b)

        @instance
        def stimulus():
            print("a b | z")
            for i in range(8):
                # set a and b's value and wait for c to change
                a.next, b.next = ((i >> 1) & 1), (i & 1)
                yield delay(10)
                print("{} {} | {}".format(a, b, z))
            # stop simulation
            raise StopSimulation()

        return comb1, stimulus

    tb = test_comb()
    tb.config_sim(trace=False)
    tb.run_sim()
