#  MyHDL 

MyHDL is a Python package that enables us to describe hardware in Python. We
pick MyHDL, out of many options, because students taking CSE 3666 are familiar
with Python. Also, MyHDL is very similar to Verilog. It would be easier for
students to pick up Verilog in the future. 

MyHDL works with Python 3.4 or above. Python on this page means a version that
works with MyHDL. The Python version on lab computers is 3.10.

We have many ways to start Python and a Python script. The command could be
`py`, `python`, or `python3`. It depends on the system and on the environment.
We will use the lab computer as example. It is a Windows 11 system with Python
3.10 installed.

## Computers

Students can use their own computers to set up Python and MyHDL, and many do.
However, if they run into problems, it may take a long time to troubleshoot.
So if one has problems with their own computer, please use the lab computer. 

## Setting up

You can set up the lab environment on your own PC. If you have trouble, please
use lab computers.

### Python virtual environment 

It is recommended to install packages for each kind of projects in a separate
Python virtual envrionment. We will set up a Python virtual environment for
this course. We can creae a Python virtual environment and install packages in
the environment without admin privilege.

The commands below work in Powershell on lab computers.  The instructions for
creating virtual environment in Python are provided on [the help page of Python
3](https://docs.python.org/3/library/venv.html).

When you start PowerShell, you should be in your home directory. If not, use
`cd $home` to go to your home directory. Typically, the path to your home
directory looks like `c:\Users\YourNetID`. 

**The following commands assume you are in your home directory.**

*   Create a directory for the vitual environment, for example, `venv` .
  
        mkdir venv

*   Use Python venv module to create a virtual environment. 

        py -m venv venv

*   Activate the virtual environment. The command depends on the OS and the shell
    you use. Check the scripts in the `Scripts` directory and find the correct script.
    The following are the commands for PowerShell. If you see security warning, choose
    "Run" the script.

        .\venv\Scripts\Activate.ps1

    If you see error messages asking you to set execution policy, use the
    following commands to set ExecutionPolicy in PowerShell then run
    Activate.ps1 again. The first command below sets the execution policy of
    the current user to RemoteSigned, which is more secure than Unrestricted.
    The script generated in recent Python is signed. However, it may not work
    on your computer. If RemoteSigned does not work, try Unrestricted.  Note
    that the Unrestricted policy allows any script (signed or unsigned) to run.
    If you are not comfortable with that, you can change the scope to process,
    which is only effective to that instance of Powershell. The downside is
    that you will have to set the policy every time you have a new session.

        Set-ExecutionPolicy RemoteSigned -scope currentuser
        Set-ExecutionPolicy Unrestricted -scope currentuser
        Set-ExecutionPolicy Unrestricted -scope process

If everything works, you are in the virtual environment. Notice that the
current virtual environment is shown inside the parentheses before the 
command line prompt.

        (venv) PS C:\Users\YourNetID>

Continue to install MyHDL package with `pip` in this environment. Remember to
activate the virtual environment before you run any Python scripts that require
MyHDL. 

Once in the virtual environment, we use `python` to run Python scripts. Do not
use `py`, which starts Python in the native system environment.

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
[here](./examples). 

To run the examples, first downlaod them and then run the scripts as a regular
Python script.  There should be no error messages when we run the scripts.
**Remember to activate the virtual environment first**.

For example, the following is the output of `gate2.py`.

```
# In your virtual envrionment, run "python gate2.py"
a b | and or  not_a
0 0 | 0   0   1
0 1 | 0   1   1
1 0 | 0   1   0
1 1 | 1   1   0
```

The following is the output of `mux.py`. This file has two implementations of
2-input multiplexor.

```
# In your virtual envrionment, run "python mux.py"
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

