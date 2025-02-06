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
import OutrunHVAC 1.0

Item {
    width: Constants.width
    height: Constants.height
    property alias androidMode: mainScreen.androidMode

    Screen01 {
        id: mainScreen
    }

    Loader {
        id: androidAutomotiveBindings
        active : false
        source: "backends/AndroidAutomotiveBindings.qml"
        onStatusChanged: if (androidAutomotiveBindings.status === Loader.Ready)
                             androidAutomotiveBindings.item.mainScreen = mainScreen
    }

    Loader {
        id: mqttLoader
        source: "backends/MqttConnector.qml"
        active : false
        onStatusChanged: {
            if (status === Loader.Error) {
                console.log("Could not load MqttConnection. Is QtOutrun.Mqtt module installed?")
            }
        }

        Binding {
            target: mainScreen
            when: mqttLoader.status === Loader.Ready
            property: "globalDaymode"
            value:  mqttLoader.item && mqttLoader.item.globalDaymode
        }

        Binding {
            target: mainScreen
            when: mqttLoader.status === Loader.Ready
            property: "debugViewEnabled"
            value: mqttLoader.item && mqttLoader.item.debugViewEnabled
        }
    }
}
