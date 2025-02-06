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

ParticleSystem3D {
    id: digiWave
    opacity: 1
    property real airside : 25
    property real endScale: 5
    property real emitrate: 10
    property real pvolume : 99
    property real grav : 7

    running: visible
    eulerRotation.z: 0
    scale.y: 1
    eulerRotation.x: 0
    seed: 1200000000
    time: 0
    scale.x: 1
    z: 128.72653
    scale.z: 1
    eulerRotation.y: 0

    ParticleEmitter3D {
        id: animatedSpriteEmitter
        particleRotationVelocity.z: 1
        particleRotationVelocity.y: 2

        particleEndScale: endScale
        emitRate: emitrate
        depthBias: 5000
        particleRotationVariation.y: 10
        particleRotationVariation.x: 104
        particleScale: 2
        particleEndScaleVariation: 0.1
        particleScaleVariation: 0.05
        lifeSpanVariation: 100
        velocity: animatedSpriteDirection
        particle: animatedSpriteParticle
        SpriteParticle3D {
            id: animatedSpriteParticle
            color: "#e18ff7"
            alignMode: Particle3D.AlignNone
            alignTargetPosition.y: 0
            maxAmount: pvolume
            colorTable: color_shades_particle
            sortMode: Particle3D.SortNone
            colorVariation.y: 0
            colorVariation.x: 0
            fadeInEffect: Particle3D.FadeOpacity
            fadeOutEffect: Particle3D.FadeOpacity
            fadeInDuration: 1000
            unifiedColorVariation: true
            fadeOutDuration: 3000
            particleScale: 25
            billboard: true
            sprite: animatedTexture
            spriteSequence: animatedSequence
            SpriteSequence3D {
                id: animatedSequence
                durationVariation: 100
                randomStart: true
                animationDirection: SpriteSequence3D.AlternateReverse
                frameIndex: 0
                frameCount: 19
                duration: 3000
                interpolate: true
            }

            Texture {
                id: animatedTexture
                source: "images/digiWave_singleV7.png"
            }

            Texture {
                id: color_shades_particle
                source: "images/color_shades_particle.png"
            }
        }

        VectorDirection3D {
            id: animatedSpriteDirection
            normalized: true
            directionVariation.y: 2
            direction.x: 0
            direction.y: 30
        }

        Gravity3D {
            id: gravity
            x: 14.034
            y: -9.101
            magnitude: grav
            direction.z: 0
            direction.x: 5
            direction.y: 0
            particles: animatedSpriteParticle
            system: digiWave
            z: 0
        }

        lifeSpan: 4000
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: airflowAnimation
                running: true
                duration: 1000
                loops: 1
                to: 100
                from: 0
            }
        ]
        startFrame: 0
        enabled: true
        endFrame: 100
        currentFrame: airside

        KeyframeGroup {
            target: animatedSpriteParticle
            property: "color"
            Keyframe {
                frame: 15
                value: "#7f8ef0"
            }

            Keyframe {
                frame: 30
                value: "#e18ff7"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
