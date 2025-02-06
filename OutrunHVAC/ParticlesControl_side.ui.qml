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

CheckBox {
    id: control
    width: 60
    height: 44
    opacity: 1
    text: qsTr("")
    checkable: true
    display: AbstractButton.IconOnly
    tristate: false
    layer.enabled: true
    spacing: 0
    wheelEnabled: false
    enabled: true
    hoverEnabled: false
    focusPolicy: Qt.NoFocus
    checked: false

    Image {
        id: p_top_c_off
        x: 0
        y: 0
        visible: true
        source: "images/ui/p_top_c_off.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: p_top_c_on
        x: 0
        y: 0
        source: "images/ui/p_top_c_on.png"
        fillMode: Image.PreserveAspectFit
    }

    states: [
        State {
            name: "checked"
            when: control.checked

            PropertyChanges {
                target: p_top_c_off
                visible: false
            }
        },
        State {
            name: "unchecked"
            when: !control.checked

            PropertyChanges {
                target: p_top_c_on
                visible: false
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;height:44;width:60}
}
##^##*/
