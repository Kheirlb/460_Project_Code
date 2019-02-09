# Attitude Parameter Conversion

## Dependencies
- MATLAB
- Python3.6
- PyQt5
- Numpy

## Installation Procedure
Unfortunately failed to make executable because of mlarray errors. Please follow the below installation procedure instead.

### Install MATLAB
- You can figure that out (Probably already complete).

### Install Python3.6
- Go to: https://www.python.org/downloads/release/python-368/
- For Windows: Use -64 bit installer for -64 bit MATLAB
- Make sure you select "Add Python 3.6 to PATH" on first page of installer.
- After Python3.6 installation, reboot computer. This will ensure "Add Python 3.6 to PATH" works.
- After computer reboot, open Command Prompt/Terminal.
- Make sure you click "Run as Administrator" for the command line on Windows.
- Type in terminal "python -V" and you should see your python version display in the terminal. This confirms Python and PATH Installation went well.

### Install PyQt5
Type in terminal:

```
  python -m pip install pyqt5-tools
```

### Install Numpy
Type in terminal:
```
  python -m pip install numpy
```
### Install GitHub
- Follow link and install: https://desktop.github.com/

### Install AttPar Python/MATLAB Program Code.
- Open GitHub, click File, click Clone Repository, click URL, and clone our 460 repository by copy/pasting this link: https://github.com/Kheirlb/460_Project_Code.git and clicking clone.

### Configre MATLAB with Python
- Open MATLAB and enter this into the Command Window:
```
  cd (fullfile(matlabroot,'extern','engines','python'))
  system('python setup.py install')
```

## Run the Program!
In your terminal, navigate to directory where you installed our Program Code. This usually involves typing "cd " followed by the location. For example:
```
  cd Documents\GitHub\460_Project_Code\Attitude\AttPar\Python_AttPar\
```
Then Type:
```
  python AttParGUI.py
```
And your program should run!
