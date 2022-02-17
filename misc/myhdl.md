#  MyHDL 

MyHDL is a Python package that enables us to describe hardware in Python. We
pick MyHDL, out of many options, because students taking CSE 3666 are familiar
with Python. Also, MyHDL is very similar to Verilog. It would be easier for
students to pick up Verilog in the future. 

MyHDL works with Python 3.4 or above. Python on this page means a version that
works with MyHDL.

We have many ways to start Python and a Python script. The command could be
`py`, `python`, or `python3`. It depends on the system and on the environment.
We will assume a system that is similar to UConn AnyWare Desktop. It is a
Windows 10 system with Python 3.7 installed.

## Computers

Students can use their own computers to set up Python and MyHDL, and many do.
However, if they run into problems, it may take a long time to troubleshoot.
So if one has problems with their own computer, please use UConn AnyWare
Desktop.

### UConn AnyWare Desktop 

All UConn students have access to AnyWare Desktop. It is a virtual computer we
can access anywhere in a web browser.  The login page is
[here](https://software.uconn.edu/uconn-software-online/).  The system is
Windows 10 and has Python 3.7.x installed, as of spring 2022.

On the virtual PC, `cmd.exe` is disabled. As of Feb 2022, we can still
start Powershell. To start Powershell, search 'powershell' in the search box on
the left end of the task bar and then click the Powershell application.

It is recommended to install packages for each kind of projects in a separate
Python virtual envrionment. We will set up a virtual environment for this
course. We can install packages in the virtual environment without admin
privilege.

On the computers in the Learning Center, we also set up Python virtual
environment. If you use both computers in the Learning Center and AnyWare
Desktop, create two Python virtual environments in different folders. The
Python versions are different in these two systems. 

## Setting up

You can set up the lab environment on your own PC. If you have trouble, please
use AnyWare Desktop. 

### Python virtual environment 

The instructions for creating virtual environment in Python are provided on
[the help page of Python 3](https://docs.python.org/3/library/venv.html).

The commands below work in Powershell on AnyWare Desktop. 

*   Create a directory for the vitual environment, for example, `p:\venv`.
  
        mkdir p:\venv

*   Use Python venv module to create a virtual environment. 

        py -m venv p:\venv

*   Activate the virtual environment. The command depends on the OS and the shell
    you use. Check the scripts in the `Scripts` directory and find the correct script.
    The following are the commands for PowerShell. When you see security warning, choose
    "Run" the script.

        P:\venv\Scripts\Activate.ps1

    If you see error messages asking you to set execution policy, use the
    following command to allow unsigned script to run, for the current user.
    Then try to activate the virtual environment again.

        Set-ExecutionPolicy Unrestricted -scope currentuser

If everything works, you are in the virtual environment. Notice that the
current virtual environment is shown inside the parentheses before the 
command line prompt.

        (venv) PS P:\>

Continue to install MyHDL package with `pip` in this environment. Remember to
activate the virtual environment before you run any Python scripts that use
MyHDL. 

Once in the virtual environment, we need to use `python` to run Python scripts.
Do not use `py`. It starts Python in the native system environment.

### Pip command

Python packages can be installed in many different ways.  [This page on
Python.org](https://packaging.python.org/tutorials/installing-packages/)
explains the installation of Python packages in detail.  [The MyHDL Github
Repo](https://github.com/myhdl/myhdl) has instructions specific to MyHDL.  

In Python virtual environment, run the following command to install MyHDL. 

    python -m pip install myhdl

## Run the examples

Once MyHDL is installed, we can use the package by importing it in our Python
scripts. 

Some MyHDL examples are provided
[here](https://github.com/zhijieshi/cse3666/tree/master/digital-logic/myhdl). 

To run the examples, first downlaod them and then run the scripts as a regular
Python script.  There should be no error messages when we run the scripts.
**Remember to activate the virtual environment first**.

For example, the following is the output of `gate2.py`.

```
(venv) PS P:\myhdl\examples> python gate2.py
a b | and or  not_a
0 0 | 0   0   1
0 1 | 0   1   1
1 0 | 0   1   0
1 1 | 1   1   0
```

The following is the output of `mux.py`. This file has two implementations of
2-input multiplexor.

```
(venv) PS P:\myhdl\examples> python mux.py
a b s | z zg
0 0 0 | 0 0
0 1 0 | 0 0
1 0 0 | 1 1
1 1 0 | 1 1
0 0 1 | 0 0
0 1 1 | 1 1
1 0 1 | 0 0
1 1 1 | 1 1
```

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
good free option to view .vcd files is GTKWave. The download links are in the
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
