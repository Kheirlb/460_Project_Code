print("Starting AttParGui")

import matlab.engine
import numpy as np
import sys
import time
from PyQt5 import QtCore, QtWidgets, QtGui, Qt, uic
from PyQt5.QtGui import QTextCursor
eng = matlab.engine.start_matlab()
print("Started Matlab")

#ret = eng.triarea(1.0,5.0)
#print("Ran Function")
#print(ret)

qtCreatorFile = "attpar_ui.ui"  # Enter file here.

Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)

class Window(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        #self.showMaximized()
        self.initUI()

    def initUI(self):
        self.calc_area_b.clicked.connect(self.triArea)
        self.convB.clicked.connect(self.readInputF)

    def triArea(self):
        self.history.insertPlainText("Calc Area Button Clicked\n")
        base_val = float(self.base.text())
        height_val = float(self.height.text())
        ret = eng.triarea(base_val, height_val)
        self.area.setText(str(ret))

    def readInputF(self):
        inputString = str(self.inputT.toPlainText())
        print(inputString)
        a = np.matrix(inputString)
        b = a.tolist();
        c = matlab.double(b)
        print(c)
        R = c
        Y = eng.attpar(R,1);
        print(Y)
        self.history.insertPlainText("Converted from DCM to Quaternion\n")
        self.outputT.setText(str(Y))

def main():
    app = QtWidgets.QApplication(sys.argv)
    main = Window()
    main.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
