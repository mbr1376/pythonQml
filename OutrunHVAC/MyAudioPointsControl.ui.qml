/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Outrun demo.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Controls
import QtQuick3D
import OutrunHVAC 1.0
import QtQuick3D.Effects
import Quick3DAssets.Seat_HVAC 1.0
import QtQuick3D.Particles3D
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: audioPointsControl
    width: 1280
    height: 606
    color: "#00ffffff"

    property bool soundpoint1Checked: customCheckbox.checked
    property bool soundpoint2Checked: customCheckbox1.checked
    property bool soundpoint3Checked: customCheckbox2.checked
    property alias soundSystemVisual: soundSystemVisual
    property alias soundSystemVisualVisible: soundSystemVisual.visible

    SoundSystemVisual {
        id: soundSystemVisual

        x: 670
        y: 49
        width: 471
        height: 523

        showPoint1: soundpoint1Checked
        showPoint2: soundpoint2Checked
        showPoint3: soundpoint3Checked
    }

    // checkboxes
    Row {
        id: checkpointsrow
        width: 80
        height: 400
        x: 31
        y: 186

        Column {
            id: checkColumn
            width: 130
            height: 400
            spacing: 76

            MyCustomCheckbox {
                id: customCheckbox
                checked: true
            }

            MyCustomCheckbox {
                id: customCheckbox1
                onColor: "#7078BB"
                checked: false
            }

            MyCustomCheckbox {
                id: customCheckbox2
                onColor: "#9A989C"
                checked: false
            }
        }

        Column {
            id: textColumn
            width: 200
            height: 400
            spacing: 76
            Text {
                id: text1
                text: qsTr("Sound point 1")
                font.pixelSize: 20
                font.family: "Open Sans"
                color: hvacmain.globalDaymode ? "black" : "white"
            }
            Text {
                id: text2
                text: qsTr("Sound point 2")
                font.pixelSize: 20
                font.family: "Open Sans"
                color: hvacmain.globalDaymode ? "black" : "white"
            }
            Text {
                id: text3
                text: qsTr("Sound point 3")
                font.pixelSize: 20
                font.family: "Open Sans"
                color: hvacmain.globalDaymode ? "black" : "white"
            }
        }
    }

    Rectangle {
        id: rectangle
        x: 31
        y: 498
        width: 413
        height: 75
        color: "#00ffffff"

        Image {
            id: infoDay
            x: -1
            y: 24
            source: hvacmain.globalDaymode ? "images/ui/infoDay.png" : "images/ui/infoNight.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text4
            x: 50
            y: 15
            width: 413
            height: 45
            text: qsTr("You can drag a sound point to your preferred location. Hold the point to change intensity.")
            font.pixelSize: 16
            wrapMode: Text.WordWrap
            font.family: "Open Sans"
            color: hvacmain.globalDaymode ? "black" : "white"
        }
    }

    MyDragPopup {
        visible: soundSystemVisual.intensityMode
        x: soundSystemVisual.dragPoint ? soundSystemVisual.x
                                         + soundSystemVisual.dragPoint.center.x - 100 : 0
        y: soundSystemVisual.dragPoint ? soundSystemVisual.y
                                         + soundSystemVisual.dragPoint.center.y - 100 : 0

        barColor: soundSystemVisual.dragPoint ? soundSystemVisual.dragPoint.color : "#000000"
        barProgress: soundSystemVisual.intensityProgress
    }
}



