#  MyHDL 

MyHDL is a Python package that enables us to describe hardware in Python. We
pick MyHDL, out of many options, because students taking CSE 3666 are familiar
with Python. Also, MyHDL is very similar to Verilog. It will be easier for
students to pick up Verilog after learning MyHDL.

We assume students can install a recent version of Python on their computer.
MyHDL works with Python 3.4 or higher. Students who have trouble installing
Python or MyHDL on their own computer can work on a lab computer while they fix
issues with their computer. The lab computers run Windows 11 and have Python
3.10 (or newer) installed.

## Install MyHDL

Once Python is installed, run the following command to install MyHDL.  We have
many ways to start Python and a Python script. The command is `py` or `python`
on Windows, or `python3` on Linux. We will use `python` in this tutorial. You
may need to change it to `python3` on your computer. 

    python -m pip install --user myhdl

If you have the admin privilege and you want to install packages globally, you
can remove the `--user` option.

If you would like to set up a Python virtual environment, see the instructions
at the end.

[This page on
Python.org](https://packaging.python.org/tutorials/installing-packages/)
explains the installation of Python packages in detail.  [The MyHDL Github
Repo](https://github.com/myhdl/myhdl) has instructions specific to MyHDL.  

## Run the examples

Once MyHDL is installed, we can use the package by importing it in our Python
scripts. 

Some MyHDL examples are provided [here](./examples). 

To run the examples, first download them and then run the scripts as a regular
Python script. There should be no error messages when we run the scripts.  If
you use a virtual environment, please remember to activate it first.

For example, the following is the output of `gate2.py`.

```
# command: python gate2.py
a b | and or
0 0 | 0   0
0 1 | 0   1
1 0 | 0   1
1 1 | 1   1
```

The following is the output of `mux2.py`. This file has three implementations
of the 2-1 multiplexor.

```
# command: python mux2.py
a b s | z1 z2 z3
0 0 0 | 0  0  0
1 0 0 | 1  1  1
0 1 0 | 0  0  0
1 1 0 | 1  1  1
0 0 1 | 0  0  0
1 0 1 | 0  0  0
0 1 1 | 1  1  1
1 1 1 | 1  1  1
```

## Troubleshooting

###  Python complains myhdl is not installed

Sometimes students run the `pip` command directly to install MyHDL. When they
run the code the requires MyHDL, `py` or `python` complains that MyHDL is not
installed. The issue could be that the system has multiple versions of Python.
Running `pip` directly installs packages for a different version of Python. One
of the following can fix the issue. 

*   Install the package with the following command, instead of `pip install myhdl`.

        python -m pip install myhdl

*   Uninstall old versions of Python, and install `pip` if needed.

*   Create a virtual environment for MyHDL projects and install MyHDL in the
    virtual environment.

On Windows, the following command lists the Python versions installed in the
system. 

    py -0p

## MyHDL Resources

[The "Why MyHDL" page](http://www.myhdl.org/start/why.html) lists advantages
of MyHDL.

The following are links to some very useful resources. See the MyHDL Github
repo for installatino instructions. 

* [MyHDL Github Repo](https://github.com/myhdl/myhdl)

* [MyHDL manual](http://docs.myhdl.org/en/stable/manual/index.html)

* [A collection of Resources](https://github.com/xesscorp/myhdl-resources)

* [RTL design in Python](http://www.es.ele.tue.nl/~jhuisken/mmips/mMips_in_Myhdl.pdf)

When simulating circuit, we can save signal values in a trace file and view the
waveforms in other software.  MyHDL saves the waveforms in `.vcd` files.  A
good free option to view ".vcd" files is GTKWave. The download links are in the
Links section.

# Python features in MyHDL

* [Generator](https://www.youtube.com/watch?v=gMompY5MyPg). Socratica. 

* [Decorator](https://www.youtube.com/watch?v=7lmCu8wz8ro&t=2730s). PyData talk from James Powell.

* [Generator](https://www.youtube.com/watch?v=7lmCu8wz8ro&t=3870s). PyData talk from James Powell.

# Links

* [HDL](https://github.com/drom/awesome-hdl). Many high level HDLs. 

* B. Bailey. [The evolution of High Level
  Synthesis](https://semiengineering.com/the-evolution-of-high-level-synthesis/),
Semiconductor Engineering, Aug 27, 2020.

* [GTKWave Repo](https://github.com/gtkwave/gtkwave). 
  [An older version on SourceForge](http://gtkwave.sourceforge.net/).

# Misc 

## Python virtual environment 

We can set up a Python virtual environment for MyHDL projects so MyHDL
does not interfere with other projects. Another advantage is we do not
need the admin privilege to install MyHDL in the virtual environment.

We include some basic commands 
The instructions for creating virtual environment in Python can be found on
[the help page of Python 3](https://docs.python.org/3/library/venv.html).
Here is [a page on Python.land](https://python.land/virtual-environments/virtualenv)
that discusses Python virtual environment.

### Windows 10/11 

You can use the commands in this section to create a Python virtual environment
on Windows and install MyHDL. We assume you are under your home directory, for
example, `C:\Users\UserName`, and would like to create the new virtual
environment in `C:\Users\UserName\myhdlvenv`. 

Here are the commands for the Command shell (cmd).

    python -m venv myhdlvenv
    .\myhdlvenv\Scripts\Activate.bat
    python -m pip install myhdl

Here are the commands for PowerShell.
    
    # create the virtual environment
    python -m venv myhdlvenv

    # activate the virtual environment
    .\myhdlvenv\Scripts\Activate.ps1

    # install myhdl
    python -m pip install myhdl

Remember to activate the virtual environment when you work on MyHDL projects. 
You can see the current virtual environment inside the parentheses before the
command line prompt. For example,  

    (myhdlvenv) PS C:\Users\UserName>

If you have trouble in running "Activate.ps1" in PowerShell, you can either use
the Command shell or set the execution policy in PowerShell. See the
"PowerShell Execution Policy" section at the bottom of this page.

### Linux 

Here are the commands for Linux.

    # install Python venv 
    sudo apt install python3-venv

    # create the virtual environment
    python -m venv ~/myhdlvenv

    # activate 
    source ~/myhdlvenv/bin/activate

    # You will see "(myhdlvenv)" before the command line prompt
    # install myhdl
    python -m pip install myhdl

###  PowerShell Execution policy  

For security reasons, some systems do not allow Activate.ps1 to run.  If you
see error messages asking you to set the execution policy, use one of the
following commands to set it in PowerShell, or you can just switch to  the
Command shell (cmd).

        Set-ExecutionPolicy RemoteSigned -scope currentuser
        Set-ExecutionPolicy Unrestricted -scope currentuser
        Set-ExecutionPolicy Unrestricted -scope process

The first command sets the execution policy of the current user to
RemoteSigned, which is more secure than Unrestricted. The script generated in
recent Python is signed. 

If the first command does not work, try the second/third command.  Note that
the Unrestricted policy allows any script (signed or unsigned) to run.  If you
are not comfortable with that, you can limit the scope to the current process
(the third command), which is only effective to that instance of Powershell.
The downside is that you will have to set the execution policy every time you
have a new PowerShell session.
