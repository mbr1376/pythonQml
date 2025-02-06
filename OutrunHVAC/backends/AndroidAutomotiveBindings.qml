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
import OutrunHVAC 1.0
import QtIf.Android.VehicleProperties

QtObject {
    id: root
    property var mainScreen: null

    property LightsControl lightsControl: LightsControl { id: lightsControl }
    property HVAC hvacControl: HVAC { id: hvacControl }

    property list<Binding> bindings : [
        Binding {
            target: mainScreen; property: 'globalDaymode'
            value: lightsControl.headlightsState === 0
            when: mainScreen !== null
        },

        //fanspeed
        Binding {
            target: hvacControl; property: 'fanSpeed'
            value: mainScreen.fanspeed
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'fanSpeed'
            value: hvacControl.fanSpeed
            when: mainScreen !== null
        },

        //seat heater driver
        Binding {
            target: hvacControl.zoneAt.Driver; property: 'seatTemperature'
            value: mainScreen.heaterOnDriver
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'heaterOnDriver'
            value: hvacControl.zoneAt.Driver.seatTemperature
            when: mainScreen !== null
        },
        //seat heater passenger
        Binding {
            target: hvacControl.zoneAt.Passenger; property: 'seatTemperature'
            value: mainScreen.heaterOnPassenger
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'heaterOnPassenger'
            value: hvacControl.zoneAt.Passenger.seatTemperature
            when: mainScreen !== null
        },
        //air conditioner
        Binding {
            target: hvacControl; property: 'acOn'
            value: mainScreen.acOn
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'acOn'
            value: hvacControl.acOn
            when: mainScreen !== null
        },
        //climate auto
        Binding {
            target: hvacControl; property: 'autoOn'
            value: mainScreen.acAuto
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'autoOn'
            value: hvacControl.autoOn
            when: mainScreen !== null
        },
        //ac dual mode
        Binding {
            target: hvacControl; property: 'dualOn'
            value: mainScreen.acSync
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'dualOn'
            value: hvacControl.dualOn
            when: mainScreen !== null
        },
        //defroster rear
        Binding {
            target: hvacControl.zoneAt.RearWindshield; property: 'defroster'
            value: mainScreen.rearwindowDefrost
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'defrostRear'
            value: hvacControl.zoneAt.RearWindshield.defroster
            when: mainScreen !== null
        },
        //defroster front
        Binding {
            target: hvacControl.zoneAt.FrontWindshield; property: 'defroster'
            value: mainScreen.windscreeDefrost
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'defrostFront'
            value: hvacControl.zoneAt.FrontWindshield.defroster
            when: mainScreen !== null
        },
        //recirculation
        Binding {
            target: hvacControl; property: 'recircOn'
            value: mainScreen.recirculation
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'recircOn'
            value: hvacControl.recircOn
            when: mainScreen !== null
        },
        // temperature set driver side
        Binding {
            target: hvacControl.zoneAt.DriverSide; property: 'temperatureSet'
            value: mainScreen.tempDriverseat
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'tempDriverSide'
            value: hvacControl.zoneAt.DriverSide.temperatureSet
            when: mainScreen !== null
        },
        // temperature set passenger side
        Binding {
            target: hvacControl.zoneAt.PassengerSide; property: 'temperatureSet'
            value: mainScreen.tempPassengerseat
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'tempPassengerSide'
            value: hvacControl.zoneAt.PassengerSide.temperatureSet
            when: mainScreen !== null
        },
        // fan direction
        Binding {
            target: hvacControl; property: 'fanDirection'
            value: mainScreen.fanDirectionDriver
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'fanDirectionDriver'
            value: hvacControl.fanDirection
            when: mainScreen !== null
        },

        Binding {
            target: hvacControl; property: 'fanDirection'
            //TODO: bind fan direction from AA to proper properties
            value: mainScreen.fanDirectionPassenger
            when: mainScreen !== null
        },
        Binding {
            target: DData; property: 'fanDirectionPassenger'
            value: hvacControl.fanDirection
            when: mainScreen !== null
        }
    ]
}
