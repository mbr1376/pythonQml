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
    id: ventControls
    width: 1280
    height: 116
    color: "#00ffffff"

    property real fanspeed: DData.fanSpeed
    property real closetimerMax: 10000

    MouseArea {
        id: mouseArea
        anchors.fill: ventControls
        enabled: true
    }
    Rectangle {
        id: bg
        x: 34
        y: 28
        width: 1206
        height: 60
        opacity: hvacmain.globalDaymode ? 0.5 : 1.0
        color: hvacmain.globalDaymode ? "#c9cae5" : "#0d0f2a"
        radius: 8
    }

    Timer {
        id: closeTimer
        running: ventCheckbox.checked
        interval: closetimerMax
        onTriggered: ventCheckbox.checked = false
    }

    Slider {
        id: ventSlider
        x: 292
        y: 28
        width: 684
        height: 60
        stepSize: 1
        snapMode: RangeSlider.SnapAlways
        to: 5
        from: 0
        value: 2
        background: Rectangle {
            opacity: 0
            color: "black"
        }
        handle: Rectangle {
            x: ventSlider.leftPadding + ventSlider.visualPosition
               * (ventSlider.availableWidth - width)
            y: ventSlider.topPadding + ventSlider.availableHeight / 2 - height / 2
            width: 114
            height: 60
            radius: 4
            color: hvacmain.globalDaymode ? "#989DCE" : "#10136A"
        }
        onMoved: closeTimer.restart()
        onValueChanged: DData.fanSpeed = value
    }

    Row {
        id: row
        x: 292
        y: 21
        width: 684
        height: 76

        Text {
            id: text1
            width: 114
            height: 76
            text: qsTr("0")
            opacity: hvacmain.fanspeed == 0 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Bold
            font.family: "Open Sans"
            color: hvacmain.globalDaymode ? "black" : "white"
        }

        Text {
            id: text2
            width: 114
            height: 76
            text: qsTr("1")
            opacity: hvacmain.fanspeed == 1 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            color: hvacmain.globalDaymode ? "black" : "white"
        }

        Text {
            id: text3
            width: 114
            height: 76
            text: qsTr("2")
            opacity: hvacmain.fanspeed == 2 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            color: hvacmain.globalDaymode ? "black" : "white"
        }

        Text {
            id: text4
            width: 114
            height: 76
            text: qsTr("3")
            opacity: hvacmain.fanspeed == 3 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            color: hvacmain.globalDaymode ? "black" : "white"
        }

        Text {
            id: text5
            width: 114
            height: 76
            text: qsTr("4")
            opacity: hvacmain.fanspeed == 4 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            color: hvacmain.globalDaymode ? "black" : "white"
        }

        Text {
            id: text6
            width: 114
            height: 76
            text: qsTr("5")
            opacity: hvacmain.fanspeed == 5 ? 1 : 0.5
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            color: hvacmain.globalDaymode ? "black" : "white"
        }
    }

    Rectangle {
        id: closeicon
        x: 602
        y: parent.verticalCenter
        width: 64
        height: 64
        color: "#006f37d0"

        Image {
            id: closeD
            x: 0
            y: 0

            source: hvacmain.globalDaymode ? "images/closeD.png" : "images/closeN.png"
            scale: 0.7
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: ventIcon
        x: 600
        y: 32
        width: 64
        height: 60
        color: "#00a04370"
        scale: 0.7

        Image {
            id: ventD2
            x: hvacmain.fanspeed == 0 ? -10 : -0
            y: 0
            source: hvacmain.globalDaymode ? "images/ventD.png" : "images/ventN.png"
            fillMode: Image.PreserveAspectFit
            opacity: hvacmain.fanspeed == 0 ? 0.5 : 1.0
        }
        Image {
            id: ventD
            x: 0
            y: 0
            source: hvacmain.globalDaymode ? "images/ventD.png" : "images/ventN.png"
            fillMode: Image.PreserveAspectFit
            opacity: hvacmain.fanspeed == 0 ? 0.5 : 1.0
            visible: false
        }

        Text {
            id: text7
            x: 60
            y: -8
            width: 91
            height: 76
            anchors.left: ventD.right
            anchors.leftMargin: 15
            color: hvacmain.globalDaymode ? "black" : "white"
            text: hvacmain.fanspeed < 1 ? "0" : hvacmain.fanspeed
            font.pixelSize: 30
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Open Sans"
            font.weight: Font.Bold
            opacity: hvacmain.fanspeed == 0 ? 0.5 : 1.0
        }
    }

    CheckBox {
        id: ventCheckbox
        x: 648
        y: 50
        width: 16
        height: 16
        opacity: 0
        text: qsTr("")
        scale: 8
    }

    states: [
        State {
            name: "open"
            when: ventCheckbox.checked

            PropertyChanges {
                target: ventIcon
                x: 58
                y: 30
            }
            PropertyChanges {
                target: ventControls
                color: hvacmain.globalDaymode ? "#ffffff" : "#000000"
            }

            PropertyChanges {
                target: ventCheckbox
                x: 1182
                y: 56
            }

            PropertyChanges {
                target: closeicon
                x: 1170
                y: 33
            }

            PropertyChanges {
                target: ventD
                rotation: 0
                visible: true
            }
            PropertyChanges {
                target: ventD2
                rotation: 0
                visible: false
            }

            PropertyChanges {
                target: closeD
                x: 16
                y: 13
            }

            PropertyChanges {
                target: text7
                opacity: 0
                font.pixelSize: 45
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        },
        State {
            name: "closed"
            when: !ventCheckbox.checked

            PropertyChanges {
                target: bg
                x: 584
                y: 14
                width: 108
                height: 88
                opacity: 0
            }
            PropertyChanges {
                target: mouseArea
                enabled: false
            }
            PropertyChanges {
                target: ventCheckbox
                x: 646
                y: 56
            }

            PropertyChanges {
                target: closeicon
                opacity: 0
                color: "#6f37d0"
            }

            PropertyChanges {
                target: ventSlider
                opacity: 0
                enabled: false
            }

            PropertyChanges {
                target: row
                opacity: 0
            }

            PropertyChanges {
                target: text7
                x: 71
                y: -8
                width: 85
                height: 76
                font.pixelSize: 45
                verticalAlignment: Text.AlignVCenter
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
                        target: ventIcon
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: ventIcon
                        property: "x"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: ventCheckbox
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: ventCheckbox
                        property: "x"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: ventD
                        property: "rotation"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg
                        property: "width"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg
                        property: "opacity"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg
                        property: "height"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: ventSlider
                        property: "opacity"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: row
                        property: "opacity"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: closeicon
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: closeicon
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: closeicon
                        property: "color"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: closeicon
                        property: "opacity"
                        duration: 150
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}
