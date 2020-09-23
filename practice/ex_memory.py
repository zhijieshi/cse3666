#!/usr/local/bin/python3

# import system module
import sys, re, argparse
import random

class   Memory:

    def     __init__(self, addr, size):
        self.addr = addr
        self.size = size
        self.data = []
        self.bigendian = True

    def     init(self):
        self.data = [ random.randint(0, 255) for x in range(self.size) ]

    def     set_endianness(self, big):
        self.bigendian = big

    def     print(self):
        # we have only a small number of bytes. Print everything on one line
        print("0x{:08X}:".format(self.addr), end = "")
        for i in range(self.size):
            print("  0x{0:02X}({0:3d})".format(self.data[i]), end = "")
            # print("0x{0:08X}: 0x{1:02X}({1:3d})".format(self.addr + i, self.data[i]))
        print("");

    def     readstr(self, addr, lsize, signed):
        if addr < self.addr or addr + lsize > self.addr + self.size:
            print("Error: Membery address 0x{0:08X} ({0:d}) is out of range.".format(addr))
            return ""
        if lsize not in [1, 2, 4]:
            print("Error: Size of data items must 1, 2, or 4.")
            return ""
        if (lsize == 4 and (addr & 3)) or (lsize == 2 and (addr & 1)):
            print("Error: Membery address 0x{0:08X} ({0:d}) is not aligned.".format(self.address))
        start = addr - self.addr 
        if (lsize == 4):
            if (self.bigendian):
                v = (self.data[start  ] << 24) + (self.data[start+1] << 16) + \
                    (self.data[start+2] <<  8) +  self.data[start+3] 
            else:
                v = (self.data[start+3] << 24) + (self.data[start+2] << 16) + \
                    (self.data[start+1] <<  8) +  self.data[start] 
        elif (lsize == 2):
            if (self.bigendian):
                v = (self.data[start  ] << 8) + self.data[start+1]
            else:
                v = (self.data[start+1] << 8) + self.data[start]
            if signed and v & 0x8000: # sign extension
                v |= 0xFFFF0000
        else:
            v = self.data[start]
            if signed and v & 0x80: # sign extension
                v |= 0xFFFFFF00
        return "{:08x}".format(v) 


def print_instruction(addr, size, sign):
    if size == 4:
        print("LW   $t0, ($s0)  # s0 = 0x{:08X}".format(addr))
    elif size == 2:
        print("{}   $t0, ($s0)  # s0 = 0x{:08X}".format(["LHU", "LH"][sign], addr))
    else:
        print("{}   $t0, ($s0)  # s0 = 0x{:08X}".format(["LBU", "LB"][sign], addr))

# parse the arguments
parser = argparse.ArgumentParser(description='Exercise on load instructions')
parser.add_argument("-l", "--little", help="Assume little endian")

args = parser.parse_args()
# print(args)

memaddr = 0x3000
memsize = 8

mem = Memory(memaddr, memsize)
if args.little:
    mem.set_endianness(False)

instr_config = [ 
        (memaddr+0, 1, 0),
        (memaddr+0, 1, 1),
        (memaddr+0, 2, 0),
        (memaddr+0, 2, 1),
        (memaddr+0, 4, 0), 
        (memaddr+4, 4, 0), 

        (memaddr+2, 2, 0),
        (memaddr+2, 2, 1),
        (memaddr+4, 2, 0),
        (memaddr+4, 2, 1),
        (memaddr+6, 2, 0),
        (memaddr+6, 2, 1),

        (memaddr+3, 1, 1),
        (memaddr+5, 1, 1),
        (memaddr+7, 1, 1),
    ]

random.shuffle(instr_config)

mem.init()

print("Memory: ({} Mode)".format(["Little Endian", "Big Endian"][mem.bigendian]))
mem.print()

for c in instr_config:
    print("\nWhat are the bits in $t0 after the execution of the following instruction?")
    print_instruction(*c)
    answer = input("Enter 8 hexdecimal digits:")
    key = mem.readstr(*c)
    if answer.lower() == key:
        print("Correct")
    else:
        print("Incorrect. The answer should be {}.".format(key.upper()))

