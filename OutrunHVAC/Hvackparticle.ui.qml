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
import QtQuick3D.Particles3D

ParticleSystem3D {
    id: particleSystem
    time: 10000
    scale.z: 1
    scale.y: 1
    scale.x: 1
    eulerRotation.x: slider.value
    running: checkbox.checked
    startTime: 2000
    z: 211.38556

    ParticleEmitter3D {
        id: particleEmitter
        opacity: 1
        visible: true
        depthBias: 50
        system: particleSystem
        shape: particleShape
        particleEndScale: 1
        emitRate: 1000
        VectorDirection3D {
            id: dir3d
            normalized: true
            directionVariation.x: 10
            directionVariation.y: 10
        }

        SpriteParticle3D {
            id: spriteParticle
            color: "#00efab23"
            alignMode: Particle3D.AlignTowardsStartVelocity
            fadeOutEffect: Particle3D.FadeOpacity
            unifiedColorVariation: false
            alignTargetPosition.y: 155
            alignTargetPosition.x: 0
            fadeInDuration: 20
            colorVariation.x: 0
            colorVariation.y: 0
            colorVariation.w: 0
            fadeOutDuration: 50
            fadeInEffect: Particle3D.FadeOpacity
            blendMode: SpriteParticle3D.Screen
            billboard: false
            sprite: texture1
            particleScale: 20
            maxAmount: 150

            Texture {
                id: texture1
                source: "images/particles/trace_01.png"
            }
        }

        ParticleShape3D {
            id: particleShape
            type: ParticleShape3D.Cube
            extents.y: 0
            extents.z: 0
            extents.x: 13
        }
        velocity: dir3d
        particleScale: 8
        particle: spriteParticle
        lifeSpan: 1000
        lifeSpanVariation: 100
    }

    ParticleEmitter3D {
        id: particleEmitter3
        visible: true
        particleRotation.y: 0
        scale.x: 1
        particleRotationVelocityVariation.z: 0
        particleRotationVariation.z: 0
        particleRotationVariation.y: 0
        particleRotationVariation.x: 0
        particleRotationVelocity.z: 18
        particleRotationVelocity.y: 50
        particleRotationVelocity.x: 0
        particleScaleVariation: 8
        depthBias: 0
        system: particleSystem
        scale.y: 1
        particleRotation.x: 71
        particleEndScaleVariation: 0
        shape: particleShape
        particleScale: 3
        particleEndScale: 3
        emitRate: 1000
        particle: spriteParticle3
        lifeSpan: 300
        VectorDirection3D {
            id: dir3d3
            normalized: true
            direction.x: 51
            directionVariation.z: 0
            direction.y: 103
            directionVariation.x: 0
            directionVariation.y: 12
        }

        SpriteParticle3D {
            id: spriteParticle3
            color: "#dee1e1ec"
            alignTargetPosition.x: 0
            billboard: false
            colorVariation.y: 0
            fadeInDuration: 190
            Texture {
                id: texture4
                source: "images/particles/smokeparticlestex.png"
            }
            sprite: texture4
            particleScale: 20
            fadeOutDuration: 1000
            maxAmount: 150
            blendMode: SpriteParticle3D.SourceOver
            fadeInEffect: Particle3D.FadeOpacity
            colorVariation.x: 0
        }
        velocity: dir3d3
        lifeSpanVariation: 20
    }
}
