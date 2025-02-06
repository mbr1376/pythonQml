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

Rectangle {
    id: arcTickmarks
    width: 800
    height: 800
    color: "#00ffffff"

    Rectangle {
        id: tick1
        width: 800
        height: 800
        color: "#00ffffff"

        Rectangle {
            id: tickmark1
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }

    Rectangle {
        id: tick2
        width: 800
        height: 800
        color: "#00ffffff"
        rotation: 18
        Rectangle {
            id: tickmark2
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }

    Rectangle {
        id: tick3
        width: 800
        height: 800
        color: "#00ffffff"
        rotation: 36
        Rectangle {
            id: tickmark3
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }

    Rectangle {
        id: tick4
        width: 800
        height: 800
        color: "#00ffffff"
        rotation: 54
        Rectangle {
            id: tickmark4
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }

    Rectangle {
        id: tick5
        width: 800
        height: 800
        color: "#00ffffff"
        rotation: 72
        Rectangle {
            id: tickmark5
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }

    Rectangle {
        id: tick6
        width: 800
        height: 800
        color: "#00ffffff"
        rotation: 90
        Rectangle {
            id: tickmark6
            x: 0
            y: 400
            width: 12
            height: 4
            color: globalDaymode ? "#000000" : "#FFFFFF"
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:800;width:800}
}
##^##*/
