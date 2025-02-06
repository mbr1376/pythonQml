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
import QtQuick.Shapes
import QtQuick.Timeline

Rectangle {
    id: root

    width: 200
    height: 54
    color: "#80000000"
    radius: 16

    property color barColor: "#000000"
    property double barProgress: 0

    Text {
        id: text1
        anchors.horizontalCenter: parent.horizontalCenter
        y: 5
        color: "#ffffff"
        text: qsTr("Drag for intensity")
        font.pixelSize: 20
        anchors.horizontalCenterOffset: 1
        font.family: "Open Sans"
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 39
        width: 180
        height: 10
        color: "#80000000"
        radius: 5

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 2
            width: Math.max(root.barProgress * 176, 8)
            height: 8
            color: root.barColor
            radius: 4
        }
    }
}



