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

import QtQml
import QtOutrun.Mqtt

MqttClient {
    id: mqttClient

    readonly property alias globalDaymode: internals.globalDaymode
    readonly property alias debugViewEnabled: internals.debugViewEnabled

    readonly property QtObject internals: QtObject {
        id: internals
        property var mqttNightSubscription: null
        property var mqttGenericSubscription: null

        property bool globalDaymode: true
        property bool debugViewEnabled: false
    }

    hostname: Qt.platform.os === "android" ? "127.0.0.1" : "test.mosquitto.org"

    onMessageStringReceived: (message, topic)=> {
        console.log(topic, message)
        switch(topic) {
        case "outrun/environment/night":
            internals.globalDaymode = (message === "true") ? false : true;
            break;
        case "outrun/generic/simulation":
            // TODO: Add a simulation mode?
            //mainScreen.simulationRunning = (message === "true") ? true : false;
            break;
        case "outrun/generic/debugview":
            internals.debugViewEnabled = (message === "true") ? true : false;
            break;
        }
    }

    onErrorChanged: {
        console.log("MQTT Error: " + error);
    }

    onConnected: {
        console.log("MQTT Connected");
        internals.mqttNightSubscription = subscribe("outrun/environment/night");
        internals.mqttGenericSubscription = subscribe("outrun/generic/#");
    }

    Component.onCompleted: {
        connectToHost();
    }
}
