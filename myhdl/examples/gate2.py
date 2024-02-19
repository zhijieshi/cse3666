"""
This is an example of implementing AND and OR gates in MyHDL.

Also study the test module test_comb(), which has examples of
the following tasks.

    * create signals
    * instantiate existing modules
    * set signal values

"""

from myhdl import block, always_comb

# We use logical operations to make sure the result is 1 bit
# We could use bit-wise operations if all signals have the same width
#      AND: &
#      OR:  |
#      XOR: ^
#      NOT: ~   
# ~ may cause trouble as (~ 1) generates bits for -2
# We need a final masking, e.g., `& 1` if ~ is used.

# block is a hardware module
# input/output signals are arguments
@block
def And2(c, a, b):

    """ 2-input AND gate

    c = a AND b

    """

    # the 'always_comb' decorator indicates a combinational circuit
    # the funciton name is not important. we could name it 'a_circuit'
    @always_comb
    def comb():
        c.next = a and b

    # return the logic  
    return comb

@block
def Or2(c, a, b):
    """ 2-input OR gate

    c = a OR b

    """
    @always_comb
    def comb():
        c.next = a or b

    return comb

if __name__ == "__main__":
    from myhdl import intbv, delay, instance, Signal, StopSimulation

    # testbench itself is a block
    @block
    def test_comb():

        # create signals
        a, b, and_out, or_out = [Signal(bool(0)) for i in range(4)]

        # instantiating blocks
        and_inst = And2(and_out, a, b)
        or_inst = Or2(or_out, a, b)

        @instance
        def stimulus():
            print("a b | and or")
            for i in range(4):
                a.next, b.next = intbv(i)[2:]
                yield delay(10)
                print("{} {} | {}   {}".format(
                    int(a), int(b), int(and_out), int(or_out)))
            # stop simulation
            raise StopSimulation()

        return and_inst, or_inst, stimulus

    tb = test_comb()
    tb.run_sim()
