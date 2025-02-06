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
import QtQuick.Studio.Effects 1.0

Item {
    id: root

    readonly property int pt_r: 10;
    readonly property int drag_r: 30;
    readonly property int wave_pool_size: 10;
    
    property double dragInterv: 0;       // counter for starting intensity adjustment mode
    property bool intensityMode: false;  // is in intensity adjustment mode
    property double pressIntensity: 0;   // point intensity upon pressing
    property int dragAreaSize: Qt.platform.os ==="android" ? 30 : 2

    property bool showPoint1: true;
    property bool showPoint2: true;
    property bool showPoint3: true;

    property var soundPoints: [
        { color: Qt.rgba(.824,  0,   .643, 1), center: Qt.point(60,  90), intensity: 100, interv: 0,   wavePool: [], activeWaves: [] },
        { color: Qt.rgba(.439, .471, .733, 1), center: Qt.point(340, 90), intensity: 100, interv: .3,  wavePool: [], activeWaves: [] },
        { color: Qt.rgba(.604, .596, .612, 1), center: Qt.point(50, 390), intensity: 100, interv: .7,  wavePool: [], activeWaves: [] }
    ];

    property var dragPoint: null;
    
    property double intensityProgress: 0;

    Component.onCompleted: {
        root.soundPoints.forEach(p => {
            for (let i = 0; i < root.wave_pool_size; ++i)
                p.wavePool.push({r: root.pt_r, center: p.center, opacity: 0});
        });
    }
    
    function paintContext(ctx, lineWidth, drawWaves = true) {
        ctx.reset()
        ctx.lineWidth = lineWidth;

        for (let i = 0; i < root.soundPoints.length; ++i) {
            if (root["showPoint" + (i+1)]) {
                let p = root.soundPoints[i];

                if (drawWaves) {
                    // draw waves
                    ctx.lineWidth = lineWidth;
                    p.activeWaves.forEach(function (w) {
                        p.color.a = w.opacity;
                        ctx.strokeStyle = p.color;

                        ctx.beginPath();
                        ctx.arc(w.center.x, w.center.y, w.r, 0, Math.PI * 2, false);
                        ctx.closePath();

                        // draw wave edge lines
                        const w_r_Sq = w.r * w.r;
                        if (w.center.x - w.r < 0) {
                            const d = w.center.x;
                            const D = Math.sqrt(w_r_Sq - d * d);
                            ctx.moveTo(1, w.center.y - D - 1);
                            ctx.lineTo(1, w.center.y + D + 1);
                        } 
                        if (w.center.x + w.r > canvas.width) {
                            const d = canvas.width - w.center.x;
                            const D = Math.sqrt(w_r_Sq - d * d);
                            ctx.moveTo(canvas.width - 1, w.center.y - D - 1);
                            ctx.lineTo(canvas.width - 1, w.center.y + D + 1);
                        }
                        if (w.center.y - w.r < 0) {
                            const d = w.center.y;
                            const D = Math.sqrt(w_r_Sq - d * d);
                            ctx.moveTo(w.center.x - D - 1, 1);
                            ctx.lineTo(w.center.x + D + 1, 1);
                        }
                        if (w.center.y + w.r > canvas.height) {
                            const d = canvas.height - w.center.y;
                            const D = Math.sqrt(w_r_Sq - d * d);
                            ctx.moveTo(w.center.x - D - 1, canvas.height - 1);
                            ctx.lineTo(w.center.x + D + 1, canvas.height - 1);
                        }
                        ctx.stroke();
                    });
                }
                
                // draw center points
                p.color.a = 1;
                ctx.strokeStyle = "#ffffff";
                ctx.lineWidth = 4;
                ctx.fillStyle = p.color;
                ctx.beginPath();
                ctx.arc(p.center.x, p.center.y, root.pt_r, 0, Math.PI * 2, false);
                ctx.closePath();
                ctx.stroke();
                ctx.fill();
            }
        };
    }

    Canvas {
        id: canvasGlow

       anchors.fill: parent
        layer.enabled: true
        layer.effect: FastBlurEffect {
            id: fastBlur
            radius: 40
            antialiasing: true
            transparentBorder: false
            cached: false
        }

        onPaint: {
            var ctx = getContext("2d");
            root.paintContext(ctx, 10);
        }
    }

    Canvas {
        id: canvas

        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            root.paintContext(ctx, 2);
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onPressed: (mouse) => {
            for (let i = 0; i < root.soundPoints.length; ++i) {
                if (root["showPoint" + (i+1)]) {
                    let p = root.soundPoints[i];
                    const distSq = Math.pow(p.center.x - mouse.x, 2)
                               + Math.pow(p.center.y - mouse.y, 2);
                    if (distSq < root.drag_r * root.drag_r) {
                        root.dragPoint = root.soundPoints[i];
                        return;
                    }
                }
            };
        }
       
        onReleased: {
            root.dragPoint = null;
            root.dragInterv = 0;
            root.intensityMode = false;
        }
    }

    Timer {
        id: timer

        running: root.visible
        interval: 50
        repeat: true

        property int prevMouseX: 0;
        property int prevMouseY: 0;
        
        onTriggered: {
            var dt = timer.interval / 1000;

            // drag
            if (root.dragPoint) {
                var p = root.dragPoint;
                
                if (root.intensityMode) {
                    var dx = mouseArea.mouseX - root.dragPoint.center.x;
                    dx = Math.min(Math.max(dx, -300), 300); // range: -300 to 300
                    var intensity = Math.min(Math.max(pressIntensity + dx, 40), 300); // range: 40 to 300
                    root.dragPoint.intensity = intensity;
                    root.intensityProgress = (intensity - 40) / 260
                } else {
                    p.center = Qt.point(mouseArea.mouseX, mouseArea.mouseY);
    
                    // prevent dragging outside the scene
                    if (p.center.x < 0)
                        p.center.x = 0;
                    else if (p.center.x > canvas.width)
                        p.center.x = canvas.width;
    
                    if (p.center.y < 0)
                        p.center.y = 0;
                    else if (p.center.y > canvas.height)
                        p.center.y = canvas.height;
                        
                    if (root.dragInterv != -1) {
                        root.dragInterv += dt;
                        if (Math.abs(mouseArea.mouseX - timer.prevMouseX) < dragAreaSize
                         && Math.abs(mouseArea.mouseY - timer.prevMouseY) < dragAreaSize) {
                            if (root.dragInterv > 1.5) {
                                root.intensityProgress =(p.intensity - 40) / 260; // needs to be first so popup progress is updated before it shows
                                root.intensityMode = true;
                                root.pressIntensity = p.intensity;
                            }
                         } else {
                            if (root.dragInterv > dt)
                                root.dragInterv = -1;
                         }
                    }
                        
                    timer.prevMouseX = mouseArea.mouseX;
                    timer.prevMouseY = mouseArea.mouseY;
                }
            }

            for (let i = 0; i < root.soundPoints.length; ++i) {
                let p = root.soundPoints[i];
                if (root["showPoint" + (i + 1)]) {
                    p.interv += dt;
                    
                    if (p.interv > .5 + 1 * (p.intensity - 40) / 260) {
                        if (p.wavePool.length === 0) {
                            console.warn("Wave pool exausted, p idx=" + i);
                        } else {
                            var w = p.wavePool.pop();
                            w.r = root.pt_r / 2;
                            w.center = p.center;
                            w.opacity = 1;
                            p.activeWaves.push(w);
                            p.interv = 0;
                        }
                    }

                    // update waves
                    p.activeWaves.forEach(function(w, i) {
                        // update wave
                        w.r += 40 * dt;
                        w.opacity = 1 - w.r / p.intensity;

                        // wave done, return to pool
                        if (w.r > p.intensity) {
                            p.wavePool.push(p.activeWaves.splice(i, 1)[0]); 
                        }
                    });
                }
            };

            canvas.requestPaint();
            canvasGlow.requestPaint();
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
