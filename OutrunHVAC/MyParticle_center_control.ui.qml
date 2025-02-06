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
    id: particle_center_control
    width: 60
    height: 44
    color: "#00ffffff"
    property alias checkBoxChecked: checkBox.checked
    property alias checkBox: checkBox

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 60
        height: 44
        color: "#00ffffff"

        Image {
            id: pControlcenter_on
            x: 0
            y: 0
            visible: false
            source: "images/ui/pControlcenter_on.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: pControlcenter_off
            x: 0
            y: 0
            source: "images/ui/pControlcenter_off.png"
            rotation: 180
            fillMode: Image.PreserveAspectFit
        }

        CheckBox {
            id: checkBox
            width: 60
            height: 44
            opacity: 0
            text: qsTr("")
            display: AbstractButton.IconOnly
        }
    }
    states: [
        State {
            name: "State1"
            when: !checkBox.checked
        },
        State {
            name: "State2"
            when: checkBox.checked

            PropertyChanges {
                target: pControlcenter_off
                visible: false
            }

            PropertyChanges {
                target: pControlcenter_on
                visible: true
            }
        }
    ]
}


