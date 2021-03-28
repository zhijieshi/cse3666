import random
from myhdl import block, always, instance, Signal, \
    ResetSignal, modbv, delay, StopSimulation
from counter import counter

random.seed(1)
randrange = random.randrange

ACTIVE_LOW, INACTIVE_HIGH = 0, 1

@block
def testbench():
    m = 16
    count = Signal(modbv(0)[m:])
    deltain = Signal(modbv(0)[m:])
    loadin = Signal(modbv(0)[m:])
    load = Signal(bool(0))
    clock  = Signal(bool(0))
    reset = ResetSignal(0, active=0, isasync=True)

    counter1 = counter(count, deltain, load, loadin, clock, reset)

    HALF_PERIOD = delay(10)

    @always(HALF_PERIOD)
    def clockGen():
        clock.next = not clock

    @instance
    def stimulus():
        reset.next = ACTIVE_LOW
        yield clock.negedge
        reset.next = INACTIVE_HIGH
        loadin.next = 0xFFF0 # not starting for 0
        load.next = 1
        yield clock.negedge
        load.next = 0
        for i in range(16):
            r = randrange(4)
            if r < 2:
                deltain.next = r
            else:
                deltain.next = i
            yield clock.negedge

        loadin.next = 0xABCD 
        load.next = 1
        yield clock.negedge

        raise StopSimulation()

    @instance
    def monitor():
        print("in     count load")
        yield reset.posedge
        while 1:
            yield clock.posedge
            yield delay(1)
            print("{:04x}   {}  {}".format(int(deltain), count, load))

    return clockGen, stimulus, counter1, monitor

tb = testbench()
tb.run_sim()
