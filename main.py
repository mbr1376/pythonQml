# This Python file uses the following encoding: utf-8
import sys
import os
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    current_dir = os.path.dirname(os.path.realpath(__file__))
    os.environ["QT_QUICK_CONTROLS_CONF"] = os.path.join(
           current_dir, "Testqml", "qtquickcontrols2.conf"
       )
    os.environ["QT_AUTO_SCREEN_SCALE_FACTOR"] = "1"

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    import_path = os.path.join(current_dir, "Testqml", "imports")
    import_path1 = os.path.join(current_dir, "Testqml", "content")
    engine.addImportPath(import_path )
    engine.addImportPath(import_path1 )
    print(engine.importPathList())
    qml_file = os.path.join(current_dir, "Testqml/content", "App.qml")
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
