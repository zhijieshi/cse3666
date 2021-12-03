# Digital Circuit Design Software

We have LogicWorks, Candence, Xilinx software available on Engineering virtual PC and/or on
the computers in computer labs. 

## Offline software

* [Logisim Evolution](https://github.com/reds-heig/logisim-evolution). Free. It is
  used in digital logic design and computer architecture courses in some universities.
  The software supports large designs, including some processors. 

## Online software

Note that you may not be able to save or donwload your design! 

* [Circuitverse](https://circuitverse.org/simulator). Developed by students at
  IIIT-Bangalore (International Institute of Information Technology).

* [Circuit Lab](https://www.circuitlab.com/). Not Free.

* [Logic.LY](https://logic.ly). Not Free. Wires are curved.

## Diagram drawing

* [Diagrams.net](https://app.diagrams.net/). Used to be "draw.io". Diagram editor in browser. 
  Diagram can be saved in cloud or locally. It has a library of logic gates. The shape of gates
  is good.

* [Circuit Diagram](https://www.circuit-diagram.org/). Editor only. Simulation in development.

* [Python package for drawing circuit diagrams](https://pypi.org/project/schemdraw/). 
  [Documentation](https://schemdraw.readthedocs.io/en/latest/usage/start.html).

# Verilog

Verilog is a popluar HDL. It is also the language used in textbook examples.
You will find Verilog and MyHDL have many similar concepts and even keywords.
It would be a fun project to learn Verilog and get a working RISC-V core on an
FPGA.

* [Veritut](http://www.asic-world.com/verilog/veritut.html)

* [FPGA designs with Verilog](https://verilogguide.readthedocs.io/en/latest/index.html)

* [A FPGA board](https://www.adafruit.com/product/451). It should be good enough for a 32-bit RISC-V core. 

[Icarus Verilog (iverilog)](http://iverilog.icarus.com/) has good support for Verilog 2005 (1364-2005). The
compiled code has small foot print and it is fast. 

[EDA playgrond](https://www.edaplayground.com/) provides an online environment
where one can play with many HDLs. It requires a free account to actually
simulate the design.  There are many other online Verilog simulators. 

# Other

We use myHDL in CSE 3666.  nMigen is another Python package. It is based on [The Fragmented Hardware
  Description Language (FHDL)](https://m-labs.hk/migen/manual/fhdl.html), which
is quite different from traditional event driven languages like MyHDL.

* [nMigen Github repo](https://github.com/nmigen/nmigen)
* [nMigen document](https://nmigen.info/nmigen/latest/cover.html)
* [nMigen examples - kbob](https://github.com/kbob/nmigen-examples)

