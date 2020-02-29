import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject

if __name__ == "__main__":
   app = QApplication(sys.argv)
   engine = QQmlApplicationEngine()
   engine.load('main2.qml')
   win = QObject()
   win = engine.rootObjects()[0]
   win.show()
   sys.exit(app.exec_())
