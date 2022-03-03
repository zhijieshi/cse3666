# Data types and signals 

This page explains data types and signals briefly.  

## How can we store signals in Python?

We can use any of the following data types to store signals. 

*   bool
*   int
*   intbv. MyHDL bit vector.
*   modbv. MyHDL modular bit vector.

bool and int are Python built-in data types. Also note that bool is a subset of int in Python.

intbv and modbv are hardware-oriented data types provided in MyHDL. See the
following page for detail.  

[Hardware-oriented data types in MyHDL](http://docs.myhdl.org/en/stable/manual/hwtypes.html)

Basically, `intbv` defines a bit vector. `modbv` is
similar. The difference is that if a value is out of range, `intbv` raises
exception while `modbv` does not and only keeps bits at the lower (right) end.

## Why Signal class?

The Signal class allows signal changes propogate through the circuit.  It is
another layer above the data types we choose to keep signal values. It is
critical to MyHDL. MyHDL keeps track of changes made to Signals and call proper
functions (i.e., activate different modules).  

The underlying data types in Signal class can be any of the types we can use to
keep signal values.  Here are some examples of creating Signals (note the
uppercase S) with different underlying data types.

```
sig1 = Signal(0)            # int
sig2 = Signal(bool(0))      # bool

sig3 = Signal(intbv(0)[32:0])      # a bit vector of 32 bits 
sig3 = Signal(modbv(0)[4:0])       # a mod bit vector of 4 bits 
```

The following examples explains why we need Signal class. A change of in1's
value triggers comb1. s gets a new value in comb1. In turn, it triggers comb2
and z is updated.

```
    # in1 is a Signal 
    s = Signal(bool(0))
    z = Signal(bool(0))

    @always_comb
    def comb1():
        s.next = not in1
    
    @always_comb
    def comb2():
        z.next = s and other_signals

```

If s is not a Signal, as in the code below, comb1 can be triggered. However, 
updating s does not trigger comb2. 

```
    # in1 is a Signal
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

