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

## Shadow signals

Sometimes we would like to connect one bit or a subset of bits in a multi-bit
signal to a module, as shown in the following example.

```python
@block
def fancy(x, y, z):
    # x is a signal of 16 bits
    # y is a single-bit signal

    # send bit 0 in x to an AND gate
    # this does not work
    a1 = and2(and_out, x[0], y)
        
```

Connecting `x[0]` to the AND gate does not work. `x[0]` refers to the value of
bit 0. It is not a signal. When bit 0 in `x` changes, the AND gate is not
triggered. We could create another signal, say, `x0`, and use a combinational
logic to copy `x[0]` to `x0`, e.g., `x0.next = x[0]`. However, it requires
more work.

MyHDL provides a mechanism, called shadow signal, to address the issue. Instead
of `x[0]`, we could use `x(0)` to refer to bit 0 in `x` and connect `x(0)` to
the AND gate. `x(0)` works as a signal. If bit 0 of `x` changes, the AND gate
will be triggered and then update its output.

```python
@block
def fancy(x, y, z):
    # x is a signal of 16 bits
    # y is a single-bit signal

    # send bit 0 in x to an AND gate
    a1 = and2(and_out, x(0), y)      # x(0) is a shadow signal
        
```

If there is no shadow signal, we would need to create a signal and copy the
value explicitly.

```python
@block
def fancy(x, y, z):
    # x is a signal of 16 bits
    # y is a single-bit signal

    x0 = Signal(bool(0))

    @always_comb
    def comb_logic():
        x0.next = x[0]

    # send bit 0 in x to an AND gate
    a1 = and2(and_out, x0, y)
```

See the [reference
page](http://docs.myhdl.org/en/stable/manual/reference.html#shadow-signals) for
more details.

Note that shadow signalis are read only. 

