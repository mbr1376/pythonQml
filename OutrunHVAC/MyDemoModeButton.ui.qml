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
import QtQuick3D.Effects
import QtQuick3D.Particles3D
import QtQuick3D.Helpers
import OutrunHVAC 1.0
import Quick3DAssets.Seat_HVAC 1.0
import QtQuick.Timeline

Rectangle {
    property bool seatmode: false

    id: demoModeButton
    width: 171
    height: 60
    opacity: 1
    color: "#00ffffff"
    radius: 30
    property alias democheckbox: democheckbox
    property alias democheckboxCheckState: democheckbox.checkState
    Rectangle {
        id: demoModeButton1
        x: 0
        y: 0
        width: 171
        height: 60
        opacity: democheckbox.checked? 1 : 0.7
        color: globalDaymode ? democheckbox.checked ? "#989DCE"
                                                    : "#FFFFFF" : democheckbox.checked ? "#10136A"
                                                                                       : "#000000"
        radius: 30
    }

    Text {
        id: demoText
        text: qsTr("Demo")
        font.pixelSize: 20
        x: 82
        y: 16
        color: globalDaymode ? democheckbox.checked ? "#1E1D20"
                                                    : "#5D5C60" : democheckbox.checked ? "#FFFFFF"
                                                                                       : "#9A989C"
        font.bold: true
        font.styleName: "Regular"
        font.family: "Open Sans"
    }

    Image {
        id: icon
        x: 28
        y: 16

        source: globalDaymode ? democheckbox.checked ? "images/ui/Car_28_ON_Day.png"
                                                     : "images/ui/Car_28_OFF.png" : democheckbox.checked ? "images/ui/Car_28_ON_Night.png"
                                                                                                         : "images/ui/Car_28_OFF.png"
        fillMode: Image.PreserveAspectFit
    }

    CheckBox {
        id: democheckbox
        x: 0
        y: 0
        width: 171
        height: 60
        opacity: 0
        text: qsTr("Check Box")
        onCheckStateChanged: checked? (seatmode? hvacmain.state = "SeatDemo": hvacmain.state = "ClimateDemo") : (seatmode? hvacmain.state = "Seats": hvacmain.state = "Climate")

    }
    states: [
        State {
            name: "Climate"
            when: !seatmode
        },
        State {
            name: "Seats"
            when: seatmode
            PropertyChanges{
                target: icon
                source: globalDaymode ? democheckbox.checked ? "images/ui/Seatdriverfilled_28_ON_Day.png"
                                                             : "images/ui/Seatdriverfilled_28_OFF.png" : democheckbox.checked? "images/ui/Seatdriverfilled_28_ON_Night.png"
                                                                                                                             : "images/ui/Seatdriverfilled_28_OFF.png"
            }
        }
    ]

}



/*##^##
Designer {
    D{i:0;height:60;width:171}
}
##^##*/
