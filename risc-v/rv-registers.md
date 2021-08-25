# Registers in RV32I

RISC-V has 32 general-purpose registers, denoted as `x0`, `x1`, and so on.
Register 0 `x0` is always 0. 

Each register also has a name, to make it easier to use registers in code. 
For example, `x0` is `zero`. 

The following table lists the registers and their names. 

<table>
<thead>
<tr>
<td>Register</td>
<td>Name</td>
<td>Description</td>
</tr>
</thead>
<tbody>

<tr>
<td>x0</td>
<td>zero</td>
<td>Always 0</td>
</tr>

<tr>
<td>x1</td>
<td>ra</td>
<td>Return address</td>
</tr>

<tr>
<td>x2</td>
<td>sp</td>
<td>Stack pointer</td>
</tr>

<tr>
<td>x3</td>
<td>gp</td>
<td>Global pointer</td>
</tr>

<tr>
<td>x4</td>
<td>tp</td>
<td>Thread pointer</td>
</tr>

<tr>
<td>x5 - x6</td>
<td>t0 - t2</td>
<td>Temporary registers</td>
</tr>

<tr>
<td>x8</td>
<td>s0/fp</td>
<td>Saved register 0. Also frame pointer.</td>
</tr>

<tr>
<td>x9</td>
<td>s1</td>
<td>Saved register.</td>
</tr>

<tr>
<td>x10, x11</td>
<td>a0, a1</td>
<td>Function arguments 0 and 1. Also return values.</td>
</tr>

<tr>
<td>x12 - x17</td>
<td>a2 - a7</td>
<td>Function arguments 2 to 7.</td>
</tr>

<tr>
<td>x18 - x27</td>
<td>s2 - s11</td>
<td>Saved registers.</td>
</tr>

<tr>
<td>x28 - x31</td>
<td>t3 - t6</td>
<td>Temporary registers.</td>
</tr>

</tbody>
</table>

## Calling convention

In general, a callee (a function being called) should preserve values in `sp`
and saved registers (`s0` to `s11`). 

`gp` and `tp` are set by the system. We should not change them in application
code.

