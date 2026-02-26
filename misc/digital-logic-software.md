# Digital Circuit Design Software

We have LogicWorks, Candence, Xilinx software available on Engineering virtual PC and/or on
the computers in computer labs. 

## Offline software

* [Logisim Evolution](https://github.com/logisim-evolution/logisim-evolution).
  Free. A Java applicaton (like RARS). It is used in digital logic design and computer
  architecture courses in some universities.  The software supports large
  designs, including some processors. 

## Online software

Note that you may not be able to save or donwload your design on some platforms! 

* [Circuitverse](https://circuitverse.org/simulator). Developed by students at
  IIIT-Bangalore (International Institute of Information Technology).

* [CircuitJS1](https://www.falstad.com/circuit/circuitjs.html).  An circuit
  simulator that runs in a browser. It is written by Paul Falstad and Iain
  Sharp. You can compile and run it locally on your own computer. Check the
  instructions on [the Github repo](https://github.com/pfalstad/circuitjs1). 

* [Circuit Lab](https://www.circuitlab.com/). Not Free.

* [Logic.LY](https://logic.ly). Not Free. Wires are curved.

## Diagram drawing

In addition to what are listed below, a lot of drawing software, e.g., Inkscape and
TikZ, has libraries for drawing electric/digital circuit.

* [Diagrams.net](https://app.diagrams.net/). Used to be "draw.io". Diagram editor in browser. 
  Diagram can be saved in cloud or locally. It has a library of logic gates. The shape of gates
  is good.

* [Circuit Diagram](https://www.circuit-diagram.org/). Editor only. Simulation in development.

* [Python package for drawing circuit diagrams](https://pypi.org/project/schemdraw/). 
  [Documentation](https://schemdraw.readthedocs.io/en/latest/usage/start.html).

# Viewing VCD file

In addition to the software listed below, some commonly used software, like VS Code and Vim, has plugin for viewing VCD files. Some commerical companies also provide waveform viewer for free. 

* [GTKWave Repo](https://github.com/gtkwave/gtkwave). 
  [An older version on SourceForge](http://gtkwave.sourceforge.net/).

* [Value Change Dump (.vcd) command line viewer for Windows, Linux and MacOS](https://github.com/yne/vcd). Viewing waves in terminal is a good idea. However, the current version is fragile.

# Verilog

Verilog is a popluar HDL. It is also the language used in textbook examples.
You will find Verilog and MyHDL have many similar concepts and even keywords.
It would be a fun project to learn Verilog and get a working RISC-V core on an
FPGA.

* [Veritut](http://www.asic-world.com/verilog/veritut.html)

[Icarus Verilog (iverilog)](https://bleyer.org/icarus/) has good support for Verilog 2005 (1364-2005). The
compiled code has small foot print and it is fast. 

[EDA playgrond](https://www.edaplayground.com/) provides an online environment
where one can play with many HDLs. It requires a free account to actually
simulate the design. There are many other online Verilog simulators. 

# Other

We use MyHDL in CSE 3666. [Amaranth
HDL](https://github.com/amaranth-lang/amaranth) provides another toolchain to design
hardware with Python.
