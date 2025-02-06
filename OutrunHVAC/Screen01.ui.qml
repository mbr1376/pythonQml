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
import QtQuick.Controls 6.8
import QtQuick3D
import QtQuick3D.Effects
import QtQuick3D.Particles3D
import QtQuick3D.Helpers
import OutrunHVAC 1.0
import Quick3DAssets.Seat_HVAC 1.0
import QtQuick.Timeline
import Quick3DAssets.SUV_Outrun_CutRoof1 1.0
import Quick3DAssets.SUV_Knobs 1.0

Rectangle {
    id: hvacmain

    property bool androidMode: false

    property bool debugViewEnabled: false

    property bool globalClimatemode: false
    property bool globalSeatsmode: false
    property bool globalAudiomode: false
    property bool globalDaymode: true

    // control bar properties
    property bool acOn: controlBar.acOn
    property bool acAuto: controlBar.acAuto
    property bool acSync: controlBar.acSync

    property real tempDriverseat: DData.tempDriverSide
    property bool heaterOnDriver: controlBar.heaterOnDriver
    property bool heaterOnPassenger: controlBar.heaterOnPassenger
    property real fanspeed: controlBar.fanspeed
    property real tempPassengerseat: DData.tempPassengerSide

    property int fanDirectionDriver: DData.fanDirectionDriver
    property int fanDirectionPassenger: DData.fanDirectionPassenger

    property real reclineDriverval: 7 + reclineSliderDriver.value
    property real reclinePassengerval: reclineSliderPassenger.value

    property bool rearwindowDefrost: controlBar.rearwindowDefrost
    property bool windscreeDefrost: controlBar.windscreeDefrost
    property bool recirculation: controlBar.recirculation

    property var effectList: [] // androidMode ? [] : [blur]

    width: Constants.width
    height: Constants.height
    opacity: 1
    color: "#ffffff"
    border.color: "#ffffff"


    View3D {
        id: view3D
        visible: true
        anchors.fill: parent
        SceneEnvironment {
            id: sceneEnvironment
            effects: effectList
            probeExposure: globalDaymode ? "2" : "1"
            probeHorizon: 0
            probeOrientation.z: 3
            probeOrientation.y: 0
            lightProbe: outrun_hdri_sandi006
            depthTestEnabled: true
            aoSampleRate: 4
            aoSoftness: 17
            aoDistance: 2
            aoStrength: 0
            temporalAAEnabled: true

            probeOrientation.x: 0
            clearColor: "#4a4793"
            backgroundMode: SceneEnvironment.SkyBox
            tonemapMode: SceneEnvironment.TonemapModeHejlDawson
            antialiasingQuality: SceneEnvironment.VeryHigh
            antialiasingMode: SceneEnvironment.SSAA

            Texture {
                id: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
                rotationUV: 0
                mappingMode: Texture.Environment
            }
        }

        Node {
            id: scene

            SpotLight {
                id: lightSpot
                x: -0.627
                y: 116.55
                visible: true
                color: "#c6baff"
                constantFade: 1.5
                linearFade: 4.2
                shadowMapFar: 100
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                shadowFilter: 100
                shadowBias: 0
                shadowFactor: 100
                castsShadow: true
                coneAngle: 180
                innerConeAngle: 155
                quadraticFade: 4.2
                z: 62.23131
                brightness: 10
                eulerRotation.z: 0.00002
                eulerRotation.y: 7
                eulerRotation.x: -41
            }

            PointLight {
                id: lightPoint
                x: 0
                y: 105.57
                visible: true
                color: "#fff2fb"
                linearFade: 3.8
                constantFade: 3.5
                brightness: 30
                shadowMapFar: 500
                shadowFactor: 56
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                castsShadow: false
                z: -63.8
            }

            Seat_HVAC {
                id: seat_HVAC
                x: -45.375
                y: 49.219
                visible: true
                z: -28.2304
                recline: 2

                Model {
                    id: plane2
                    x: 0.05
                    y: -0.18
                    opacity: 0
                    source: "#Rectangle"
                    receivesShadows: true
                    eulerRotation.x: -90
                    materials: principledMaterial2
                    castsShadows: false
                    scale.y: 0.01
                    scale.x: 0.01
                    scale.z: 0.01
                    z: 0.38
                }
            }

            Seat_HVAC {
                id: seat_HVAC1
                x: 44.489
                y: 49.219
                z: -28.23
                recline: 2

                Model {
                    id: plane1
                    x: 0.045
                    y: -0.177
                    opacity: 0
                    source: "#Rectangle"
                    eulerRotation.x: -90
                    receivesShadows: true
                    materials: principledMaterial1
                    castsShadows: false
                    scale.y: 0.01
                    scale.x: 0.01
                    scale.z: 0.01
                    z: 0.38
                }
            }

            Seat_HVAC {
                id: seat_HVAC2
                x: 40.681
                y: 49.219
                z: -112.48323
            }

            Seat_HVAC {
                id: seat_HVAC3
                x: -40.225
                y: 49.219
                z: -112.48323
            }

            PerspectiveCamera {
                id: cameraPerspective
                x: 0
                y: 116.288
                eulerRotation.z: -0
                eulerRotation.x: -22.97283
                fieldOfView: 49
                eulerRotation.y: -180
                z: -68.49133
            }

            SUV_Outrun_CutRoof1 {
                id: sUV_Outrun_CutRoof1
                x: 0
                y: -30.19
                visible: true
                z: -10.14

                SUV_Knobs {
                    id: sUV_Knobs
                    x: 0
                    y: 0
                    scale.z: 1
                    scale.y: 1
                    scale.x: 1
                    z: 0
                }
            }
        }

        environment: sceneEnvironment
    }

    Slider {
        id: slider_particle_intencity
        x: 181
        y: 310
        width: 99
        height: 29
        opacity: 0
        visible: !particle_check_control.checkBoxChecked
        value: fanspeed
        enabled: true
        to: 200
        from: 0
    }

    View3D {
        id: view3D1
        x: 0
        y: 0
        width: 1280
        height: 598
        visible: true
        environment: sceneEnvironment1
        SceneEnvironment {
            id: sceneEnvironment1
            tonemapMode: SceneEnvironment.TonemapModeFilmic
            depthTestEnabled: true
            effects: [hDRBloomTonemap]
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA

            HDRBloomTonemap {
                id: hDRBloomTonemap
                tonemappingLerp: 0
                channelThreshold: 1
                bloomThreshold: 0.9
                exposure: 1
                gamma: 1
            }
        }

        Node {
            id: scene1

            PerspectiveCamera {
                id: camera1
                z: 350
            }

            MyDigiWave {
                id: myDigiWave
                x: -158
                y: 31
                visible: !particle_check_control.checkBoxChecked
                pvolume: 99
                grav: -8
                airside: tempDriverseat

                eulerRotation.z: particlesUpdown.value
                emitrate: fanspeed * 5
                eulerRotation.y: 0
                eulerRotation.x: 0
            }

            MyDigiWave {
                id: myDigiWave4
                x: -223.714
                y: -89.133
                visible: !particle_check_control1.checkBoxChecked
                grav: -15
                z: 128.72653
                eulerRotation.y: 0
                eulerRotation.z: particlesUpdown1.value
                emitrate: fanspeed * 5
                eulerRotation.x: 0
                airside: tempDriverseat
            }

            MyDigiWave {
                id: myDigiWave2
                x: -12.91
                y: 12.96
                visible: particle_center_control1.checkBoxChecked
                eulerRotation.z: particlesUpdown2.value
                grav: 12
                airside: tempDriverseat
                emitrate: fanspeed * 5
                z: 128.72653
                eulerRotation.y: 0
                eulerRotation.x: 0
            }

            MyDigiWave {
                id: myDigiWave3
                x: 19.878
                y: 12.96
                visible: particle_center_control.checkBoxChecked
                eulerRotation.z: particlesUpdown3.value
                grav: -12
                airside: tempPassengerseat
                emitrate: fanspeed * 5
                z: 128.72655
                eulerRotation.y: 0
                eulerRotation.x: 0
            }

            MyDigiWave {
                id: myDigiWave1
                x: 177
                y: 27
                visible: !particle_check_control2.checkBoxChecked
                eulerRotation.z: particlesUpdown4.value
                grav: -20
                airside: tempPassengerseat
                emitrate: fanspeed * 5
                eulerRotation.y: 0
                eulerRotation.x: 0
            }

            MyDigiWave {
                id: myDigiWave5
                x: 226.429
                y: -97.667
                visible: !particle_check_control3.checkBoxChecked
                eulerRotation.z: particlesUpdown5.value
                grav: 5
                z: 128.72653
                eulerRotation.y: 0
                emitrate: fanspeed * 5
                eulerRotation.x: 0
                airside: tempPassengerseat
            }
        }
    }

    TopButtonBar {
        id: buttonBar
        x: 29
        y: 28
        isDay: hvacmain.globalDaymode

        onStateChanged: hvacmain.state = buttonBar.state
    }

    Slider {
        id: slider_particle_intencity1
        x: 134
        y: 179
        width: 37
        height: 68
        opacity: 0
        visible: !particle_check_control.checkBoxChecked
        value: fanspeed
        orientation: Qt.Vertical
        to: 100
        from: 0
    }

    Slider {
        id: particlesUpdown
        x: 227
        y: 119
        width: 313
        height: 175
        opacity: 0
        orientation: Qt.Vertical
        topPadding: 6
        to: -140
        from: -90
        rotation: -180
        value: -55
    }

    Slider {
        id: demoSeat
        x: 392
        y: 144
        width: 496
        height: 393
        opacity: 0
        visible: false
        to: -240
        from: -70
        value: -130
    }

    Slider {
        id: demoClimate
        opacity: 0
        visible: false
        value: 0.5
    }

    MyParticle_check_control {
        id: particle_check_control
        x: 45
        y: 203
        checkBoxChecked: (hvacmain.fanDirectionDriver & DData.FanDirection.FACE_DIRECTION) === 0
        onCheckBoxCheckedChanged: !checkBoxChecked ?
                                      DData.fanDirectionDriver |= DData.FanDirection.FACE_DIRECTION :
                                      DData.fanDirectionDriver &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.FACE_DIRECTION)
    }

    Dial {
        id: dial
        x: 123
        y: 119
        width: 157
        height: 157
        opacity: 0
        visible: false
        inputMode: Dial.Vertical
        hoverEnabled: false
        focusPolicy: Qt.NoFocus
        stepSize: 360
        wrap: true
        value: -55
        to: -120
        from: -55
    }

    MyParticle_check_control {
        id: particle_check_control1
        x: 45
        y: 474
        rotation: 180
        checkBoxChecked: (hvacmain.fanDirectionDriver & DData.FanDirection.FLOOR_DIRECTION) === 0
        onCheckBoxCheckedChanged: !checkBoxChecked ?
                                      DData.fanDirectionDriver |= DData.FanDirection.FLOOR_DIRECTION :
                                      DData.fanDirectionDriver &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.FLOOR_DIRECTION)
    }

    MyAudioPointsControl {
        id: myAudioPointsControl
        visible: false
        opacity: 0
    }

    MyParticle_check_control {
        id: particle_check_control2
        x: 1174
        y: 203
        checkBoxChecked: (hvacmain.fanDirectionPassenger & DData.FanDirection.FACE_DIRECTION) === 0
        onCheckBoxCheckedChanged: !checkBoxChecked ?
                                      DData.fanDirectionPassenger |= DData.FanDirection.FACE_DIRECTION :
                                      DData.fanDirectionPassenger &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.FACE_DIRECTION)
    }

    DebugView {
        source: view3D
        visible: debugViewEnabled
    }

    MyParticle_check_control {
        id: particle_check_control3
        x: 1174
        y: 474
        rotation: 180
        checkBoxChecked: (hvacmain.fanDirectionPassenger & DData.FanDirection.FLOOR_DIRECTION) === 0
        onCheckBoxCheckedChanged: !checkBoxChecked ?
                                      DData.fanDirectionPassenger |= DData.FanDirection.FLOOR_DIRECTION :
                                      DData.fanDirectionPassenger &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.FLOOR_DIRECTION)
    }

    MyParticle_center_control {
        id: particle_center_control
        x: 742
        y: 338
        checkBoxChecked: (hvacmain.fanDirectionPassenger & DData.FanDirection.DEFROST_DIRECTION) !== 0
        onCheckBoxCheckedChanged: checkBoxChecked ?
                                      DData.fanDirectionPassenger |= DData.FanDirection.DEFROST_DIRECTION :
                                      DData.fanDirectionPassenger &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.DEFROST_DIRECTION)
    }

    Timeline {
        id: timeline1
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                duration: 2000
                running: false
                to: 2000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 2000
    }

    MyParticle_center_control {
        id: particle_center_control1
        x: 471
        y: 338
        rotation: 180
        checkBoxChecked: (hvacmain.fanDirectionDriver & DData.FanDirection.DEFROST_DIRECTION) !== 0
        onCheckBoxCheckedChanged: checkBoxChecked ?
                                      DData.fanDirectionDriver |= DData.FanDirection.DEFROST_DIRECTION :
                                      DData.fanDirectionDriver &= (DData.FanDirection.FAN_DIRECTION_MASK ^ DData.FanDirection.DEFROST_DIRECTION)
    }

    Timeline {
        id: timeline2
        animations: [
            TimelineAnimation {
                id: airinout
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: false
        startFrame: 0
    }

    MyArcTickmarks {
        id: arcTickmarksPassenger
        x: 426
        y: 86
        opacity: 0
        visible: false
        rotation: 90
    }

    MyArcTickmarks {
        id: arcTickmarksDriver
        x: 335
        y: 84
        opacity: 0
        visible: false
    }

    MySeatReclineArc {
        id: reclineSliderDriver
        x: 335
        y: 84
        opacity: 0
        visible: false
        trackColor: globalDaymode ? "#000000" : "#FFFFFF"
        minValue: -1
        handleHeight: 15
        handleWidth: 15
        handleRadius: 11
        handleColor: "#d200a4"
        value: -4
        maxValue: -6
        rotation: -90
        startAngle: 0
        trackWidth: 1
        progressWidth: 10
        hideProgress: true
        hideTrack: false
        endAngle: 90
    }

    MySeatReclineArc {
        id: reclineSliderPassenger
        x: 426
        y: 86
        opacity: 0
        visible: false
        trackColor: globalDaymode ? "#000000" : "#FFFFFF"
        minValue: 1
        handleHeight: 15
        handleWidth: 15
        handleColor: "#d200a4"
        value: 2
        maxValue: 6
        trackWidth: 1
        progressWidth: 10
        hideProgress: true
        hideTrack: false
        endAngle: 90
    }

    Rectangle {
        id: seatControlGroup
        opacity: 0
        visible: false
        anchors.fill: parent
        color: "#00ffffff"

        Rectangle {
            id: reclideDriver
            x: 48
            y: 186
            width: 60
            height: 44
            color: "#d200a4"
            radius: 22

            Text {
                id: driverHeatNumber
                x: 25
                y: 8
                color: "#ffffff"
                text: reclineDriverval.toFixed().toString()
                font.pixelSize: 20
                font.weight: Font.Bold
                font.family: "Open Sans"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: false
                onClicked: hvacmain.state = "reclineDriver"
            }
        }

        Rectangle {
            id: reclidePassenger
            x: 1172
            y: 186
            width: 60
            height: 44
            color: "#d200a4"
            radius: 22
            MouseArea {
                id: mouseArea2
                anchors.fill: parent
                enabled: false
                onClicked: hvacmain.state = "reclinePassenger"
            }

            Text {
                id: driverHeatNumber1
                x: 25
                y: 8
                color: "#ffffff"
                text: reclinePassengerval.toFixed().toString()
                font.pixelSize: 20
                font.family: "Open Sans"
                font.weight: Font.Bold
            }
        }

        Rectangle {
            id: heaterDriver
            x: 48
            y: 510
            width: 60
            height: 44
            color: heaterOnDriver ? "#D200A4" : "#1e1d20"
            radius: 22
            MouseArea {
                id: mouseArea3
                anchors.fill: parent
            }

            Text {
                id: tempButtoninfo
                x: 11
                y: 8
                width: 39
                height: 28
                color: heaterOnDriver ? "#ffffff" : "#9A989C"
                text: heaterOnDriver ? "On" : "Off"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.Bold
                font.family: "Open Sans"
            }

            CheckBox {
                id: checkBox
                width: 60
                opacity: 0
                text: qsTr("Check Box")
                checked: heaterOnDriver
                onCheckStateChanged: checked ? controlBar.heateroverridedriver
                                               = true : controlBar.heateroverridedriver = false
            }
        }

        Rectangle {
            id: heaterPassenger
            x: 1172
            y: 510
            width: 60
            height: 44
            color: heaterOnPassenger ? "#D200A4" : "#1e1d20"
            radius: 22
            MouseArea {
                id: mouseArea4
                anchors.fill: parent
            }

            Text {
                id: tempButtoninfo1
                x: 11
                y: 8
                width: 39
                height: 28
                color: heaterOnPassenger ? "#ffffff" : "#9A989C"
                text: heaterOnPassenger ? "On" : "Off"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "Open Sans"
                font.weight: Font.Bold
            }

            CheckBox {
                id: checkBox1
                x: 0
                y: 0
                width: 60
                opacity: 0
                text: qsTr("Check Box")
                checked: heaterOnPassenger
                onCheckStateChanged: checked ? controlBar.heateroverridepassenger
                                               = true : controlBar.heateroverridepassenger = false
            }
        }

        Text {
            id: reclineText
            x: 48
            y: 158
            color: globalDaymode ? "black" : "white"
            text: qsTr("Seat recline")
            font.pixelSize: 16
            font.family: "Open Sans"
        }

        Text {
            id: reclineText1
            x: 1144
            y: 158
            color: globalDaymode ? "black" : "white"
            text: qsTr("Seat recline")
            font.pixelSize: 16
            font.family: "Open Sans"
        }

        Text {
            id: warmerText
            x: 48
            y: 482
            color: globalDaymode ? "black" : "white"
            text: qsTr("Warmer")
            font.pixelSize: 16
            font.family: "Open Sans"
        }

        Text {
            id: warmerText1
            x: 1172
            y: 482
            color: globalDaymode ? "black" : "white"
            text: qsTr("Warmer")
            font.pixelSize: 16
            font.family: "Open Sans"
        }

        Button {
            id: backbutton
            x: 28
            y: 316
            width: 161
            height: 60
            onPressed: hvacmain.state = "Seats"
            visible: false
            opacity: 0
            background: Rectangle {
                color: "#00ffffff"
                radius: 5
                border.color:globalDaymode ? "#000000" : "#FFFFFF"
                border.width: 3
                anchors.fill: parent
            }
            Text {
                x: 78
                y: 12
                color: globalDaymode ? "#000000" : "#FFFFFF"
                text: qsTr("Back")
                font.pointSize: 17
                font.capitalization: Font.Capitalize
                font.weight: Font.Bold
                font.bold: true
                font.family: "Open Sans"
            }
            SequentialAnimation {
                id: backbuttonopacityOn
                running: backbutton.visible

                PauseAnimation {
                    duration: 1500
                }
                NumberAnimation {
                    target: backbutton
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                }
            }

            Image {
                id: arrow_left
                x: 25
                y: 19
                width: 23
                height: 22
                source: globalDaymode ? "images/arrow_left_night.png" : "images/arrow_left.png"
                fillMode: Image.PreserveAspectFit
            }

            Rectangle {
                id: rectangle
                x: 34
                y: 29
                width: 17
                height: 2
                color: globalDaymode ? "#000000" : "#FFFFFF"
            }
        }
    }

    MyControlBar {
        id: controlBar
        x: 0
        y: 604
        visible: true
        acOn: DData.acOn


    }

    Slider {
        id: particlesUpdown1
        x: 131
        y: 408
        width: 239
        height: 175
        opacity: 0
        topPadding: 6
        orientation: Qt.Vertical
        value: -100
        rotation: -180
        to: -130
        from: -100
    }

    Slider {
        id: particlesUpdown2
        x: 411
        y: 211
        width: 230
        height: 110
        opacity: 0
        topPadding: 6
        orientation: Qt.Vertical
        value: 120
        rotation: -180
        to: 140
        from: 90
    }

    Slider {
        id: particlesUpdown3
        x: 638
        y: 215
        width: 234
        height: 110
        opacity: 0
        topPadding: 6
        orientation: Qt.Vertical
        value: -120
        rotation: -180
        to: -140
        from: -90
    }

    Slider {
        id: particlesUpdown4
        x: 743
        y: 115
        width: 362
        height: 157
        opacity: 0
        topPadding: 6
        orientation: Qt.Vertical
        value: 30
        rotation: -180
        to: 60
        from: 20
    }

    Slider {
        id: particlesUpdown5
        x: 868
        y: 402
        width: 317
        height: 143
        opacity: 0
        topPadding: 6
        orientation: Qt.Vertical
        value: 65
        rotation: -180
        to: 95
        from: 65
    }

    Rectangle {
        id: nightModeButton
        x: 1168
        y: 28
        width: 84
        height: 60
        color: globalDaymode ? "#989DCE" : "#10136A"
        radius: 30

        Image {
            id: brightness_28
            x: 28
            y: 16
            source: globalDaymode ? "images/ui/Brightness_28.png" : "images/ui/Darkmode_28.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    CheckBox {
        id: nightAndDayCheckBox
        x: 1168
        y: 28
        width: 84
        height: 60
        opacity: 0
        text: qsTr(" ")
        checked: true
        onCheckedChanged: globalDaymode = checked
    }

    MyDemoModeButton {
        id: demoModeButton
        x: 969
        y: 28
        onStateChanged: hvacmain.state = buttonBar.state
    }

    Item {
        id: __materialLibrary__

        DefaultMaterial {
            id: rectMaterial2
            objectName: "rectMaterial2"
            depthDrawMode: Material.AlwaysDepthDraw
            opacityMap: seatShadow2
            diffuseColor: "#000000"
        }

        PrincipledMaterial {
            id: principledMaterial2
            objectName: "principledMaterial2"
            depthDrawMode: Material.AlwaysDepthDraw
            opacityMap: seatShadow2
            lighting: PrincipledMaterial.NoLighting
            baseColor: "#000000"
            cullMode: Material.NoCulling
            specularAmount: 0
            Texture {
                id: seatShadow2
                source: "images/seatShadow.png"
            }
        }

        DefaultMaterial {
            id: rectMaterial1
            objectName: "rectMaterial1"
            depthDrawMode: Material.AlwaysDepthDraw
            opacityMap: seatShadow1
            diffuseColor: "#000000"
        }

        PrincipledMaterial {
            id: principledMaterial1
            objectName: "principledMaterial1"
            depthDrawMode: Material.AlwaysDepthDraw
            opacityMap: seatShadow1
            lighting: PrincipledMaterial.NoLighting
            baseColor: "#000000"
            specularAmount: 0
            cullMode: Material.NoCulling
            Texture {
                id: seatShadow1
                source: "images/seatShadow.png"
            }
        }
    }

    states: [
        State {
            name: "Climate"

            PropertyChanges {
                target: sceneEnvironment
                probeExposure: globalDaymode ? "2" : "1"
                probeHorizon: 0
                probeOrientation.z: 3
                probeOrientation.y: 0
                probeOrientation.x: 0
            }

            PropertyChanges {
                target: slider_particle_intencity
                value: hvacmain.fanspeed * 5
                from: 20
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: false
            }

            PropertyChanges {
                target: lightPoint
                x: 0
            }

            PropertyChanges {
                target: myDigiWave
                emitrate: fanspeed * 5
                pvolume: 99
            }

            PropertyChanges {
                target: timeline2
            }

            PropertyChanges {
                target: airinout
                running: true
            }

            PropertyChanges {
                target: mouseArea
                visible: false
                enabled: false
            }

            PropertyChanges {
                target: sceneEnvironment1
                tonemapMode: SceneEnvironment.TonemapModeFilmic
            }

            PropertyChanges {
                target: hDRBloomTonemap
                tonemappingLerp: 0
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 1
            }

            PropertyChanges {
                target: myAudioPointsControl
                soundpoint1Checked: false
                soundpoint2Checked: false
                soundpoint3Checked: false
            }

            PropertyChanges {
                target: controlBar
                x: 0
                y: 607
                height: 114
            }
        },
        State {
            name: "Seats"

            PropertyChanges {
                target: seat_HVAC
                x: -65
                y: 49.219
                heaterOn: heaterOnPassenger
                eulerRotation.z: -0.00001
                eulerRotation.x: 0
                scale.z: 75
                scale.y: 75
                scale.x: 75
                z: -51
                eulerRotation.y: 130
            }

            PropertyChanges {
                target: seat_HVAC1
                x: 65
                y: 49.219
                visible: true
                heaterOn: heaterOnDriver
                eulerRotation.z: 0.00001
                eulerRotation.x: -0
                scale.z: 75
                scale.y: 75
                scale.x: 75
                z: -51
                eulerRotation.y: -130
            }

            PropertyChanges {
                target: seat_HVAC2
                opacity: 0
            }

            PropertyChanges {
                target: seat_HVAC3
                opacity: 0
            }

            PropertyChanges {
                target: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
            }

            PropertyChanges {
                target: particle_check_control
                x: -91
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control1
                x: -91
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control2
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control3
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
            }

            PropertyChanges {
                target: slider_particle_intencity1
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity
                visible: false
            }

            PropertyChanges {
                target: cameraPerspective
                x: -0
                y: 75.788
                clipNear: 90
                eulerRotation.y: -180
                eulerRotation.z: -0
                eulerRotation.x: -3.38693
                z: -202.60466
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: sceneEnvironment
                probeOrientation.z: 3
            }

            PropertyChanges {
                target: lightPoint
                x: 0
                y: 111.226
                color: "#ffffff"
                brightness: 10.71
                z: -118.68448
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                visible: false
                running: true
                pvolume: 99
                endScale: 5
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                pvolume: 0
                visible: false
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: timeline2
                enabled: false
            }

            PropertyChanges {
                target: airinout
                running: false
            }

            PropertyChanges {
                target: myDigiWave4
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave5
                visible: !particle_check_control3.checkBoxChecked
                pvolume: 0
            }

            PropertyChanges {
                target: seatControlGroup
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: mouseArea
                visible: true
                enabled: true
            }

            PropertyChanges {
                target: mouseArea2
                enabled: true
            }

            PropertyChanges {
                target: backbutton
                opacity: 0
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 1
                seatmode: true
            }

            PropertyChanges {
                target: sUV_Outrun_CutRoof1
                opacity: 0
                visible: true
                roofRootVisible: true
            }

            PropertyChanges {
                target: lightSpot
                castsShadow: false
            }

            PropertyChanges {
                target: reclineText1
                font.bold: false
            }

            PropertyChanges {
                target: myAudioPointsControl
                opacity: 0
                visible: false
                soundpoint1Checked: false
                soundpoint2Checked: false
                soundpoint3Checked: false
            }

            PropertyChanges {
                target: plane1
                x: 0.045
                y: -0.177
                opacity: 1
                z: 0.22577
            }

            PropertyChanges {
                target: plane2
                x: -0.028
                y: -0.18
                opacity: 1
                z: 0.21509
            }
        },
        State {
            name: "Audio"

            PropertyChanges {
                target: seat_HVAC2
                opacity: 1
            }

            PropertyChanges {
                target: seat_HVAC3
                opacity: 1
            }

            PropertyChanges {
                target: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
                autoOrientation: false
                mappingMode: Texture.Environment
            }

            PropertyChanges {
                target: view3D
                scale: 1
                rotation: 0
            }

            PropertyChanges {
                target: particle_check_control
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: particle_check_control1
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: particle_check_control2
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: particle_check_control3
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity1
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity
                visible: false
            }

            PropertyChanges {
                target: myAudioPointsControl
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: cameraPerspective
                x: 98.486
                y: 580.507
                fieldOfView: 30
                eulerRotation.y: -179.99927
                eulerRotation.z: -0.00077
                eulerRotation.x: -88.89642
                z: -76.85827
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                visible: false
                pvolume: 0
                endScale: 5
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: timeline2
                enabled: false
            }

            PropertyChanges {
                target: airinout
                running: false
            }

            PropertyChanges {
                target: myDigiWave4
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave5
                visible: !particle_check_control3.checkBoxChecked
                pvolume: 0
            }

            PropertyChanges {
                target: mouseArea
                enabled: true
            }

            PropertyChanges {
                target: mouseArea2
                enabled: true
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 0
            }

            PropertyChanges {
                target: lightSpot
                castsShadow: false
                shadowMapFar: 0
                shadowFilter: 1
                shadowFactor: 0
                eulerRotation.x: -60
                z: 39.97
            }

            PropertyChanges {
                target: sUV_Outrun_CutRoof1
                opacity: 1
                roofRootVisible: false
            }

            PropertyChanges {
                target: seat_HVAC
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: controlBar
                visible: true
            }
        },
        State {
            name: "reclineDriver"

            PropertyChanges {
                target: seat_HVAC
                x: -60
                y: 49.219
                opacity: 0
                heaterOn: heaterOnPassenger
                eulerRotation.z: -0.00001
                eulerRotation.x: 0
                scale.z: 80
                scale.y: 80
                scale.x: 80
                z: -51
                eulerRotation.y: 130
            }

            PropertyChanges {
                target: seat_HVAC1
                x: -17.804
                y: 49.219
                recline: reclineDriverval
                heaterOn: heaterOnDriver
                eulerRotation.z: 0.00001
                eulerRotation.x: -0.00001
                scale.z: 80
                scale.y: 80
                scale.x: 80
                z: -54.55663
                eulerRotation.y: -92.40988
            }

            PropertyChanges {
                target: seat_HVAC2
                opacity: 0
            }

            PropertyChanges {
                target: seat_HVAC3
                opacity: 0
            }

            PropertyChanges {
                target: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
            }

            PropertyChanges {
                target: particle_check_control
                x: "-91"
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control1
                x: "-91"
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control2
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control3
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
            }

            PropertyChanges {
                target: slider_particle_intencity1
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity
                visible: false
            }

            PropertyChanges {
                target: cameraPerspective
                x: 0
                y: 75.788
                clipNear: 90
                eulerRotation.y: -180
                eulerRotation.z: -0
                eulerRotation.x: -3.38693
                z: -186.88911
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: sceneEnvironment
                probeOrientation.z: 3
            }

            PropertyChanges {
                target: lightPoint
                x: 0
                y: 111.226
                color: "#ffffff"
                brightness: 10.71
                z: -118.68448
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                visible: false
                endScale: 5
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: timeline2
                enabled: false
            }

            PropertyChanges {
                target: airinout
                running: false
            }

            PropertyChanges {
                target: myDigiWave4
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave5
                visible: !particle_check_control3.checkBoxChecked
                pvolume: 0
            }

            PropertyChanges {
                target: seatControlGroup
                opacity: 1
                visible: true
                color: "#00ffffff"
            }

            PropertyChanges {
                target: reclideDriver
                x: 861
                y: 186
            }

            PropertyChanges {
                target: reclineSliderPassenger
                x: 338
                y: 97
                opacity: 0
                visible: false
                snap: true
                stepSize: 1
                handleColor: "#d200a4"
                trackWidth: 3
                startAngle: -90
                layer.textureMirroring: ShaderEffectSource.MirrorHorizontally
                layer.enabled: false
                endAngle: 1
            }

            PropertyChanges {
                target: reclineSliderDriver
                opacity: 1
                visible: true
                snap: true
                stepSize: 1
                handleColor: "#d200a4"
            }

            PropertyChanges {
                target: reclineText
                x: 847
                y: 158
            }

            PropertyChanges {
                target: mouseArea
                enabled: true
            }

            PropertyChanges {
                target: mouseArea2
                enabled: true
            }

            PropertyChanges {
                target: heaterDriver
                opacity: 0
            }

            PropertyChanges {
                target: reclidePassenger
                opacity: 0
            }

            PropertyChanges {
                target: warmerText
                opacity: 0
            }

            PropertyChanges {
                target: warmerText1
                opacity: 0
            }

            PropertyChanges {
                target: heaterPassenger
                opacity: 0
            }

            PropertyChanges {
                target: reclineText1
                opacity: 0
            }

            PropertyChanges {
                target: backbutton
                opacity: 0
                visible: true
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: arcTickmarksDriver
                width: 800
                height: 800
                opacity: 1
                visible: true
                color: "#00ffffff"
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 0
            }

            PropertyChanges {
                target: sUV_Outrun_CutRoof1
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: lightSpot
                castsShadow: false
            }

            PropertyChanges {
                target: plane2
                opacity: 1
            }

            PropertyChanges {
                target: plane1
                opacity: 1
            }
        },
        State {
            name: "reclinePassenger"

            PropertyChanges {
                target: seat_HVAC
                x: -28.825
                y: 49.219
                opacity: 1
                recline: reclinePassengerval
                heaterOn: heaterOnPassenger
                eulerRotation.z: -0.00001
                eulerRotation.x: -0.00001
                scale.z: 80
                scale.y: 80
                scale.x: 80
                z: -51.19228
                eulerRotation.y: 90.35339
            }

            PropertyChanges {
                target: seat_HVAC1
                x: 60
                y: 49.219
                opacity: 0
                heaterOn: heaterOnDriver
                eulerRotation.z: 0.00001
                eulerRotation.x: -0
                scale.z: 80
                scale.y: 80
                scale.x: 80
                z: -51
                eulerRotation.y: -130
            }

            PropertyChanges {
                target: seat_HVAC2
                opacity: 0
            }

            PropertyChanges {
                target: seat_HVAC3
                opacity: 0
            }

            PropertyChanges {
                target: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
            }

            PropertyChanges {
                target: particle_check_control
                x: "-91"
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control1
                x: "-91"
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control2
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control3
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
            }

            PropertyChanges {
                target: slider_particle_intencity1
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity
                visible: false
            }

            PropertyChanges {
                target: cameraPerspective
                x: 0
                y: 75.788
                clipNear: 90
                eulerRotation.y: -180
                eulerRotation.z: -0
                eulerRotation.x: -3.38693
                z: -186.88911
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: sceneEnvironment
                probeOrientation.z: 3
            }

            PropertyChanges {
                target: lightPoint
                x: 0
                y: 111.226
                color: "#ffffff"
                brightness: 10.71
                z: -118.68448
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                visible: false
                endScale: 5
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: timeline2
                enabled: false
            }

            PropertyChanges {
                target: airinout
                running: false
            }

            PropertyChanges {
                target: myDigiWave4
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave5
                visible: !particle_check_control3.checkBoxChecked
                pvolume: 0
            }

            PropertyChanges {
                target: seatControlGroup
                opacity: 1
                visible: true
                color: "#00ffffff"
            }

            PropertyChanges {
                target: reclidePassenger
                x: 627
                y: 186
            }

            PropertyChanges {
                target: reclineSliderPassenger
                x: 423
                y: 85
                opacity: 1
                visible: true
                snap: true
                stepSize: 1
            }

            PropertyChanges {
                target: reclineSliderDriver
                visible: false
                snap: true
                stepSize: 1
            }

            PropertyChanges {
                target: reclineText1
                x: 613
                y: 158
            }

            PropertyChanges {
                target: mouseArea
                enabled: true
            }

            PropertyChanges {
                target: mouseArea2
                enabled: true
            }

            PropertyChanges {
                target: warmerText1
                opacity: 0
            }

            PropertyChanges {
                target: heaterPassenger
                opacity: 0
            }

            PropertyChanges {
                target: heaterDriver
                opacity: 0
            }

            PropertyChanges {
                target: reclineText
                opacity: 0
            }

            PropertyChanges {
                target: reclideDriver
                opacity: 0
            }

            PropertyChanges {
                target: warmerText
                opacity: 0
            }

            PropertyChanges {
                target: backbutton
                opacity: 0
                visible: true
            }

            PropertyChanges {
                target: nightModeButton
                x: 1168
                y: 28
                width: 86
                height: 60
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: arcTickmarksPassenger
                x: 426
                y: 86
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 0
            }

            PropertyChanges {
                target: sUV_Outrun_CutRoof1
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: lightSpot
                castsShadow: false
            }

            PropertyChanges {
                target: plane2
                opacity: 1
            }

            PropertyChanges {
                target: plane1
                opacity: 1
            }
        },
        State {
            name: "ClimateDemo"
            PropertyChanges {
                target: sceneEnvironment
                probeHorizon: 0
                probeOrientation.x: 0
                probeOrientation.y: 0
                probeOrientation.z: 3
                probeExposure: globalDaymode ? "2" : "1"
            }

            PropertyChanges {
                target: slider_particle_intencity
                value: hvacmain.fanspeed * 5
                from: 20
            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
            }

            PropertyChanges {
                target: lightPoint
                x: -0
                z: -81.10617
                brightness: 11
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                paused: false
                running: false
                emitrate: fanspeed * 5
                pvolume: 99
            }

            PropertyChanges {
                target: timeline2
                enabled: true
            }

            PropertyChanges {
                target: airinout
                running: true
            }

            PropertyChanges {
                target: mouseArea
                visible: false
                enabled: false
            }

            PropertyChanges {
                target: sceneEnvironment1
                tonemapMode: SceneEnvironment.TonemapModeFilmic
            }

            PropertyChanges {
                target: hDRBloomTonemap
                tonemappingLerp: 0
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 1
                seatmode: false
            }

            PropertyChanges {
                target: particle_check_control2
                x: 1339
            }

            PropertyChanges {
                target: particle_check_control
                x: -130
            }

            PropertyChanges {
                target: particle_check_control1
                x: -107
            }

            PropertyChanges {
                target: particle_check_control3
                x: 1360
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
                visible: true
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
                visible: true
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown
                visible: false
            }

            PropertyChanges {
                target: demoClimate
                x: 167
                y: 137
                width: 941
                height: 446
                opacity: 0
                visible: true
                rotation: -180
                to: -190
                from: -170
                value: -180
            }

            PropertyChanges {
                target: camera1
                eulerRotation.x: 23
            }

            PropertyChanges {
                target: cameraPerspective
                x: 0
                y: 109
                eulerRotation.z: 0
                eulerRotation.x: -27.97
                fieldOfView: 57
                z: -68
                eulerRotation.y: demoClimate.value
            }

            PropertyChanges {
                target: lightSpot
                constantFade: 0
                linearFade: 1.9
                quadraticFade: 2.4
                coneAngle: 102
                innerConeAngle: 87
                brightness: 10
            }

            PropertyChanges {
                target: view3D1
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: myDigiWave4
                opacity: 0
                running: false
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                running: false
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                running: false
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                running: false
            }

            PropertyChanges {
                target: myDigiWave5
                opacity: 0
                running: false
            }

            PropertyChanges {
                target: controlBar
                y: 746
                opacity: 0
            }

            PropertyChanges {
                target: buttonBar
                y: -94
                opacity: 0
            }
        },
        State {
            name: "SeatDemo"
            PropertyChanges {
                target: seat_HVAC
                x: -192.005
                y: 49.219
                scale.x: 75
                eulerRotation.z: -0.00001
                scale.y: 75
                eulerRotation.x: 0
                eulerRotation.y: 130
                heaterOn: heaterOnPassenger
                scale.z: 75
                z: -82.57679
            }

            PropertyChanges {
                target: seat_HVAC1
                x: 1.038
                y: 47.341
                eulerRotation.y: demoSeat.value
                scale.x: 75
                eulerRotation.z: 0.00001
                scale.y: 75
                eulerRotation.x: -0
                heaterOn: heaterOnDriver
                scale.z: 75
                z: -69.63245
            }

            PropertyChanges {
                target: seat_HVAC2
                opacity: 0
            }

            PropertyChanges {
                target: seat_HVAC3
                opacity: 0
            }

            PropertyChanges {
                target: outrun_hdri_sandi006
                source: globalDaymode ? "images/environment_day.hdr" : "images/environment_night.hdr"
            }

            PropertyChanges {
                target: particle_check_control
                x: -91
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control1
                x: -91
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control2
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_check_control3
                x: 1316
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control
                opacity: 0
            }

            PropertyChanges {
                target: particle_center_control1
                opacity: 0
            }

            PropertyChanges {
                target: slider_particle_intencity1
                visible: false
            }

            PropertyChanges {
                target: slider_particle_intencity
                visible: false
            }

            PropertyChanges {
                target: cameraPerspective
                x: -0
                y: 75.788
                clipNear: 80
                eulerRotation.y: -180
                eulerRotation.z: -0
                eulerRotation.x: -3.38693
                z: -202.60466


            }

            PropertyChanges {
                target: timeline1
                enabled: true
            }

            PropertyChanges {
                target: sceneEnvironment
                probeOrientation.z: 3
            }

            PropertyChanges {
                target: lightPoint
                x: 0
                y: 111.226
                color: "#ffffff"
                brightness: 10.71
                z: -118.68448
            }

            PropertyChanges {
                target: myDigiWave
                opacity: 0
                visible: false
                endScale: 5
                running: true
                pvolume: 99
            }

            PropertyChanges {
                target: myDigiWave1
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave2
                opacity: 0
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave3
                opacity: 0
                visible: false
            }

            PropertyChanges {
                target: timeline2
                enabled: false
            }

            PropertyChanges {
                target: airinout
                running: false
            }

            PropertyChanges {
                target: myDigiWave4
                visible: false
                pvolume: 0
            }

            PropertyChanges {
                target: myDigiWave5
                visible: !particle_check_control3.checkBoxChecked
                pvolume: 0
            }

            PropertyChanges {
                target: seatControlGroup
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: mouseArea
                visible: true
                enabled: true
            }

            PropertyChanges {
                target: mouseArea2
                enabled: true
            }

            PropertyChanges {
                target: backbutton
                opacity: 0
            }

            PropertyChanges {
                target: particlesUpdown1
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown2
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown3
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown4
                visible: false
            }

            PropertyChanges {
                target: particlesUpdown5
                visible: false
            }

            PropertyChanges {
                target: demoModeButton
                opacity: 1
                seatmode: true
            }

            PropertyChanges {
                target: sUV_Outrun_CutRoof1
                opacity: 0
                visible: true
                roofRootVisible: true
            }

            PropertyChanges {
                target: lightSpot
                castsShadow: false
            }

            PropertyChanges {
                target: reclineText1
                x: 1321
                font.bold: false
            }

            PropertyChanges {
                target: myAudioPointsControl
                opacity: 0
                visible: false
                soundpoint1Checked: false
                soundpoint3Checked: false
                soundpoint2Checked: false
            }

            PropertyChanges {
                target: plane1
                x: 0.045
                y: -0.177
                opacity: 1
                depthBias: 0
                z: 0.22577
            }

            PropertyChanges {
                target: plane2
                x: -0.028
                y: -0.18
                opacity: 1
                depthBias: 0
                z: 0.21509
            }

            PropertyChanges {
                target: buttonBar
                y: -94
            }

            PropertyChanges {
                target: controlBar
                y: 751
            }

            PropertyChanges {
                target: reclideDriver
                x: -129
            }

            PropertyChanges {
                target: reclidePassenger
                x: 1313
            }

            PropertyChanges {
                target: heaterDriver
                x: -126
            }

            PropertyChanges {
                target: heaterPassenger
                x: 1315
            }

            PropertyChanges {
                target: reclineText
                x: -122
            }

            PropertyChanges {
                target: warmerText
                x: -119
            }

            PropertyChanges {
                target: warmerText1
                x: 1321
            }

            PropertyChanges {
                target: demoSeat
                x: 358
                y: 144
                width: 569
                height: 480
                visible: true
                value: -130
                to: -290
                from: -50
            }
        }
    ]
    transitions: [
        Transition {

            NumberAnimation {
                properties: "recline,clipNear,innerCar_RoofCutOpacity,car_MainBody_outside_FrontWindowOpacity,brightness,edgeStrength,alphaMultiply,transparency,clearColor,opacity,amount,fieldOfView,x,y,z,eulerRotation.y,eulerRotation.z,eulerRotation.x,scale.x,scale.y,scale.z,particlesTabs.opacity,animatedSpriteParticleColor"
                easing.type: Easing.InOutQuad
                duration: 2000
            }

            ColorAnimation {
                properties: "diffuseColor"
                easing.type: Easing.InOutQuad
                duration: 2000
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}
}
##^##*/
