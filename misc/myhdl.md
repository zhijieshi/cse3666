#  MyHDL 

We pick MyHDL, out of many options, because students taking CSE 3666 are
familiar with Python. MyHDL is actually very similar to Verilog. It would
be easier to pick up Verilog in the future. 

## Setting up

The packages can be installed in many different ways.  [The MyHDL Github
Repo](https://github.com/myhdl/myhdl) lists several of them. 

To reduce the risk of conflicting with other pacages, we can install 
myHDL in a virtual envrionment. [Here is the help page on creating 
virtual environment in Python 3](https://docs.python.org/3/library/venv.html).


Here are the commands for Windows. Run the commands in cmd or powershell.

* Create a directory for the vitual environment, for example, `p:\venv3`.

```
mkdir p:\venv3
```

* Use Python 3 to run venv and create the virtual environment. You may have to
  use `python3` to start Python 3 on your computer.

```
python -m venv p:\venv3
```

* Activate the virtual environment. The command depends on the OS and the shell
  you use. Check the scripts in the `Scripts` directory and find the correct script.
  The following are the commands for PowerShell.

```
cd P:\venv3\Scripts
.\Activate.ps1
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


# Links

* [HDL](https://github.com/drom/awesome-hdl). Many high level HDLs. 

* B. Bailey. [The evolution of High Level
  Synthesis](https://semiengineering.com/the-evolution-of-high-level-synthesis/),
Semiconductor Engineering, Aug 27, 2020.
