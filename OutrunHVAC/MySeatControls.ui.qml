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
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: seatControls
    width: 1280
    height: 116
    color: "#00ffffff"

    property bool driverSeat: false
    property bool drivermenuOpen: tempCheckbox.checked
    property bool passengermenuOpen: false
    property string dayIcon: driverSeat ? "Day/Day_Seatdriver_48.png"
                                        : "Day/Day_Seatpassenger_48.png"
    property string nightIcon: driverSeat ? "Night/Night_Seatdriver_48.png"
                                          : "Night/Night_Seatpassenger_48.png"
    property string heatIconDay: driverSeat ? "Day/Day_Seatwarmerdriver_48.png"
                                            : "Day/Day_Seatwarmerpassenger_48.png"
    property string heatIconNight: driverSeat ? "Night/Night_Seatwarmerdriver_48.png"
                                              : "Night/Night_Seatwarmerpassenger_48.png"
    property real seatOffset: driverSeat ? 470 : 760
    property bool driverheater: driverSeat ? DData.heaterOnDriver
                                           : DData.heaterOnPassenger
    property real closetimer: 0
    property real closetimerMax: 10000
    property real tempvalue: 0
    property bool heaterOnOverride: false

    onHeaterOnOverrideChanged: heaterOnDrivercheckBox.checked = heaterOnOverride

    LocaleData {
        id: localeInfo
    }

    Image {
        id: seatImage
        x: seatOffset
        y: 34
        source: !heaterOnDrivercheckBox.checked ? (hvacmain.globalDaymode ? dayIcon : nightIcon)
                                                : (hvacmain.globalDaymode ? heatIconDay : heatIconNight)
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        id: mouseArea
        x: 0
        y: 0
        width: 1280
        height: 116
    }

    Timer {
        id: closeTimer
        running: tempCheckbox.checked
        interval: closetimerMax
        onTriggered: tempCheckbox.checked = false
    }

    Text {
        id: temptext
        x: driverSeat ? seatOffset - 75 : seatOffset + 45
        width: 53
        height: 27
        text: localeInfo.toCorrectUnit(driverSeat ? hvacmain.tempDriverseat
                                                  : hvacmain.tempPassengerseat) + "°"
        font.pixelSize: 30
        anchors.verticalCenter: seatImage.verticalCenter
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 55
        font.family: "Open Sans"
        font.weight: Font.Bold
        color: hvacmain.globalDaymode ? "#000000" : "#ffffff"
    }

    Text {
        id: tempunit
        anchors.left: temptext.right
        anchors.verticalCenter: temptext.verticalCenter
        text: localeInfo.temperatureUnit
        font.pixelSize: 30
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Open Sans"
        color: hvacmain.globalDaymode ? "#000000" : "#ffffff"
    }

    Rectangle {
        id: bg
        width: 1280
        height: 116
        visible: true
        color: hvacmain.globalDaymode ? "#ffffff" : "#000000"

        Rectangle {
            id: bg2
            x: 37
            y: 28
            width: 1206
            height: 60
            opacity: 1
            color: "#00ffffff"
            radius: 8
            Rectangle {
                id: bg3
                x: 0
                y: 0
                width: 1206
                height: 60
                opacity: hvacmain.globalDaymode ? 0.5 : 1.0
                color: hvacmain.globalDaymode ? "#c9cae5" : "#0d0f2a"
                radius: 8
            }
            Slider {
                id: slider
                width: 800
                height: 60
                opacity: 0
                snapMode: RangeSlider.SnapOnRelease
                stepSize: 1
                from: 15
                to: 30
                value: hvacmain.acSync? DData.tempDriverSide : (driverSeat? DData.tempDriverSide : DData.tempPassengerSide)
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    width: 800
                    height: 60
                    radius: 30
                    opacity: hvacmain.globalDaymode ? 0.1 : 0.4
                    color: hvacmain.globalDaymode ? "#10136A" : "#10136A"
                }
                onValueChanged:{


                    driverSeat ? DData.tempDriverSide = value : DData.tempPassengerSide = value

                    }
                handle: Rectangle {
                    id: sliderHandle
                    x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                    y: slider.topPadding + slider.availableHeight / 2 - height / 2
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 13
                    color: "white"
                    opacity: 0
                    border.color: "#bdbebf"
                }
                onMoved: closeTimer.restart()
            }

            Rectangle {
                id: sliderFill
                anchors.left: slider.left
                z: 0
                width: bg2.x + sliderHandle.x
                height: 60
                radius: 30
                opacity: 1
                color: hvacmain.globalDaymode ? "#989DCE" : "#10136A"
                Rectangle {
                    id: sliderFillRect
                    visible: slider.value < 16
                             || slider.value > 29 ? false : true
                    anchors.left: sliderFill.right
                    anchors.leftMargin: -30
                    width: 30
                    height: 60
                    radius: 0
                    opacity: 1
                    color: hvacmain.globalDaymode ? "#989DCE" : "#10136A"
                }
            }

            MouseArea {
                id: mouseAreaDecrease
                x: 200
                y: 0
                height: 60
                width: 100
                onClicked: {
                    slider.value -= 1
                    closeTimer.restart()
                }
                scale: 1
            }
            MouseArea {
                id: mouseAreaIncrease
                x: 900
                y: 0
                height: 60
                width: 100
                onClicked: {
                    slider.value += 1
                    closeTimer.restart()
                }
                scale: 1
            }

            Rectangle {
                id: decrease
                x: 244
                y: 19
                height: 22
                width: 10
                radius: 0
                z: 3
                opacity: 1
                color: "#00ffffff"

                Image {
                    id: day_arrow1
                    x: 0
                    y: 0
                    source: hvacmain.globalDaymode ? "Day/Day_arrow.png" : "Night/Night_arrow.png"
                    fillMode: Image.PreserveAspectFit
                    rotation: 180
                }
            }

            Rectangle {
                id: increase
                x: 949
                y: 19
                height: 22
                width: 10
                radius: 0
                z: 3
                opacity: 1
                color: "#00ffffff"

                Image {
                    id: day_arrow
                    x: 0
                    y: 0
                    source: hvacmain.globalDaymode ? "Day/Day_arrow.png" : "Night/Night_arrow.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Rectangle {
                id: seatOnOffcontrolArea
                x: 36
                width: 136
                height: 60

                color: "#00ffffff"
                Rectangle {
                    anchors.fill: parent
                    radius: 8
                    color: hvacmain.globalDaymode ? "#989DCE" : "#10136A"
                    visible: driverSeat ? hvacmain.heaterOnDriver : hvacmain.heaterOnPassenger
                }

                Image {
                    id: day_Seatwarmerdriver_48
                    opacity: driverSeat ? (hvacmain.heaterOnDriver ? 1.0 : 0.6)
                                        : (hvacmain.heaterOnPassenger ? 1.0 : 0.6)
                    source: hvacmain.globalDaymode ? heatIconDay : heatIconNight
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: offText
                    visible: driverSeat ? !hvacmain.heaterOnDriver : !hvacmain.heaterOnPassenger
                    anchors.left: day_Seatwarmerdriver_48.right
                    anchors.leftMargin: -10
                    width: 64
                    height: 60
                    opacity: driverSeat ? (hvacmain.heaterOnDriver ? 1.0 : 0.6)
                                        : (hvacmain.heaterOnPassenger ? 1.0 : 0.6)
                    text: "OFF"
                    color: hvacmain.globalDaymode ? "#000000" : "#ffffff"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.family: "Open Sans"
                }
            }
            Image {
                id: closeD
                x: 1155
                y: 18
                source: hvacmain.globalDaymode ? "images/closeD.png" : "images/closeN.png"
                fillMode: Image.PreserveAspectFit
                scale: 0.7
            }

            Text {
                id: tempText
                x: 571
                y: 0
                width: 64
                height: 60
                text: localeInfo.toCorrectUnit(driverSeat ? hvacmain.tempDriverseat
                                  : hvacmain.tempPassengerseat) + "°"
                color: hvacmain.globalDaymode ? "#000000" : "#ffffff"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Bold
                font.family: "Open Sans"
            }

            Text {
                id: tempUnit
                anchors.left: tempText.right
                anchors.verticalCenter: tempText.verticalCenter
                text: localeInfo.temperatureUnit
                font.pixelSize: 30
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.family: "Open Sans"
                color: hvacmain.globalDaymode ? "#000000" : "#ffffff"
            }
        }
    }

    CheckBox {
        id: heaterOnDrivercheckBox
        x: 73
        y: 28
        width: 136
        height: 60
        opacity: 0
        enabled: false
        indicator: Rectangle {
            anchors.fill: parent
        }
        onClicked: closeTimer.restart()
        onCheckedChanged: driverSeat ? (DData.heaterOnDriver = heaterOnDrivercheckBox.checked ? 1 : 0)
                                     : (DData.heaterOnPassenger = heaterOnDrivercheckBox.checked ? 1 : 0)
    }

    CheckBox {
        id: tempCheckbox
        x: driverSeat ? 470 : 760
        y: 56
        opacity: 0
        text: qsTr("")
        scale: 8
    }

    states: [
        State {
            name: "closed"
            when: !tempCheckbox.checked

            PropertyChanges {
                target: bg2
                x: -8
                y: 34
                width: 92
                height: 60
            }

            PropertyChanges {
                target: bg
                x: 588
                y: 0
                width: 144
                height: 116
                opacity: 0
            }

            PropertyChanges {
                target: slider
                y: 0
                width: 44
                height: 60
            }

            PropertyChanges {
                target: closeD
                opacity: 0
            }

            PropertyChanges {
                target: mouseArea
                width: 0
                height: 0
            }

            PropertyChanges {
                target: tempText
                opacity: 0
            }
        },
        State {
            name: "open"
            when: tempCheckbox.checked

            PropertyChanges {
                target: tempCheckbox
                x: 1202
                y: 56
                width: 14
                height: 16
            }

            PropertyChanges {
                target: slider
                opacity: 1
            }

            PropertyChanges {
                target: day_Seatwarmerdriver_48
                x: 41
                y: 6
            }

            PropertyChanges {
                target: bg
                z: 10
            }

            PropertyChanges {
                target: seatControls
                z: 10
            }

            PropertyChanges {
                target: heaterOnDrivercheckBox
                visible: true
                enabled: true
                z: 10
            }

            PropertyChanges {
                target: rectangle
                color: "#009a9368"
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
                        target: seatControls
                        property: "z"
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
                        target: tempText
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
                        target: day_Seatwarmerdriver_48
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: day_Seatwarmerdriver_48
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
                        target: mouseArea
                        property: "height"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: mouseArea
                        property: "width"
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
                        target: tempCheckbox
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: tempCheckbox
                        property: "height"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: tempCheckbox
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: tempCheckbox
                        property: "width"
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
                        target: heaterOnDrivercheckBox
                        property: "z"
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
                        target: slider
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: slider
                        property: "height"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: slider
                        property: "width"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: slider
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
                        property: "height"
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
                        property: "z"
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
                        target: bg2
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg2
                        property: "height"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg2
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: bg2
                        property: "width"
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
                        target: closeD
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
