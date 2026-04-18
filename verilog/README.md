# Introduction to Verilog

This document provides a brief introduction to Verilog, a hardware description
language (HDL) widely used in digital logic design and computer architecture.

Verilog is one of the most popular hardware description languages used in
industry and academia. It allows you to describe hardware behavior.  It is
commonly used to design and verify digital circuits, including processors.
Verilog designs can be simulated to check correctness, and synthesized into
hardware (e.g., FPGA or ASIC implementations) Many real-world processors and
hardware accelerators are designed using Verilog. Learning Verilog helps bridge
the gap between computer architecture concepts and real hardware
implementations.

## Design Levels (Modeling Styles) in Verilog

Verilog supports several levels of abstraction, also called modeling styles.
The same hardware can be described in different ways depending on how much
detail you want.  The four common design levels are:

*   Gate Level
*   Dataflow
*   Behavioral
*   Structural

### Gate-Level Modeling

Gate-level modeling describes a circuit using basic logic gates (AND, OR, NOT).

*   Closely resembles schematic-level design 
*   Mostly used for learning and low-level verification 
*   Gate-level modeling is closely related to structural modeling

Example (2-to-1 Mux at Gate Level):

```verilog
module mux2_1_gate (
    input  a,
    input  b,
    input  s,
    output y
);
    wire ns, w1, w2;

    not (ns, s);
    and (w1, a, ns);
    and (w2, b, s);
    or  (y, w1, w2);
endmodule
```

### Structural Modeling

Structural modeling connects components or modules together, similar to wiring
blocks in a diagram.

Gate-level modeling is a special case of structural modeling Useful for
building larger designs from smaller components

Example (Structural 2‑to‑1 Mux using gates):

```verilog
module mux2_1_structural (
    input  a,
    input  b,
    input  s,
    output y
);
    wire ns, wa, wb;

    not n1(ns, s);
    and a1(wa, a, ns);
    and a2(wb, b, s);
    or  o1(y, wa, wb);
endmodule
```

### Dataflow Modeling

Dataflow modeling focuses on how data moves through the circuit using Boolean
expressions.

*   Uses continuous assignments (assign) 
*   Very common for combinational logic
*   Compact and readable

Example (2-to-1 Mux, Dataflow Modeling):

```verilog
module mux2_1 (
    input  wire a,
    input  wire b,
    input  wire s,
    output wire y
);
    assign y = (~s & a) | (s & b);
endmodule
```

### Behavioral Modeling

Behavioral modeling describes what the circuit does, rather than how it is
physically built.

*   Uses always blocks
*   Commonly used for control logic and larger designs
*   Can describe both combinational and sequential logic

Example (2-to-1 Mux, Behavioral Modeling):

```verilog
module mux2_1_behavioral (
    input  a,
    input  b,
    input  s,
    output reg y
);
    always @(*) begin
        if (s == 1'b0)
            y = a;
        else
            y = b;
    end
endmodule
```

### Which Modeling Style Should I Use?

*   Gate level: Educational, low-level understanding
*   Structural: Building designs from modules
*   Dataflow: Clean combinational logic
*   Behavioral: Flexible and widely used

In real designs, these styles are often mixed.

## Testbench

A testbench is Verilog code that tests your hardware module by applying inputs
and checking outputs. Testbenches are for simulation, not synthesis.
It is common that the testbench is in a separate file from the design. 
For example, to verify/test one of the 2 to 1 multiplexer design above, we can have a following testbench
in a file named `tb_mux2_1.v`:

**Minimal mux2\_1 Testbench (Simulation):**

```verilog
`timescale 1ns/1ps

module tb_mux2_1;

    reg  a, b, s;
    wire y;

    // DUT = Device Under Test
    mux2_1 dut (
        .a(a),
        .b(b),
        .s(s),
        .y(y)
    );

    // Task to apply a vector and check expected output
    task check;
        input reg aa, bb, ss;
        input reg expected;
        begin
            a = aa; b = bb; s = ss;
            #1; // allow combinational logic to settle

            if (y !== expected) begin
                $display("FAIL: a=%b b=%b s=%b | y=%b (expected %b)", a, b, s, y, expected);
                $finish;
            end else begin
                $display("PASS: a=%b b=%b s=%b | y=%b", a, b, s, y);
            end
        end
    endtask

    initial begin
        $display("Starting mux2_1 testbench...");

        // When s=0, y should equal a
        check(0, 0, 0, 0);
        check(0, 1, 0, 0);
        check(1, 0, 0, 1);
        check(1, 1, 0, 1);

        // When s=1, y should equal b
        check(0, 0, 1, 0);
        check(0, 1, 1, 1);
        check(1, 0, 1, 0);
        check(1, 1, 1, 1);

        $display("All tests passed!");
        $finish;
    end

endmodule
```

## Another Example: a 4 to 1 multiplexer

In [the mux4 folder](./mux4), you can find a slightly larger example, a 4 to 1 multiplexer. It is implemented in several Verilog modeling styles. We will use mux4 as an example to show how to compile Verilog code and then run simulation.  

##  Compiling and Running Verilog Simulations with Icarus Verilog

To simulate Verilog designs in this repository, we use Icarus Verilog, an
open-source Verilog compiler and simulator.  Icarus Verilog uses a two-step
flow:

*   Compile Verilog source files using `iverilog`
*   Run the simulation using `vvp`

### Installing Icarus Verilog

Useful links:

*   **Official site** and documentation [Icarus-Official].
*   Source code and development repository [Icarus-Github].

Typical installation methods:

*   Linux: `sudo apt install iverilog`
*   macOS: `brew install icarus-verilog`
*   Windows: Use the Linux command above in WSL(recommended), or download and
    run the installer from the official site [Icarus-Official].

### Compiling a Verilog Design

We need two steps to run a simulation on a Verilog design: compile and run. 

To compile, run the following command in the mux4 directory:

    iverilog -o sim tb_mux4.v mux2_1.v mux4_dataflow.v mux4_behavioral.v mux4_structural.v 
    # Or the following command compile all the .v files in the current directory
    iverilog -o sim *.v

*   `iverilog` compiles the Verilog source 
*   `-o sim` specifies the output filename. The default output filename is
    "a.out". 

### Running the Simulation

Use the following command to run `sim`, which is the output file from the
previous step.

    vvp sim

Any output generated in the testbench will appear in the terminal.

## Learning More Verilog Details

This page only provides a brief introduction to Verilog, along with a minimal
set of instructions for compiling Verilog code and running simulations.  There
are many Verilog resources available online. We are not going to repeat here.
To learn more about the language, see the links in the References Section
(below). If you find any other good resources, please share with us. Beginners
often find the following Verilog concepts confusing. You may want to spend more
time on them.

- Verilog data types: `wire` vs `reg`. `reg` does not mean the signal must be
  driven by a register/flip flop.
- Blocking vs. non-blocking assignments
- Procedural blocks (`always`, `initial`)
- Simulation vs. synthesis considerations

## References

*   Icarus Verilog Official Site and downloads:
https://bleyer.org/icarus/
   
*   Icarus Verilog Github Repo: 
https://github.com/steveicarus/iverilog

*   Verilog Tutorial – Analog Circuit Design  
https://analogcircuitdesign.com/verilog-syntax-and-data-types/

*   Verilog tutorial - Chip Verify:
https://www.chipverify.com/verilog/verilog-tutorial

*   verilog.com has a lot of resources/links:
https://verilog.com/

[Icarus-Official]: https://bleyer.org/icarus/
[Icarus-Github]: https://github.com/steveicarus/iverilog
