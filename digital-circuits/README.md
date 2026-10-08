# Digital Circuits

This directory contains examples of digital circuits used in CSE 3666. The circuits can be simulated using the [Falstad Circuit Simulator](https://www.falstad.com/circuit/).

## Examples

- **SR latch:** Implemented using NOR gates.
- **D latch:** Built upon SR latch. Generate S/R from D. Signal C decides if they can go through the AND gates.
- **D flip-flop:** Constructed using D-latch subcircuits. Postive edge triggered.
- **D flip-flop:** Implemented entirely with logic gates, without subcircuits. Postive edge triggered.
- **1-bit ALU:** Implemented as discussed in lecture. Created by P.C., a former TA.

## How to Open a Circuit

1. Open the [Falstad Circuit Simulator](https://www.falstad.com/circuit/).
2. Open an XML circuit file in this directory and copy its entire contents.
3. In Falstad, select **File → Import From Text**.
4. Paste the copied XML code into the text box and click **Import**.

You can then interact with the circuit and observe how it operates.
