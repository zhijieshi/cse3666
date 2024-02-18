"""
This is an example of implementing basic logic gates in MyHDL.

Also study the test module test_comb(), which has examples of
the following tasks.

    * create signals
    * instantiate existing modules
    * set signal values

"""

from myhdl import block, always_comb

# We use logical operaitons to make sure the result is 1 bit
# We could use bit-wise operations if all signals have the same width
#      AND: &
#      OR:  |
#      XOR: ^
#      NOT: ~   
# ~ may cause trouble as (~ 1) generates bits for -2

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

@block
def Not1(z, a):
    """ NOT gate

    z = not a
    """
    @always_comb
    def comb():
        z.next = not a

    return comb

if __name__ == "__main__":
    from myhdl import delay, instance, Signal, StopSimulation

    # testbench itself is a block
    @block
    def test_comb():

        # create signals
        a, b, and_out, or_out, not_out = [Signal(bool(0)) for i in range(5)]

        # instantiating blocks
        and_inst = And2(and_out, a, b)
        or_inst = Or2(or_out, a, b)
        not_inst = Not1(not_out, a)

        @instance
        def stimulus():
            print("a b | and or  not_a")
            for i in range(4):
                # set a and b's value and wait for c to change
                # a takes the value of bit 1 in i and b takes bit 0
                a.next, b.next = ((i >> 1) & 1), (i & 1)
                yield delay(10)
                print("{} {} | {}   {}   {}".format(
                    int(a), int(b), 
                    int(and_out), int(or_out), int(not_out)))
            # stop simulation
            raise StopSimulation()

        return and_inst, or_inst, not_inst, stimulus

    tb = test_comb()
    tb.config_sim(trace=False)
    tb.run_sim()
