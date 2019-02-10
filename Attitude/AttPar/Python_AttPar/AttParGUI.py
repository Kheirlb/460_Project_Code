print("Starting AttParGUI and MATLAB Engine")

import matlab.engine
import numpy as np
import sys
import time
from PyQt5 import QtCore, QtWidgets, QtGui, Qt, uic
from PyQt5.QtGui import QTextCursor

eng = matlab.engine.start_matlab()
print("... Successful Start")
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
                self.statusL.setText('Input Status: Readable')
            else:
                self.statusL.setText('Input Status: NOT Readable')
        except:
            self.statusL.setText('Input Status: NOT Readable')

    def readInputF(self):
        self.Y = 0.0
        self.outputT.clear()
        self.setConvTypeF()
        if self.indexNum != 0:
            inputString = str(self.inputT.toPlainText())
            #print(inputString)
            #Check if we can create a matrix from input text.
            a = np.matrix(inputString)
            b = a.tolist()
            R = matlab.double(b)
            print(R)
            #try to run matlab script
            try:
                #print("Beginning Try...")
                print(self.indexNum)
                self.Y = eng.attpar(R,self.indexNum);
                #self.Y = eng.transposeAndRunAttPar(R,self.indexNum);
                print("Ran MATLAB AttPar Script")
                print(self.Y)
            except:
                self.history.moveCursor(QTextCursor.End)
                self.history.insertPlainText("> ERROR: MATLAB Engine Failure\n")
                if inputString == "":
                    self.history.insertPlainText(">> CAUSE: Empty Input\n")
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
        #else:
        print(str(Y))
            #self.outputT.insertPlainText(str(Y))
        if formatPrint != 0:
            for i in range(rows):
                for j in range(cols):
                    self.outputT.insertPlainText(str(Y[i][j]))
                    if j != cols - 1:
                        self.outputT.insertPlainText(" ")
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
