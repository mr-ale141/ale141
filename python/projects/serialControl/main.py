from PyQt5 import QtWidgets, uic
from PyQt5.QtSerialPort import QSerialPort, QSerialPortInfo
from PyQt5.QtCore import QIODevice
from pyqtgraph import PlotWidget
import pyqtgraph as pg
import sys

app = QtWidgets.QApplication([])
ui = uic.loadUi("design.ui")
ui.setWindowTitle("SerialGUI")

serial = QSerialPort()
serial.setBaudRate(115200)
portList = []
ports = QSerialPortInfo().availablePorts()
for port in ports:
    portList.append(port.portName())
ui.comList.addItems(portList)
def onRead():
    rx = serial.readLine()
    rxs = str(rx, 'utf-8').strip()
    data = rxs.split(',')
    if data[0] == 'key1':
        ui.temp.display(data[1])
        ui.press.display(data[2])
        ui.hum.display(data[3])
        ui.delta.setText(data[4])
        ui.time.setText(data[5])
    if data[0] == 'key2':
        ui.graph.clear()
        ui.graph.plot([-60, -50, -40, -30, -20, -10],
                      [int(data[1]), int(data[2]), int(data[3]), int(data[4]), int(data[5]), int(data[6])])
    print(data)

def onOpen():
    serial.setPortName(ui.comList.currentText())
    serial.open(QIODevice.ReadWrite)

def onClose():
    serial.close()

serial.readyRead.connect(onRead)
ui.openButton.clicked.connect(onOpen)
ui.closeButton.clicked.connect(onClose)

ui.show()
app.exec()