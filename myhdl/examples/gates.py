# Copyright 2021-2026 Zhijie Shi. All rights reserved. See LICENSE.txt.
from myhdl import block, always_comb

# z is the output
# each signal should bool type, 0 or 1

@block
def Not(z, a):
    """ z = not a """

    @always_comb
    def comb():
        z.next = not a

    return comb

@block
def And2(z, a, b):
    """ z = a and b """

    @always_comb
    def comb():
        z.next = a and b

    return comb

@block
def Or2(z, a, b):
    """ z = a or b """

    @always_comb
    def comb():
        z.next = a or b

    return comb

@block
def Xor2(z, a, b):
    """ z = a xor b """

    @always_comb
    def comb():
        z.next = a ^ b

    return comb

@block
def Nand2(z, a, b):
    """ z = a nand b """

    @always_comb
    def comb():
        z.next = not (a and  b)

    return comb

@block
def Nor2(z, a, b):
    """ z = a nor b """

    @always_comb
    def comb():
        z.next = not ( a or b)

    return comb

@block
def And3(z, a, b, c):
    """ z = a and b and c """

    @always_comb
    def comb():
        z.next = a and b and c

    return comb

@block
def Or3(z, a, b, c):
    """ z = a or b or c """

    @always_comb
    def comb():
        z.next = a or b or c

    return comb

@block
def Xor3(z, a, b, c):
    """ z = a xor b xor c """

    @always_comb
    def comb():
        z.next = a ^ b ^ c

    return comb

@block
def Nand3(z, a, b, c):
    """ z = not (a and b and c) """

    @always_comb
    def comb():
        z.next = not (a and b and c)

    return comb

@block
def Nor3(z, a, b, c):
    """ z = not (a or b or c) """

    @always_comb
    def comb():
        z.next = not (a or b or c)

    return comb
