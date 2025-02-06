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
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: root
    
    width: 527
    height: 60
    radius: 30
    state: "Climate"
    color: isDay ? "#b2ffffff" : "#b2000000"

    property bool isDay: true

    FontLoader {
        source: Qt.resolvedUrl("fonts/weather.ttf")
    }

    Rectangle {
        id: knob
        x: 0
        width: 188
        height: 60
        radius: 30
        color: isDay ? "#989dce" : "#10136a"
    }
    Text {
        id: iconAudio
        x: 390
        text: "\ue802"
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 18
        font.family: "weather"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    Text {
        id: iconSeat
        x: 226
        text: "\ue803"
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 16
        font.family: "weather"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    Text {
        id: iconClimate
        x: 31
        text: "\ue804"
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 18
        font.family: "weather"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    Text {
        id: climate
        x: 79
        text: qsTr("Climate")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 20
        font.family: "Open Sans"
        font.styleName: "Bold"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    Text {
        id: seats
        x: 274
        text: qsTr("Seats")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 20
        font.family: "Open Sans"
        font.styleName: "Bold"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    Text {
        id: audio
        x: 440
        text: qsTr("Audio")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 20
        font.family: "Open Sans"
        font.styleName: "Bold"
        color: globalDaymode? "#5D5C60" : "#9A989C"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            root.state = mouseX < 188 ? "Climate" : mouseX < 339 ? "Seats" : "Audio"
        }
    }
    states: [
        State {
            name: "Climate"

            PropertyChanges {
                target: iconClimate
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }

            PropertyChanges {
                target: climate
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }
        },
        State {
            name: "Seats"

            PropertyChanges {
                target: knob
                x: 195
                y: 0
                width: 159
                height: 60
            }

            PropertyChanges {
                target: iconSeat
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }

            PropertyChanges {
                target: seats
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }
        },
        State {
            name: "Audio"

            PropertyChanges {
                target: knob
                x: 364
                y: 0
                width: 163
                height: 60
            }

            PropertyChanges {
                target: iconAudio
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }

            PropertyChanges {
                target: audio
                color: root.isDay ? "#1E1D20" : "#FFFFFF"
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "x,width"; duration: 500; easing.type: Easing.OutCubic}
        ColorAnimation { duration: 500 }
    }
}


