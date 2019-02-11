print("Starting AttParGUI.py and MATLAB Engine")

import matlab.engine
import numpy as np
import sys
import time
import math
from PyQt5 import QtCore, QtWidgets, QtGui, Qt, uic
from PyQt5.QtGui import QTextCursor

print("This may take a few moments...")
eng = matlab.engine.start_matlab()
print("... successful Engine Start.")
print("The AttParGUI should open momentarily.")

qtCreatorFile = "attpar_ui.ui"  # Enter file here.
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)

convDict = {'de':1,'dq':2,'dg':3,'dp':4,'dm':5,'ed':6,\
'eq':7,'qe':8,'qd':9,'qg':10,'gq':11,'gd':12,'pd':13,'md':14}

class Window(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        self.showMaximized()
        self.initUI()

    def initUI(self):
        self.convB.clicked.connect(self.readInputF)
        self.inputT.textChanged.connect(self.checkRead)

    def checkRead(self):
        try:
            inputString = str(self.inputT.toPlainText())
            a = np.matrix(inputString)
            b = a.tolist()
            R = matlab.double(b)
            if inputString != "":
                self.statusL.setStyleSheet("color:#1358bf")
                self.statusL.setText('Input Status: Readable')
            else:
                self.statusL.setStyleSheet("color:#d80202")
                self.statusL.setText('Input Status: NOT Readable')
        except:
            self.statusL.setStyleSheet("color:#d80202")
            self.statusL.setText('Input Status: NOT Readable')

    def readInputF(self):
        self.Y = 0.0
        self.outputT.clear()
        self.setConvTypeF()
        if self.indexNum != 0:
            inputString = str(self.inputT.toPlainText())
            #print(inputString)
            try:
                #Check if we can create a matrix from input text.
                a = np.matrix(inputString)
                b = a.tolist()
                R = matlab.double(b)
                print("\nPython Input Matrix X: ")
                print(R)
                #try to run matlab script
                #print("Beginning Try...")
                print("Y = attpar(X, %d)" % self.indexNum)
                self.Y = eng.attpar(R, self.indexNum);
                #self.Y = eng.transposeAndRunAttPar(R,self.indexNum);
                print("Ran MATLAB attpar.m Script")
            except:
                self.history.moveCursor(QTextCursor.End)
                self.history.insertPlainText("> ERROR: MATLAB Engine Failure\n")
                if inputString == "":
                    self.history.insertPlainText(">> CAUSE: Empty Input\n")
                if str(self.toCombo.currentText()) == "Euler Angles":
                    self.history.insertPlainText(">> LIKELY CAUSE: Need Sequence\n")
                self.history.moveCursor(QTextCursor.End)

            if self.Y == 0.0:
                self.history.moveCursor(QTextCursor.End)
                self.history.insertPlainText("> ERROR: Cannot Convert\n")
                self.history.moveCursor(QTextCursor.End)
            else:
                self.printMatrix()
                self.history.moveCursor(QTextCursor.End)
                self.history.insertPlainText("> Successful Conversion\n")
                self.history.moveCursor(QTextCursor.End)

    def printMatrix(self):
        Y = self.Y
        self.outputT.clear()
        #formatPrint = 0;
        formatPrint = 1;
        self.outputT.insertPlainText(str(self.toCombo.currentText()) + ":\n")
        rows = len(Y)
        cols = len(Y[0])
        precString = str(self.precCombo.currentText())
        #else:
        print("MATLAB Output Matrix Y: ")
        print(str(Y))
            #self.outputT.insertPlainText(str(Y))
        if formatPrint != 0:
            for i in range(rows):
                for j in range(cols):
                    if precString[0] == "D":
                        self.outputT.insertPlainText(str(Y[i][j]))
                    else:
                        self.outputT.insertPlainText(str(round(Y[i][j],int(precString[0]))))
                    if j != cols - 1:
                        self.outputT.insertPlainText("  ")
                if i != rows - 1:
                    self.outputT.insertPlainText(";\n")

    def setConvTypeF(self):
        fromText = str(self.fromCombo.currentText())
        toText = str(self.toCombo.currentText())
        if fromText == toText:
            self.history.moveCursor(QTextCursor.End)
            self.history.insertPlainText("> Not a Conversion\n")
            self.history.moveCursor(QTextCursor.End)
            self.indexNum = 0
        else:
            self.history.moveCursor(QTextCursor.End)
            self.history.insertPlainText("> Converting from " + fromText + " to "\
             + toText + "\n")
            self.history.moveCursor(QTextCursor.End)
            dictText = (fromText[0]).lower()+(toText[0]).lower()
            try:
                self.indexNum = convDict[dictText]
            except:
                self.history.moveCursor(QTextCursor.End)
                self.history.insertPlainText("> Not a Possible Conversion Choice\n")
                self.history.moveCursor(QTextCursor.End)
                self.indexNum = 0
def main():
    app = QtWidgets.QApplication(sys.argv)
    main = Window()
    main.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
