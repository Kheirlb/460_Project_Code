# Attitude Parameter Conversion

AttParGUI is a user interface designed to easily convert between various attitude representations using MATLAB functions.

## Dependencies
- MATLAB
- MATLAB Aerospace Toolbox

- Python 3.6
- PyQt5
- Numpy
- MATLAB Engine for Python

![Screenshot](https://github.com/Kheirlb/460_Project_Code/blob/master/Attitude/AttPar/Python_AttPar/images/AttParGUIsmallv2.JPG?raw=true)

## Installation Procedure
Please follow the below installation procedure. You will be required to use the Window Command Prompt or Terminal frequently so you may want to visit this tutorial if you are confused: https://www.bleepingcomputer.com/tutorials/windows-command-prompt-introduction/. Many of these installations require admin privileges so: Make sure you click "Run as Administrator" for the command line on Windows. If you are on a MAC, I think you just have to add "sudo" to every command.

Unfortunately, I failed to make an executable file because of strange mlarray errors. You will have to follow the more labor intensive process below for now. Don't worry, I've simplified the work as much as I can. 10-15 minutes install time for people new to python and the command prompt or terminal.

### Install MATLAB
- You can figure that out (Probably already complete). You may need to install the Aerospace Toolbox if you plan to convert from Direction Cosine Matrix to Euler Angles.

### Install Python 3.6 (MATLAB R2018A Engine for Python supports Python version 2.7, 3.5 and 3.6)
- Make sure you select "Add Python 3.6 to PATH" on first page of installer.
- Go to: https://www.python.org/downloads/release/python-368/
- For Windows: Use -64 bit installer for -64 bit MATLAB
- After Python 3.6 installation, reboot computer. This will ensure "Add Python 3.6 to PATH" works.
- After computer reboot, open Command Prompt/Terminal.
- Did I mention, make sure you right click on cmd and click "Run as Administrator" for the command line on Windows.
- Type in terminal "python -V" and you should see your python version display in the terminal. This confirms Python and PATH Installation went without errors. If you have errors, contact me.

### Install PyQt5 (GUI Library)
- Remember make sure you right click on cmd and click "Run as Administrator" for the command line on Windows.
- Type in terminal (Command Prompt):
```
  python -m pip install pyqt5-tools
```

### Install Numpy (Python Matrix Library)
Type in terminal:
```
  python -m pip install numpy
```
### Install GitHub Desktop (Easily Collect Code and Receive Updates)
- Follow link and install: https://desktop.github.com/

### Download our Python/MATLAB Program Code
- Open GitHub Desktop, click File, click Clone Repository, click URL, and clone our 460 repository by copy/pasting this link: https://github.com/Kheirlb/460_Project_Code.git and clicking clone.

### Configure MATLAB with Python
- Follow the below link to learn how to install the MATLAB Engine for python:
- https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html
Below is the basic how-to from the link:
- Open MATLAB and enter this into the Command Window:

```
  matlabroot
```
Copy the path returned by _matlabroot_.
Go back to your Command Prompt with Administrator privileges and enter the below lines:

```
cd "matlabroot\extern\engines\python"
python setup.py install
```

Make sure you replace _matlabroot_ with your copied _matlabroot_.

## Run the Program!
- Open a new terminal (this one doesn't require Administrator privileges)
- Navigate to directory where you installed our Program Code, specifically the "Python_AttPar" directory. This usually involves typing "cd " (which means "change directory") followed by the file path. "cd .." is the reverse and lets you go back one directory.
- This is where you want to go for example:
```
  cd Documents\GitHub\460_Project_Code\Attitude\AttPar\Python_AttPar
```
Then type...
```
  python AttParGUI.py
```
...to open the user interface. CONGRATS!
