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

Rectangle {
    id: background
    property string onColor: "#D200A4"
    property string offColor: "#9A989C"
    property bool checked: false

    width: 80
    height: 28
    radius: 16
    border.color: "#9A989C"
    color: "#00000000"

    Rectangle{
        id:checker
        width: 36
        height: 20
        radius: 30
        x:4
        y:4
        color: "#9A989C"
    }

    MouseArea {
        id: mouseArea
        x: 0
        y: 0
        width: 80
        height: 28
        onClicked: checked = !checked
    }
    states: [
        State {
            name: "off"
            when: !checked
        },
        State {
            name: "on"
            when: checked

            PropertyChanges {
                target: checker
                x: 36
                y: 4
                color: "white"
            }

            PropertyChanges {
                target: background
                color: onColor
                border.color: onColor
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: checker
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: checker
                        property: "color"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: checker
                        property: "y"
                        duration: 150
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}


