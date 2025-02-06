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

Rectangle {
    id: controlBar
    width: 1280
    height: 116
    color: globalDaymode ? "#ffffff" : "#000000"
    property bool acOn: DData.acOn
    property bool acAuto: DData.autoOn
    property bool acSync: DData.dualOn
    property real fanspeed: ventControls.fanspeed
    property bool rearwindowDefrost: DData.defrostRear
    property bool windscreeDefrost: DData.defrostFront
    property bool recirculation: DData.recircOn
    property bool heaterOnDriver: seatControls.driverheater
    property bool heaterOnPassenger: seatControls1.driverheater

    property bool heateroverridedriver: false
    property bool heateroverridepassenger: false

    Rectangle {
        id: ac
        x: 28
        y: 28
        width: 308
        height: 60
        color: "#00ffffff"

        Text {
            id: acOntext
            x: 16
            y: 8
            width: 58
            height: 44
            opacity: hvacmain.acOn ? 1 : 0.5
            text: qsTr("A/C")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.weight: hvacmain.acOn ? Font.Bold : Font.Normal
            font.family: "Open Sans"
            color: globalDaymode ? "#000000" : "#ffffff"

            Rectangle {
                id: rectangle
                x: 21
                y: 53
                width: 16
                height: 4
                color: "#d200a4"
                radius: 100
                visible: hvacmain.acOn
            }
        }

        Text {
            id: acAutotext
            x: 108
            y: 8
            width: 77
            height: 44
            opacity: hvacmain.acAuto ? 1 : 0.5
            color: globalDaymode ? "#000000" : "#ffffff"
            text: qsTr("Auto")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.family: "Open Sans"
            font.weight: hvacmain.acAuto ? Font.Bold : Font.Normal

            Rectangle {
                id: rectangle1
                x: 30
                y: 53
                width: 16
                height: 4
                color: "#d200a4"
                radius: 100
                visible: hvacmain.acAuto
            }
        }

        Text {
            id: acSynctext
            x: 213
            y: 8
            width: 74
            height: 44
            opacity: hvacmain.acSync ? 1 : 0.5
            color: globalDaymode ? "#000000" : "#ffffff"
            text: qsTr("Sync")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.family: "Open Sans"
            font.weight: hvacmain.acSync ? Font.Bold : Font.Normal

            Rectangle {
                id: rectangle2
                x: 29
                y: 53
                width: 16
                height: 4
                color: "#d200a4"
                radius: 100
                visible: hvacmain.acSync
            }
        }

        CheckBox {
            id: acOncheckbox
            x: 30
            y: 24
            width: 13
            height: 12
            text: qsTr("")
            opacity: 0
            scale: 7.3
            onCheckStateChanged: DData.acOn = acOncheckbox.checked
        }

        CheckBox {
            id: acAutocheckbox
            x: 140
            y: 24
            width: 13
            height: 12
            opacity: 0
            text: qsTr("")
            scale: 7.3
            onCheckStateChanged: DData.autoOn = acAutocheckbox.checked
        }

        CheckBox {
            id: acSynccheckbox
            x: 246
            y: 24
            width: 13
            height: 12
            opacity: 0
            text: qsTr("")
            scale: 7.3
            onCheckStateChanged:{
                    synctimer.running = true
                    DData.dualOn = acSynccheckbox.checked
                }

        }
        Timer{
            id: synctimer
            running: false
            interval: 1000
            onTriggered: acSynccheckbox.checked = false
        }
    }

    Rectangle {
        id: ventilation
        x: 932
        y: 28
        width: 308
        height: 60
        color: "#00ffffff"
        Rectangle {
            id: rearDefrost
            x: 53
            y: 8
            width: 58
            height: 44
            color: "#00ffffff"

            Rectangle {
                id: rectangle3
                x: 21
                y: 53
                width: 16
                height: 4
                visible: hvacmain.rearwindowDefrost
                color: "#d200a4"
                radius: 100
            }

            Image {
                id: day_Rearwindowdefrost_48
                x: 5
                y: 0
                opacity: hvacmain.rearwindowDefrost ? 1 : 0.5
                source: !hvacmain.globalDaymode ? "Night/Night_Rearwindowdefrost_48.png"
                                                : "Day/Day_Rearwindowdefrost_48.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: windDefrost
            x: 142
            y: 8
            width: 77
            height: 44
            color: "#00ffffff"

            Rectangle {
                id: rectangle4
                x: 30
                y: 53
                width: 16
                height: 4
                visible: hvacmain.windscreeDefrost
                color: "#d200a4"
                radius: 100
            }

            Image {
                id: day_Windscreendefrost_48
                x: 14
                y: -2
                opacity: hvacmain.windscreeDefrost ? 1 : 0.5
                source: !hvacmain.globalDaymode ? "Night/Night_Windscreendefrost_48.png"
                                                : "Day/Day_Windscreendefrost_48.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: recirculation
            x: 239
            y: 8
            width: 74
            height: 44
            visible: true
            color: "#00ffffff"

            Rectangle {
                id: rectangle5
                x: 29
                y: 53
                width: 16
                height: 4
                visible: hvacmain.recirculation
                color: "#d200a4"
                radius: 100
            }

            Image {
                id: day_Recirculatedair_48
                x: 13
                y: -2
                opacity: hvacmain.recirculation ? 1 : 0.5
                source: !hvacmain.globalDaymode ? "Night/Night_Recirculatedair_48.png"
                                                : "Day/Day_Recirculatedair_48.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        CheckBox {
            id: rearwindowDefrostcheckbox
            x: 76
            y: 31
            width: 13
            height: 12
            opacity: 0
            text: qsTr("")
            scale: 7.3
            onCheckedChanged: DData.defrostRear = rearwindowDefrostcheckbox.checked
        }

        CheckBox {
            id: windscreeDefrostcheckbox
            x: 179
            y: 31
            width: 13
            height: 12
            opacity: 0
            text: qsTr("")
            scale: 7.3
            onCheckedChanged: DData.defrostFront= windscreeDefrostcheckbox.checked
        }

        CheckBox {
            id: recirculationcheckbox
            x: 270
            y: 31
            width: 13
            height: 12
            opacity: 0
            text: qsTr("")
            scale: 7.3
            onCheckedChanged: DData.recircOn= recirculationcheckbox.checked
        }

        Rectangle {
            id: rectangle6
            x: -300
            y: 60
            width: 16
            height: 4
            visible: hvacmain.fanspeed > 0
            color: "#d200a4"
            radius: 100
        }
    }

    MySeatControls {
        id: seatControls
        driverSeat: true
        heaterOnOverride: heateroverridedriver
    }

    MySeatControls {
        id: seatControls1
        driverSeat: false
        heaterOnOverride: heateroverridepassenger
    }

    MyVentControls {
        id: ventControls
        x: 0
        y: 0
        scale: 1
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33;height:116;width:1280}
}
##^##*/

