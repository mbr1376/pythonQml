import QtQuick
import QtQuick3D
Node {
    id: sUVRoot
    property alias roofRootVisible: roofRoot.visible
    scale.x: 100
    scale.y: 100
    scale.z: 100
    Node {
        id: backLeftDoorRoot
        x: 0.90024
        z: -0.261408
        Model {
            id: sUV_BackDoorLeft_low
            x: -0.90024
            z: 0.261408
            source: "meshes/sUV_BackDoorLeft_low.mesh"

            PrincipledMaterial {
                id: sUV_Outside1_material
                normalStrength: 0
                emissiveFactor.x: 0
                baseColor: "#2a2a2a"
                specularAmount: 0
                lightProbe: outrun_hdri_sandi006
                depthDrawMode: Material.AlwaysDepthDraw
                opacityChannel: Material.A
                metalnessMap: Texture {
                    source: "maps/SUV_Outside1_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                metalnessChannel: Material.B
                roughnessMap: Texture {
                    source: "maps/SUV_Outside1_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                roughnessChannel: Material.G
                metalness: 1
                roughness: 0
                normalMap: Texture {
                    source: "maps/SUV_Outside1_normal.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }

            DefaultMaterial {
                id: defaultMaterial1
                cullMode: Material.NoCulling
                depthDrawMode: Material.AlwaysDepthDraw
                indexOfRefraction: 2.2
                specularReflectionMap: piecenb41
                specularRoughness: 0.001
                specularAmount: 0.8
                lightProbe: outrun_hdri_sandi006
                diffuseColor: "#1b1b1b"
            }
            materials: defaultMaterial1
        }
        Model {
            id: sUV_BackLeftDoorFrames_low
            x: -0.90024
            visible: true
            z: 0.261408
            source: "meshes/sUV_BackLeftDoorFrames_low.mesh"

            PrincipledMaterial {
                id: sUV_SmallParts_2_material
                baseColor: "#fefefe"
                lightProbe: outrun_hdri_sandi006
                depthDrawMode: Material.AlwaysDepthDraw
                metalness: 1
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }

            DefaultMaterial {
                id: defaultMaterial2
                fresnelPower: 0
                cullMode: Material.NoCulling
                specularReflectionMap: piecenb41
                specularTint: "#d2d2d2"
                lightProbe: outrun_hdri_sandi006
                depthDrawMode: Material.AlwaysDepthDraw
                specularAmount: 0.9
                indexOfRefraction: 2.6
                specularRoughness: 1
                diffuseColor: "#0b0b0b"
            }
            materials: defaultMaterial2
        }
        Model {
            id: sUV_BackLeftInnerDoor_low
            x: -0.90024
            z: 0.261408
            source: "meshes/sUV_BackLeftInnerDoor_low.mesh"

            PrincipledMaterial {
                id: interior_material
                normalStrength: 0.2
                baseColor: "#313131"
                specularAmount: 0
                lightProbe: dashboard_hdr_dark
                depthDrawMode: Material.AlwaysDepthDraw
                baseColorMap: Texture {
                    source: "maps/Interior_baseColor.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                opacityChannel: Material.A
                metalnessMap: Texture {
                    source: "maps/Interior_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                metalnessChannel: Material.B
                roughnessMap: Texture {
                    source: "maps/Interior_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                roughnessChannel: Material.G
                metalness: 0.1
                roughness: 0
                normalMap: Texture {
                    source: "maps/Interior_normal.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque

                Texture {
                    id: outrun_hdri_sandi006
                    source: "../../../images/outrun_hdri_sandi006.hdr"
                    mappingMode: Texture.LightProbe
                }
            }
            materials: [
                interior_material
            ]
        }
        Model {
            id: sUV_WindowBackLeftDoor_low
            x: -0.90024
            visible: true
            z: 0.261408
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowBackLeftDoor_low.mesh"

            PrincipledMaterial {
                id: sUV_Windows_material
                opacity: 0.5
                specularTint: 0
                metalness: 1
                specularReflectionMap: piecenb41
                lightProbe: outrun_hdri_sandi006
                roughness: 0.2
                specularAmount: 1
                depthDrawMode: Material.AlwaysDepthDraw
                baseColor: "#8b9a9ba4"
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque

                Texture {
                    id: car_Inside_HDRI
                    source: "../../../images/Car_Inside_HDRI.hdr"
                    mappingMode: Texture.LightProbe
                }

                Texture {
                    id: piecenb41
                    source: "../../../images/dashboard_hdr.hdr"
                    rotationUV: 3
                    scaleV: 1
                    scaleU: 1
                    positionV: 0.55
                    positionU: 0.1
                    mappingMode: Texture.LightProbe
                }
            }
            materials: defaultMaterial
        }
    }
    Node {
        id: backRightDoorRoot
        x: -0.90024
        z: -0.261408
        Model {
            id: sUV_BackDoorRight_low
            x: 0.90024
            visible: true
            z: 0.261408
            source: "meshes/sUV_BackDoorRight_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_BackRightDoorFrames_low_001
            x: 0.90024
            visible: true
            z: 0.261408
            source: "meshes/sUV_BackRightDoorFrames_low_001.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_BackRightInnerDoor_low
            x: 0.90024
            z: 0.261408
            source: "meshes/sUV_BackRightInnerDoor_low.mesh"
            materials: [
                interior_material
            ]
        }
        Model {
            id: sUV_WindowBackRightDoor_low
            x: 0.90024
            visible: true
            z: 0.261408
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowBackRightDoor_low.mesh"
            materials: defaultMaterial
        }
    }
    Model {
        id: centralBackPadding
        y: 0.833376
        z: -0.78105
        rotation: Qt.quaternion(0.686756, 0.726888, 0, 0)
        scale.x: 1.08122
        scale.y: 1.13227
        scale.z: 1.13227
        source: "meshes/centralBackPadding.mesh"

        PrincipledMaterial {
            id: handRest_material
            baseColor: "#ffffff"
            specularReflectionMap: piecenb41
            lightProbe: car_Inside_HDRI
            depthDrawMode: Material.AlwaysDepthDraw
            baseColorMap: Texture {
                source: "maps/HandRest_baseColor.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            metalnessMap: Texture {
                source: "maps/HandRest_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            metalnessChannel: Material.B
            roughnessMap: Texture {
                source: "maps/HandRest_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            roughnessChannel: Material.G
            metalness: 1
            roughness: 1
            normalMap: Texture {
                source: "maps/HandRest_normal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            handRest_material
        ]
    }
    Model {
        id: centralPanelPadding
        y: 0.931457
        z: 0.0319131
        rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
        scale.x: 0.95491
        scale.y: 1
        scale.z: 1
        source: "meshes/centralPanelPadding.mesh"
        materials: [
            handRest_material
        ]
    }
    Node {
        id: chairsRoot
        visible: false
        Model {
            id: seat_back_BackLeft
            x: 0.426365
            y: 0.774603
            z: -1.07098
            rotation: Qt.quaternion(0.798201, 0.602391, 0, 0)
            source: "meshes/seat_back_BackLeft.mesh"

            PrincipledMaterial {
                id: newSeat_material
                specularReflectionMap: dashboard_hdr_dark
                depthDrawMode: Material.AlwaysDepthDraw
                baseColorMap: Texture {
                    source: "maps/CombinedSeatHeating_NewSeat_BaseColor.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                opacityChannel: Material.A
                metalnessMap: Texture {
                    source: "maps/CombinedSeatHeating_NewSeat_OcclusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                metalnessChannel: Material.B
                roughnessMap: Texture {
                    source: "maps/CombinedSeatHeating_NewSeat_OcclusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                roughnessChannel: Material.G
                metalness: 1
                roughness: 1
                normalMap: Texture {
                    source: "maps/CombinedSeatHeating_NewSeat_Normal.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_back_BackRight
            x: -0.421256
            y: 0.774639
            z: -1.07098
            rotation: Qt.quaternion(0.798201, 0.602391, 0, 0)
            source: "meshes/seat_back_BackRight.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_back_FrontLeft
            x: 0.421146
            y: 0.75964
            z: -0.163233
            rotation: Qt.quaternion(0.798201, 0.602391, 0, 0)
            source: "meshes/seat_back_FrontLeft.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_back_FrontRight
            x: -0.43136
            y: 0.75964
            z: -0.163233
            rotation: Qt.quaternion(0.798201, 0.602391, 0, 0)
            source: "meshes/seat_back_FrontRight.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_base_BackLeft
            x: 0.426365
            y: 0.734167
            z: -0.483166
            rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
            source: "meshes/seat_base_BackLeft.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_base_BackRight
            x: -0.421256
            y: 0.734203
            z: -0.483166
            rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
            source: "meshes/seat_base_BackRight.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_base_FrontLeft
            x: 0.416608
            y: 0.719204
            z: 0.424581
            rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
            source: "meshes/seat_base_FrontLeft.mesh"
            materials: [
                newSeat_material
            ]
        }
        Model {
            id: seat_base_FrontRight
            x: -0.43136
            y: 0.719204
            z: 0.424581
            rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
            source: "meshes/seat_base_FrontRight.mesh"
            materials: [
                newSeat_material
            ]
        }
    }
    Node {
        id: frontLeftDoorRoot
        x: 0.90024
        z: 0.943066
        Model {
            id: sUV_FrontDoorLeft_low
            x: -0.90024
            z: -0.943066
            source: "meshes/sUV_FrontDoorLeft_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_FrontLeftDoorFrame_low
            x: -0.90024
            visible: true
            z: -0.943066
            source: "meshes/sUV_FrontLeftDoorFrame_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_FrontLeftDoorGlass_low
            x: -0.90024
            z: -0.943066
            source: "meshes/sUV_FrontLeftDoorGlass_low.mesh"

            PrincipledMaterial {
                id: sideMirrorGlass_material
                metalness: 0.7
                lightProbe: dashboard_hdr_dark
                roughness: 1
                specularAmount: 0.4
                specularReflectionMap: piecenb41
                depthDrawMode: Material.AlwaysDepthDraw
                baseColor: "#161616"
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                sideMirrorGlass_material
            ]
        }
        Model {
            id: sUV_FrontLeftInnerDoor_low
            x: -0.90024
            z: -0.943066
            source: "meshes/sUV_FrontLeftInnerDoor_low.mesh"
            materials: [
                interior_material
            ]
        }
        Model {
            id: sUV_LeftTurnSignalLight_low
            x: -0.90024
            visible: false
            z: -0.943066
            source: "meshes/sUV_LeftTurnSignalLight_low.mesh"

            PrincipledMaterial {
                id: sUV_SideMirrorTurnSignal_material
                depthDrawMode: Material.AlwaysDepthDraw
                baseColor: "#111111"
                roughness: 0.5
                emissiveFactor: Qt.vector3d(1, 1, 0)
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                sUV_SideMirrorTurnSignal_material
            ]
        }
        Model {
            id: sUV_WindowFrontLeftDoor_low
            x: -0.90024
            z: -0.943066
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowFrontLeftDoor_low.mesh"
            materials: defaultMaterial
        }
    }
    Node {
        id: frontRightDoorRoot
        x: -0.90024
        z: 0.943066
        Model {
            id: sUV_FrontDoorRight_low
            x: 0.90024
            visible: true
            z: -0.943066
            source: "meshes/sUV_FrontDoorRight_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_FrontRightDoorFrame_low_001
            x: 0.90024
            visible: true
            z: -0.943066
            source: "meshes/sUV_FrontRightDoorFrame_low_001.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_FrontRightDoorSideMirror_low
            x: 0.90024
            visible: true
            z: -0.943066
            source: "meshes/sUV_FrontRightDoorSideMirror_low.mesh"
            materials: [
                sideMirrorGlass_material
            ]
        }
        Model {
            id: sUV_FrontRightInnerDoor_low
            x: 0.90024
            z: -0.943066
            source: "meshes/sUV_FrontRightInnerDoor_low.mesh"
            materials: [
                interior_material
            ]
        }
        Model {
            id: sUV_RightTurnSignalLight_low
            x: 0.90024
            visible: false
            z: -0.943066
            source: "meshes/sUV_RightTurnSignalLight_low.mesh"
            materials: [
                sUV_SideMirrorTurnSignal_material
            ]
        }
        Model {
            id: sUV_SidemirrorGlass_low
            x: 0.90024
            visible: true
            z: -0.943066
            source: "meshes/sUV_SidemirrorGlass_low.mesh"

            PrincipledMaterial {
                id: sUV_SideMirrorTurnsignalGlass_material
                depthDrawMode: Material.AlwaysDepthDraw
                baseColor: "#070707"
                roughness: 0.5
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                sUV_SideMirrorTurnsignalGlass_material
            ]
        }
        Model {
            id: sUV_WindowFrontRightDoor_low
            x: 0.90024
            visible: true
            z: -0.943066
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowFrontRightDoor_low.mesh"
            materials: defaultMaterial
        }
    }
    Node {
        id: frunkRoot
        y: 1.21702
        z: 1.02031
        Model {
            id: sUV_Frunk_low
            x: 5.35548e-05
            y: 0.000339746
            z: -0.0190793
            source: "meshes/sUV_Frunk_low.mesh"
            materials: defaultMaterial1
        }
    }
    Model {
        id: outRun_LicensePlateFront
        y: 0.581641
        z: 2.47337
        rotation: Qt.quaternion(-4.07811e-08, -1.38781e-17, 0.999977, -0.00672993)
        scale.y: 1
        scale.z: 1
        source: "meshes/outRun_LicensePlateFront.mesh"

        PrincipledMaterial {
            id: licence_plate_material
            depthDrawMode: Material.AlwaysDepthDraw
            baseColorMap: Texture {
                source: "maps/OutRunLicensePlate.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            roughness: 0.25
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            licence_plate_material
        ]
    }
    Model {
        id: qtEmblemFront
        x: 0.00029
        y: 0.030894
        z: -0.288445
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        scale.y: 1
        scale.z: 1
        source: "meshes/qtEmblemFront.mesh"

        PrincipledMaterial {
            id: qtEmblem_material
            depthDrawMode: Material.AlwaysDepthDraw
            baseColor: "#ff444444"
            metalness: 1
            roughness: 0.198701
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            qtEmblem_material
        ]
    }
    Node {
        id: roofRoot
        y: 1.82247
        visible: true
        z: -0.564106
        Model {
            id: sUV_BackBreakLightr_low
            y: -1.82247
            z: 0.564106
            source: "meshes/sUV_BackBreakLightr_low.mesh"

            PrincipledMaterial {
                id: sUV_BrakeRearLight_material
                depthDrawMode: Material.AlwaysDepthDraw
                baseColor: "#ffcc0100"
                roughness: 0.5
                emissiveFactor: Qt.vector3d(1, 0, 0.0395915)
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                sUV_BrakeRearLight_material
            ]
        }
        Model {
            id: sUV_BackLeftDoorFramesRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_BackLeftDoorFramesRoof_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_BackRightDoorFrames_low
            y: -1.82247
            z: 0.564106
            source: "meshes/sUV_BackRightDoorFrames_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_CeilingFrames_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_CeilingFrames_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_FrontLeftDoorFrameRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_FrontLeftDoorFrameRoof_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_FrontRightDoorFrame_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_FrontRightDoorFrame_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_InteriorLiningRoof_low
            y: -1.82247
            z: 0.564106
            source: "meshes/sUV_InteriorLiningRoof_low.mesh"
            materials: [
                interior_material
            ]
        }
        Model {
            id: sUV_Outside_low
            y: -1.82247
            z: 0.564106
            source: "meshes/sUV_Outside_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_OutsideRoofDoor_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_OutsideRoofDoor_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_RearViewMirror_low
            y: -1.82247
            visible: false
            z: 0.564106
            source: "meshes/sUV_RearViewMirror_low.mesh"

            PrincipledMaterial {
                id: interior_2_material
                normalStrength: 0
                minHeightMapSamples: 0
                maxHeightMapSamples: 0
                specularReflectionMap: dashboard_hdr_dark
                specularTint: 0
                lightProbe: car_Inside_HDRI
                specularAmount: 0.7
                baseColor: "#b1b1b1"
                depthDrawMode: Material.AlwaysDepthDraw
                baseColorMap: Texture {
                    source: "maps/Interior_2_baseColor.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                opacityChannel: Material.A
                metalnessMap: Texture {
                    source: "maps/Interior_2_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                metalnessChannel: Material.B
                roughnessMap: Texture {
                    source: "maps/Interior_2_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                roughnessChannel: Material.G
                metalness: 0.7
                roughness: 0.9
                normalMap: Texture {
                    source: "maps/Interior_2_normal.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                cullMode: Material.NoCulling
                alphaMode: PrincipledMaterial.Opaque

                Texture {
                    id: dashboard_hdr_dark
                    source: "../../../images/dashboard_hdr_dark.hdr"
                    positionV: 0.4
                    positionU: 0.5
                    mappingMode: Texture.LightProbe
                }
            }
            materials: [
                interior_2_material
            ]
        }
        Model {
            id: sUV_SmallWindowFrameRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_SmallWindowFrameRoof_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_TrunkTop_low
            y: -1.82247
            z: 0.564106
            source: "meshes/sUV_TrunkTop_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_TrunkWindowRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_TrunkWindowRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_TrunkWIndowStructureRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_TrunkWIndowStructureRoof_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_WindowBackLeftDoorRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowBackLeftDoorRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_WindowBackRightDoorRoof_low
            y: -1.82247
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowBackRightDoorRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_WindowBackSmallRoof_low
            y: -1.82247
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowBackSmallRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_WindowFrontLeftDoorRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowFrontLeftDoorRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_WindowFrontRightDoorRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindowFrontRightDoorRoof_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_WindshieldRimsRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            source: "meshes/sUV_WindshieldRimsRoof_low.mesh"
            materials: defaultMaterial2
        }
        Model {
            id: sUV_WindshieldRoof_low
            y: -1.82247
            visible: true
            z: 0.564106
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_WindshieldRoof_low.mesh"
            materials: defaultMaterial
        }
    }
    Model {
        id: sUV_AlarmShape_low
        y: 0.995663
        z: 0.459929
        rotation: Qt.quaternion(0.925329, -0.379165, 0, 0)
        source: "meshes/sUV_AlarmShape_low.mesh"

        PrincipledMaterial {
            id: sUV_RedEmergency_material
            baseColor: "#ffff0000"
            roughness: 0.5
            emissiveFactor: Qt.vector3d(1, 0, 0)
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUV_RedEmergency_material
        ]
    }
    Model {
        id: sUV_BackHandrestPillar_low
        x: 0.000289872
        y: 0.251327
        z: -0.0384483
        source: "meshes/sUV_BackHandrestPillar_low.mesh"
        materials: [
            interior_material
        ]
    }
    Model {
        id: sUV_BackLight_low
        source: "meshes/sUV_BackLight_low.mesh"

        PrincipledMaterial {
            id: sUV_WhiteLights_material
            baseColor: "#ffccc495"
            roughness: 0.5
            emissiveFactor: Qt.vector3d(1, 1, 1)
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUV_WhiteLights_material
        ]
    }
    Model {
        id: sUV_BackLightContainers_low
        source: "meshes/sUV_BackLightContainers_low.mesh"

        PrincipledMaterial {
            id: sUV_SmallParts_material
            depthDrawMode: Material.AlwaysDepthDraw
            specularAmount: 0
            lightProbe: outrun_hdri_sandi006
            baseColor: "#000000"
            baseColorMap: Texture {
                source: "maps/SUV_SmallParts_baseColor.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            metalnessMap: Texture {
                source: "maps/SUV_SmallParts_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            metalnessChannel: Material.B
            roughnessMap: Texture {
                source: "maps/SUV_SmallParts_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            roughnessChannel: Material.G
            metalness: 1
            roughness: 0
            normalMap: Texture {
                source: "maps/SUV_SmallParts_normal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUV_SmallParts_material
        ]
    }
    Model {
        id: sUV_BackLowerOrangeLights_low
        source: "meshes/sUV_BackLowerOrangeLights_low.mesh"

        PrincipledMaterial {
            id: sUV_RedLight_material
            baseColor: "#ffff0200"
            roughness: 0.5
            emissiveFactor: Qt.vector3d(1, 0.224967, 0)
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUV_RedLight_material
        ]
    }
    Model {
        id: sUV_BackLowerWhiteLights_low
        source: "meshes/sUV_BackLowerWhiteLights_low.mesh"
        materials: [
            sUV_WhiteLights_material
        ]
    }
    Model {
        id: sUV_CarBottom_low
        source: "meshes/sUV_CarBottom_low.mesh"
        depthBias: 10000
        materials: [
            sUV_SmallParts_material
        ]
    }
    Model {
        id: sUV_CarBottomPlate_low
        source: "meshes/sUV_CarBottomPlate_low.mesh"
        materials: [
            sUV_SmallParts_2_material
        ]
    }
    Model {
        id: sUV_CarPedals_low
        x: 0.4033
        y: 0.567127
        visible: false
        z: 1.0225
        source: "meshes/sUV_CarPedals_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_Carpet_low
        y: -0.01
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        scale.y: 1
        scale.z: 1
        source: "meshes/sUV_Carpet_low.mesh"
        materials: [
            interior_material
        ]
    }
    Model {
        id: sUV_CentralPanel_low
        x: 0.000289872
        y: 0.251327
        z: -0.0384483
        source: "meshes/sUV_CentralPanel_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_ChairLegs_low
        source: "meshes/sUV_ChairLegs_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_Cluster_low
        x: 0.407182
        y: 1.12378
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_Cluster_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_ClusterLCD_low
        x: 0.407182
        y: 1.12378
        visible: true
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_ClusterLCD_low.mesh"

        PrincipledMaterial {
            id: screenMaterial_material
            lighting: PrincipledMaterial.FragmentLighting
            specularReflectionMap: piecenb41
            specularTint: 1
            specularAmount: 1
            roughness: 0
            metalness: 1
            lightProbe: car_Inside_HDRI
            depthDrawMode: Material.AlwaysDepthDraw
            baseColor: "#ffffff"
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        DefaultMaterial {
            id: defaultMaterial
            opacity: 0.4
            depthDrawMode: Material.AlwaysDepthDraw
            specularRoughness: 0.2
            indexOfRefraction: 2.8
            diffuseLightWrap: 0
            translucentFalloff: 0
            specularTint: "#f1ddff"
            specularAmount: 1
            specularReflectionMap: piecenb41
            lightProbe: outrun_hdri_sandi006
            diffuseColor: "#464646"
        }
        materials: [
            screenMaterial_material
        ]
    }
    Model {
        id: sUV_Dashboard_low
        x: 0.449326
        y: 1.19996
        visible: true
        z: 0.835468
        source: "meshes/sUV_Dashboard_low.mesh"
        depthBias: -100000
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_DashboardCentalFan_low
        y: 1.01236
        z: 0.475034
        rotation: Qt.quaternion(0.92388, 0.382683, 0, 0)
        source: "meshes/sUV_DashboardCentalFan_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_DashboardLCD_low
        x: 0.449326
        y: 1.19996
        z: 0.835468
        source: "meshes/sUV_DashboardLCD_low.mesh"
        materials: [
            screenMaterial_material
        ]
    }
    Model {
        id: sUV_FrontGrill_low
        source: "meshes/sUV_FrontGrill_low.mesh"
        depthBias: -50000
        materials: [
            sUV_SmallParts_material
        ]
    }
    Model {
        id: sUV_FrontGrillPlane_low
        visible: true
        source: "meshes/sUV_FrontGrillPlane_low.mesh"

        PrincipledMaterial {
            id: phong_material
            depthDrawMode: Material.AlwaysDepthDraw
            baseColorMap: Texture {
                source: "maps/phong_baseColor-lattice_opacity_hexagonal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            metalnessMap: Texture {
                source: "maps/phong_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            metalnessChannel: Material.B
            roughnessMap: Texture {
                source: "maps/phong_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            roughnessChannel: Material.G
            metalness: 1
            roughness: 1
            normalMap: Texture {
                source: "maps/phong_normal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }
        materials: [
            phong_material
        ]
    }
    Model {
        id: sUV_FrontLightContainers_low
        source: "meshes/sUV_FrontLightContainers_low.mesh"
        materials: [
            sUV_SmallParts_material
        ]
    }
    Model {
        id: sUV_FrontLowerGrillContainer_low
        source: "meshes/sUV_FrontLowerGrillContainer_low.mesh"
        materials: [
            sUV_SmallParts_material
        ]
    }
    Model {
        id: sUV_FrontLowerLightWhite_low
        source: "meshes/sUV_FrontLowerLightWhite_low.mesh"
        materials: [
            sUV_WhiteLights_material
        ]
    }
    Model {
        id: sUV_FrontLowerLightYellow_low
        source: "meshes/sUV_FrontLowerLightYellow_low.mesh"

        PrincipledMaterial {
            id: sUV_TurnSignal_material
            baseColor: "#ffff4c00"
            roughness: 0.5
            emissiveFactor: Qt.vector3d(1, 1, 0)
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUV_TurnSignal_material
        ]
    }
    Model {
        id: sUV_FrunkContainer_low
        source: "meshes/sUV_FrunkContainer_low.mesh"
        materials: [
            interior_material
        ]
    }
    Model {
        id: sUV_GasDoor_low
        source: "meshes/sUV_GasDoor_low.mesh"
        materials: [
            sUV_Outside1_material
        ]
    }
    Model {
        id: sUV_GearStick_low
        y: 0.910152
        z: 0.341992
        rotation: Qt.quaternion(0.996568, -0.0827784, 0, 0)
        source: "meshes/sUV_GearStick_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_Headlights_low
        source: "meshes/sUV_Headlights_low.mesh"

        PrincipledMaterial {
            id: sUVLightBulbs_material
            baseColor: "#ffccc495"
            roughness: 0.5
            emissiveFactor: Qt.vector3d(1, 1, 1)
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            sUVLightBulbs_material
        ]
    }
    Model {
        id: sUV_HeadlightsAdditions_low
        source: "meshes/sUV_HeadlightsAdditions_low.mesh"
        materials: [
            sUV_WhiteLights_material
        ]
    }
    Model {
        id: sUV_HVAC_low
        y: 1.12022
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_HVAC_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_HVACLCD_low
        y: 1.12022
        visible: true
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_HVACLCD_low.mesh"
        scale.z: 1.01
        scale.y: 1.01
        scale.x: 1.01
        materials: [
            screenMaterial_material
        ]
    }
    Model {
        id: sUV_InteriorLining_low
        visible: true
        source: "meshes/sUV_InteriorLining_low.mesh"
        depthBias: -10000
        materials: [
            interior_material
        ]
    }
    Model {
        id: sUV_Lights2_low
        source: "meshes/sUV_Lights2_low.mesh"

        PrincipledMaterial {
            id: sUV_TurnSignalCover_material
            baseColor: "#42cc3b00"
            roughness: 0.5
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }
        materials: [
            sUV_TurnSignalCover_material
        ]
    }
    Model {
        id: sUV_OrangeLightGlass_low
        source: "meshes/sUV_OrangeLightGlass_low.mesh"

        PrincipledMaterial {
            id: sUV_RedLightCover_material
            baseColor: "#56cc0100"
            roughness: 0.5
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }
        materials: [
            sUV_RedLightCover_material
        ]
    }
    Model {
        id: sUV_Outside_low_002
        visible: true
        source: "meshes/sUV_Outside_low_002.mesh"
        depthBias: -10000
        receivesShadows: false
        castsShadows: false
        materials: defaultMaterial1
    }
    Model {
        id: sUV_PassangerScreen_low
        x: -0.466107
        y: 1.12022
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_PassangerScreen_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_PassangerScreenLCD_low
        x: -0.466107
        y: 1.12022
        z: 0.610111
        rotation: Qt.quaternion(0.983255, 0.182236, 0, 0)
        source: "meshes/sUV_PassangerScreenLCD_low.mesh"
        scale.z: 1.01
        scale.y: 1.01
        scale.x: 1.01
        materials: [
            screenMaterial_material
        ]
    }
    Model {
        id: sUV_SidePanel_low
        source: "meshes/sUV_SidePanel_low.mesh"
        materials: [
            sUV_SmallParts_2_material
        ]
    }
    Model {
        id: sUV_SmallWindowFrame_low
        visible: true
        source: "meshes/sUV_SmallWindowFrame_low.mesh"
        materials: defaultMaterial2
    }
    Model {
        id: sUV_SteeringWheel_low
        x: 0.407203
        y: 1.08889
        z: 0.537571
        rotation: Qt.quaternion(-0.415101, -0.572443, 0.572443, -0.415101)
        scale.x: 1
        scale.y: 1
        scale.z: 1
        source: "meshes/sUV_SteeringWheel_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_SteeringWheelPipe_low
        x: 0.430894
        y: 1.19996
        z: 0.835468
        source: "meshes/sUV_SteeringWheelPipe_low.mesh"
        materials: [
            interior_2_material
        ]
    }
    Model {
        id: sUV_WhiteLightGlass_low
        visible: true
        source: "meshes/sUV_WhiteLightGlass_low.mesh"

        PrincipledMaterial {
            id: sUV_LightOuter_material
            baseColor: "#99cccccc"
            metalness: 0.43553
            roughness: 0.210602
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Blend
        }
        materials: [
            sUV_LightOuter_material
        ]
    }
    Model {
        id: sUV_WindowBackSmall_low
        visible: true
        scale.x: 0.00999999
        scale.y: 0.00999999
        scale.z: 0.00999999
        source: "meshes/sUV_WindowBackSmall_low.mesh"
        materials: defaultMaterial
    }
    Model {
        id: sUV_Windshield_low
        visible: true
        scale.x: 0.00999999
        scale.y: 0.00999999
        scale.z: 0.00999999
        source: "meshes/sUV_Windshield_low.mesh"
        materials: defaultMaterial
    }
    Model {
        id: sUV_WindshieldRims_low
        visible: true
        source: "meshes/sUV_WindshieldRims_low.mesh"
        materials: defaultMaterial2
    }
    Node {
        id: tiresRoot
        Model {
            id: newTire_Brake_BackLeft
            x: 0.840591
            y: 0.380427
            z: -1.45145
            rotation: Qt.quaternion(6.05964e-11, 0, 0.7078, 0.706413)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/newTire_Brake_BackLeft.mesh"

            PrincipledMaterial {
                id: new_Tire_low_material
                specularAmount: 0.8
                baseColorMap: Texture {
                    source: "maps/New_Tire_low_baseColor.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                opacityChannel: Material.A
                metalnessMap: Texture {
                    source: "maps/New_Tire_low_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                metalnessChannel: Material.B
                roughnessMap: Texture {
                    source: "maps/New_Tire_low_occlusionRoughnessMetallic.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                roughnessChannel: Material.G
                metalness: 1
                roughness: 1
                normalMap: Texture {
                    source: "maps/New_Tire_low_normal.png"
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
                alphaMode: PrincipledMaterial.Opaque
            }
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: newTire_Brake_BackRight
            x: -0.840591
            y: 0.380427
            z: -1.45145
            rotation: Qt.quaternion(6.05964e-11, 0, 0.7078, 0.706413)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/newTire_Brake_BackRight.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: newTire_Brake_FrontLeft
            x: 0.840591
            y: 0.380427
            z: 1.58522
            rotation: Qt.quaternion(6.05964e-11, 0, 0.7078, 0.706413)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/newTire_Brake_FrontLeft.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: newTire_Brake_FrontRight
            x: -0.840591
            y: 0.380427
            z: 1.58522
            rotation: Qt.quaternion(6.05964e-11, 0, 0.7078, 0.706413)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/newTire_Brake_FrontRight.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: tire_BackLeft
            x: 0.840591
            y: 0.380427
            z: -1.45145
            rotation: Qt.quaternion(0.707107, 0, -0.707107, 0)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/tire_BackLeft.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: tire_BackRight
            x: -0.840591
            y: 0.380427
            z: -1.45145
            rotation: Qt.quaternion(0.707107, 0, -0.707107, 0)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/tire_BackRight.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: tire_FrontLeft
            x: 0.840591
            y: 0.380427
            z: 1.58522
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/tire_FrontLeft.mesh"
            eulerRotation.z: 0
            eulerRotation.y: -90
            eulerRotation.x: 0
            materials: [
                new_Tire_low_material
            ]
        }
        Model {
            id: tire_FrontRight
            x: -0.840591
            y: 0.380427
            z: 1.58522
            rotation: Qt.quaternion(0.707107, 0, -0.707107, 0)
            scale.x: 1.05
            scale.y: 1.05
            scale.z: 1.05
            source: "meshes/tire_FrontRight.mesh"
            materials: [
                new_Tire_low_material
            ]
        }
    }
    Node {
        id: trunkRoot
        y: 1.69401
        z: -1.62095
        Node {
            id: backWindshieldWiperRoot
            x: 8.24999e-05
            y: -0.38918
            z: -0.639201
            rotation: Qt.quaternion(0.932831, 0.360313, 0, 0)
            Model {
                id: sUV_Backwiper_low
                x: -8.24999e-05
                y: 0.553291
                z: 2.55044
                rotation: Qt.quaternion(0.932832, -0.360313, 0, 0)
                source: "meshes/sUV_Backwiper_low.mesh"
                materials: [
                    sUV_SmallParts_2_material
                ]
            }
        }
        Model {
            id: outRun_LicensePlateBack
            y: -0.747878
            z: -0.736549
            rotation: Qt.quaternion(0.982476, 0.186389, 0, 0)
            source: "meshes/outRun_LicensePlateBack.mesh"
            materials: [
                licence_plate_material
            ]
        }
        Model {
            id: qWtEmblemBack
            x: 0.00029
            y: -1.66312
            z: 1.3325
            rotation: Qt.quaternion(-3.09086e-08, -1.25607e-15, 0.707107, 0.707107)
            scale.y: 1
            scale.z: 1
            source: "meshes/qWtEmblemBack.mesh"
            materials: [
                qtEmblem_material
            ]
        }
        Model {
            id: sUV_TrunkDoor_low
            y: -1.69401
            visible: true
            z: 1.62095
            source: "meshes/sUV_TrunkDoor_low.mesh"
            materials: defaultMaterial1
        }
        Model {
            id: sUV_TrunkDoorInterior_low
            y: -1.69401
            z: 1.62095
            source: "meshes/sUV_TrunkDoorInterior_low.mesh"
            materials: [
                sUV_SmallParts_material
            ]
        }
        Model {
            id: sUV_TrunkLight_low
            y: -1.69401
            z: 1.62095
            source: "meshes/sUV_TrunkLight_low.mesh"
            materials: [
                sUV_WhiteLights_material
            ]
        }
        Model {
            id: sUV_TrunkLightGlass_low
            y: -1.69401
            z: 1.62095
            source: "meshes/sUV_TrunkLightGlass_low.mesh"
            materials: [
                sUV_LightOuter_material
            ]
        }
        Model {
            id: sUV_TrunkWindow_low
            y: -1.69401
            visible: true
            z: 1.62095
            scale.x: 0.00999999
            scale.y: 0.00999999
            scale.z: 0.00999999
            source: "meshes/sUV_TrunkWindow_low.mesh"
            materials: defaultMaterial
        }
        Model {
            id: sUV_TrunkWIndowStructure_low
            y: -1.69401
            visible: true
            z: 1.62095
            source: "meshes/sUV_TrunkWIndowStructure_low.mesh"
            materials: defaultMaterial2
        }
    }
    Node {
        id: wiperLeftRoot
        x: 0.597959
        y: 1.19731
        visible: false
        z: 1.06585
        rotation: Qt.quaternion(0.88187, -0.471493, 0, 0)
        scale.y: 1
        scale.z: 1
        Model {
            id: sUV_WipersLeft_low
            x: -0.597959
            y: 0.22138
            visible: false
            z: -1.58764
            rotation: Qt.quaternion(0.88187, 0.471493, 0, 0)
            source: "meshes/sUV_WipersLeft_low.mesh"
            materials: [
                sUV_SmallParts_2_material
            ]
        }
    }
    Node {
        id: wiperRightRoot
        x: 0.00795819
        y: 1.20295
        visible: false
        z: 1.15157
        rotation: Qt.quaternion(0.88187, -0.471493, 0, 0)
        scale.y: 1
        scale.z: 1
        Model {
            id: sUV_WipersRight_low
            x: -0.00795819
            y: 0.289536
            visible: false
            z: -1.63993
            rotation: Qt.quaternion(0.88187, 0.471493, 0, 0)
            source: "meshes/sUV_WipersRight_low.mesh"
            materials: [
                sUV_SmallParts_2_material
            ]
        }
    }
}

/*##^##
Designer {
    D{i:0}D{i:108;locked:true}D{i:116;locked:true}D{i:126;locked:true}D{i:149;locked:true}
D{i:154;locked:true}D{i:155;locked:true}
}
##^##*/
