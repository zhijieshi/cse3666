#  MyHDL 

We pick MyHDL, out of many options, because students taking CSE 3666 are
familiar with Python. MyHDL is actually very similar to Verilog. It would
be easier to pick up Verilog in the future. 

Note that you may start Python 3 by `py`, `python`, or `python3`. It depends
on the system you use.

## Setting up

The packages can be installed in many different ways.  [The MyHDL Github
Repo](https://github.com/myhdl/myhdl) lists several of them. 

To reduce the risk of conflicting with other pacages, we can install 
myHDL in a virtual envrionment. See [this section](#python-virtual-environment)
for how to create a virtual environment.

If you can install packages, either you are an admin (e.g., on your own
computer) or use a virtual environment, just use `pip` to install myHDL. 

```
pip install myhdl

# another way
py -m pip install myhdl
```

Note that the system image on learning center computers, SoE virtual PCs, and
UConn virutal PCs are not exactly the same. Stick with one system, or create
one for each on your P drive.  

You can install packages in your home directory. It is not 

## Simulate 

Once myHDL is installed, you can use it in your Python script. 

Download examples from [here](https://github.com/zhijieshi/cse3666/tree/master/digital-logic/myhdl). 

And run the script in the environment where myhdl is installed. For example,
the following is a session that runs `mux.py`. 

Notice that the command to start Python 3 may have changed in the virtual
environment. For example, in a virtual PC, the command is `py` in the native
system environment and it is `python` in the virtual environment. 

```
(venv3) PS P:\myprojects\myhdl> python mux.py
z a b sel
0 0 0 0
0 1 0 0
1 0 1 0
1 1 1 0
0 0 0 1
1 1 0 1
0 0 1 1
1 1 1 1
0 0 0 0
0 1 0 0
<class 'myhdl.StopSimulation'>: No more events
```

## Python virtual environment 

The instructions for creating virtual environment in Python 3 are provided on
[the help page of Python 3](https://docs.python.org/3/library/venv.html).

Here are the commands for Windows. Run the commands in cmd or powershell.

* Create a directory for the vitual environment, for example, `p:\venv3`.
  Replace `p:\venv3` with the path to the directory you would like to use.
  Pay attention to how you specify a directory in your environment.

```
mkdir p:\venv3
```

* Use Python 3 to run venv and create the virtual environment. You may have to
  use `python3` or `python` to start Python 3 on your computer.

```
py -m venv p:\venv3
```

* Activate the virtual environment. The command depends on the OS and the shell
  you use. Check the scripts in the `Scripts` directory and find the correct script.
  The following are the commands for PowerShell. When you see security warning, choose
  "Run" the script.

```
cd P:\venv3\Scripts
.\Activate.ps1
```

If everything works, you are in the virtual environment. Notice that the
current virtual environment is shown inside the parentheses before the 
command line prompt.

```
(venv3) PS P:\venv3\Scripts>
``` 

Go ahead to install myHDL package in this environment. Remember to activate the
virtual environment before you run any Python scripts that depend on the
environment. 

## MyHDL Resources

[The "Why MyHDL" page](http://www.myhdl.org/start/why.html) lists advantages
of MyHDL.

The following are links to some very useful resources. See the MyHDL Github
repo for installatino instructions. 

* [MyHDL Github Repo](https://github.com/myhdl/myhdl)

* [MyHDL manual](http://docs.myhdl.org/en/stable/manual/index.html)

* [A collection of Resources](https://github.com/xesscorp/myhdl-resources)

* [RTL design in Python](http://www.es.ele.tue.nl/~jhuisken/mmips/mMips_in_Myhdl.pdf)


# Links

* [HDL](https://github.com/drom/awesome-hdl). Many high level HDLs. 

* B. Bailey. [The evolution of High Level
  Synthesis](https://semiengineering.com/the-evolution-of-high-level-synthesis/),
Semiconductor Engineering, Aug 27, 2020.
