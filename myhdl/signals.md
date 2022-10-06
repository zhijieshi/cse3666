# Data types and signals 

This page explains data types and signals briefly.  

## Data types for storing signal values

We can use any of the following data types to store signal values. 

*   bool
*   int
*   intbv. MyHDL bit vector.
*   modbv. MyHDL modular bit vector.

bool and int are Python built-in data types. Also note that bool is a subset of int in Python.

intbv and modbv are hardware-oriented data types provided in MyHDL. They allow
us to quickly access a subset of bits in a signal. See the following page for
detail.  

[Hardware-oriented data types in MyHDL](http://docs.myhdl.org/en/stable/manual/hwtypes.html)

Basically, `intbv` defines a bit vector. `modbv` is similar. The difference is
that if a value is out of range, `intbv` raises exception while `modbv` does
not and only keeps bits at the lower (right) end.

Here are some examples of `intbv`. 

    from myhdl import intbv

    # v is a 5-bit signal 
    v = intbv(10)[5:]   
    len(v)

    # bit 2 in v
    v[2]

    # lowest 2 bits of v: bit 1 and bit 0. bit 2 is not included
    v[2:]

    # bit 4 and 3 in v. bit 5 is not included
    v[5:3]

    # the value of lowest 4 bits of v as a 2's complement number
    v[4:].signed()

## Why Signal class?

The Signal class allows signal changes propogate through the circuit.  It is
another layer above the data types we choose to keep signal values. It is
critical to MyHDL. MyHDL keeps track of changes made to Signals and call proper
functions (i.e., activate different modules).  

The underlying data types in Signal class can be any of these types: bool, int,
intbv, or modbv.  Here are some examples of creating Signals (note the
uppercase S) with different underlying data types.

```
sig1 = Signal(0)            # int
sig2 = Signal(bool(0))      # bool

sig3 = Signal(intbv(0)[32:0])      # a bit vector of 32 bits 
sig3 = Signal(modbv(0)[4:])        # a mod bit vector of 4 bits 
```

The following examples explains why we need Signal class. A change of `in1`'s
value triggers `comb1` function, which simulates the behavior of `comb1`
hardware module. During this process, `s` gets a new value. In turn, it
triggers `comb2` and `z` is updated.

```
    # in1 is a Signal driven by another module
    s = Signal(bool(0))
    z = Signal(bool(0))

    @always_comb
    def comb1():
        s.next = not in1
    
    @always_comb
    def comb2():
        z.next = s and other_signals

```

If `s` is not a Signal, as in the code below, `comb1` can be triggered by
`in1`. However, updating `s` does not trigger `comb2`. Acutally, if there is no
`other_signals`, MyHDL will complain that it cannot find any signals to place
on the sensitivity list, which MyHDL uses to decide when `comb2` should be
called.

```
    # in1 is a Signal driven by another module
    s = 0
    z = Signal(bool(0))

    @always_comb
    def comb1():
        s = not in1
    
    @always_comb
    def comb2():
        z.next = s and other_signals

```

See the following pages for more information about the Signal class in MyHDL.

[Signal and other classes](http://docs.myhdl.org/en/stable/manual/reference.html#myhdl.Signal)

