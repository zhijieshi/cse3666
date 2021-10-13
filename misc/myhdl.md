#  MyHDL 

MyHDL is a Python package that enables us to describe hardware in Python. We
pick MyHDL, out of many options, because students taking CSE 3666 are familiar
with Python. Also, MyHDL is very similar to Verilog. It would be easier for
students to pick up Verilog in the future. 

MyHDL works with Python 3.4 or above. Python on this page means a version that
works with MyHDL.

We have many ways to start Python and a Python script. The command could be
`py`, `python`, or `python3`. It depends on the system and on the environment.

## Setting up

Python packages can be installed in many different ways.
[This page on Python.org](https://packaging.python.org/tutorials/installing-packages/)
explains the installation of Python packages in detail.
[The MyHDL Github Repo](https://github.com/myhdl/myhdl) has instructions specific to MyHDL.  

### Pip command

On computers where you have the admin priviledge (e.g., on your own computer)
just run pip to install MyHDL. 

```
pip install myhdl

# another way. try py or python if python3 does not work
python3 -m pip install myhdl
```

On computers where you do not have the admin priviledge, 
try to install packages to the user site.

```
python3 -m pip install --user myhdl
```

It is recommended to install packages for each kind of projects in a virtual
envrionment. See [this section](#python-virtual-environment) for how to create
a virtual environment. Once the virtual environment is activated, run pip to
install MyHDL.

### Computers in Learning Center

On computers in the Learning Center, it is better to work in Anaconda.  

* Start an Anaconda Prompt or an Anaconda Powershell Prompt. Search 'Anaconda'
  in the search box on the task bar and then click the prompt.

* Run [the pip command shown earlier](#pip-command). 

In Anaconda Prompt, use `python` to start Python. `py` starts a different installation
of Python.

Learning Center computers are reimaged from time to time. We may have to
install MyHDL again if it happens.

### On Engineering virtual PC

The advantage of using Engineering virtual PC is that we can access it anywhere in a web browser. 

On Engineering virutal PCs, `cmd.exe` is disabled. However, as of September 2021, we can still start Powershell.
Run pip in PowerShell to install MyHDL. Packages are installed in user directory.

The virtual PCs are also reimaged from time to time. It is better to use Python virtual environment.

## Simulate 

Once myHDL is installed, we can use it in your Python script. 

Some examples can be downloaded from
[here](https://github.com/zhijieshi/cse3666/tree/master/digital-logic/myhdl). 
To run the examples, just run the scripts as a regular Python script.  
Remember to activate the virtual environment if necessary. There should be
no error messages when we run the scripts.

For example, the following is the output of `gate2.py`.

```
(venv3) PS P:\myhdl\examples> python gate2.py
a b | and or  not
0 0 | 0   0   1
0 1 | 0   1   1
1 0 | 0   1   0
1 1 | 1   1   0
```

## Python virtual environment 

The instructions for creating virtual environment in Python are provided on
[the help page of Python 3](https://docs.python.org/3/library/venv.html).

Here are the commands on Windows 10. Run the commands in cmd or powershell.
Replace the commands and folder/directory paths with proper ones on your
system. Pay attention to how you specify a directory in your environment.
The commands below work in Powershell on the Engineering virtual PC. 

* Create a directory for the vitual environment, for example, `p:\venv3`.
  
```
mkdir p:\venv3
```

* Use Python venv to create a virtual environment. 

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

Go ahead to install MyHDL package in this environment. Remember to activate the
virtual environment before you run any Python scripts that use MyHDL. 

The command to start Python may change in the virtual environment.  For
example, on the Engineering virtual PC, the command is `py` in the native system
environment and it is `python` in the virtual environment. 

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

# Links

* [HDL](https://github.com/drom/awesome-hdl). Many high level HDLs. 

* B. Bailey. [The evolution of High Level
  Synthesis](https://semiengineering.com/the-evolution-of-high-level-synthesis/),
Semiconductor Engineering, Aug 27, 2020.

* [GTKWave Repo](https://github.com/gtkwave/gtkwave). 
  [An older version on SourceForge](http://gtkwave.sourceforge.net/).
