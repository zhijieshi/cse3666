
RARS (RISC-V Assembler and Runtime Simulator) is written in Java and built upon
MARS (MIPS Assembler and Runtime Simulator), which we used in CSE 3666 when
MIPS was taught in the course. 

[RARS Github repo is here.](https://github.com/TheThirdOne/rars)

## Install Java

We will need Java to run RARS. Java is already installed in lab computers. If
you would like to install it on your own computer, please find the installation
instructions on the Internet for the operating system you use. 

### Windows

You can download and install Java manually. Here is 
[the Java download link at Java.com](https://java.com/en/download/windows_manual.jsp).
As of August 2021, the version is Version 8 update 301.

You can also use package management software to install. For example, 
the Chocolatey package is [here](https://community.chocolatey.org/packages/jre8). 

### Linux

There are many tutorials on the Internet, for different editions/versions of Linux.
For example, [this page on DigitalOcean.com](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04) has the instructions to install Java on Ubuntu 20.04.

## Download RARS

Download RARS from [RARS Github repo.](https://github.com/TheThirdOne/rars).
We do not need the entire repo. Click the "tags", as shown in the following figure. 

![Click 'tags'](./rars-images/tags1.png?raw=true)

Find the latest stable version, for example, v1.5 released in July 2021. Click the 
version you would like to download. 

![Click version](./rars-images/tags2.png?raw=true)

You will see a page that explains what is new in the version. Scroll down to
the bottom of the page and find the download link for a jar file, for example,
`rars1_5.jar`.

On lab computers, you can save the jar file on P drive so the file is available
even if you log in on a different computer. 

## Start RARS

If everything goes smoothly, you can run the downloaded jar file. On Windows, 
you can just double click the downloaded jar file. You can see a screenshot
of RARS on the RARS repo README page. 

RARS can also be started from the command line if PATH is set correctly.

```
java -jar .\rars.jar
```

## Run an RISC-V Program

Follow the following steps to run an example. 

1. Download the example program `01-hello.s`. It is under
   [the rv-examples directory](https://github.com/zhijieshi/cse3666/tree/master/rv-examples). 
   Remember the location of the downloaded file on your computer.

2. Start RARS. On Windows, double click the jar file. 

3. Use the File/Open menu to open the example program `01-hello.s` in RARS. There is a
   nice built-in editor for editing source code directly in RARS.

4. In order to run the code, you need to assemble the instructions, i.e.,
   convert the instructions to machine code. This can be done by using menu
   Run/Assemble. You can also use the keyboard shortcut F3. If there are errors in
   the code, RARS will report the errors and will not generate the binary code.
   You can go back to the editor to fix problems. If the program is successfully
   assembled, you will see a new tab called “Execute”.

5. After successfully assembling the instructions, you can run the code by selecting Run/Go, or pressing F5.

6. If you like to run the program again, reset the simulator first (Run/Reset or F12). Then select Run/Go.

Congratulations! You already have run a RISC-V program twice. 

You can also run the program on the command line. Replace `rars.jar` with
the path to the RARS jar file on your computer. 

```
java -jar rars.jar .\01-hello.s
```

## Get familiar with RARS

RARS provides many functions/features to help you debug your program. Knowing
the features (set breakpoints, step/backstep, check/change register values,
examine memory contents, etc.) will help you a lot when you debug your code.
Let us experiment with a few here.

### Step and backstep
Instead of letting the program run to the end, you can run instructions one by one. 
After the simulator is reset, select Run/Step (F7). The instruction that is going to be
executed next is highlighted. There is a window that shows the values of all
registers. You can observe how data in registers are updated. The simulator may
show the values in hexadecimal. You can change them to decimal (uncheck
Settings/Values displayed in hexadecimal). The register that has been modified
is highlighted.

You can also undo instructions by selecting Run/Backstep (F8).

### Breakpoint

We can set a breakpoint at an instruction by checking the checkbox on the same
line of the instruction (in the Bkpt column).  The simulator will stop before
executing the instructions at the breakpoints. You can examine the values in
registers/memory, change the values if you like, and decide what to do next.
For example, you can stop the program, step to the next instruction, or run to
the end or the next breakpoint.  

Run/Clear all breakpoints (Ctrl-k) clear all breakpoints. Run/Toggle (Ctrl-T)
disable/enable all breakpoints. Assembling a program also clears all the breakpoints.

