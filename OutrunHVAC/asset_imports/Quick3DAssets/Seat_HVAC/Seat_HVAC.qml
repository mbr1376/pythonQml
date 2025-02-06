import QtQuick
import QtQuick3D
import Quick3DAssets.CombinedSeat 1.0
import Quick3DAssets.CombinedSeat_Heat 1.0
Node {
    id: rOOT
    scale.z: 100
    scale.y: 100
    scale.x: 100
    property bool heaterOn: false
    property real recline: 2
    Model {
        id: seat_base_FrontRight_001
        x: 0
        y: -0.053
        z: 0.60852
        rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
        scale.y: 1
        scale.z: 1
        source: "../CombinedSeat/meshes/combinedSeat_Base.mesh"

        PrincipledMaterial {
            id: newSeat_material
            metalness: 1
            emissiveFactor.z: 0
            emissiveFactor.y: 0
            emissiveFactor.x: 0
            emissiveMap: combinedSeat_Heater
            roughnessMap: newSeat_occlusionRoughnessMetallic
            occlusionMap: newSeat_occlusionRoughnessMetallic
            metalnessMap: newSeat_occlusionRoughnessMetallic
            normalMap: newSeat_normal
            baseColorMap: newSeat_baseColor1
            depthDrawMode: Material.AlwaysDepthDraw
            occlusionAmount: 1
            baseColor: "#ffffff"
            specularTint: 0
            specularAmount: 1
            opacityChannel: Material.A
            roughnessChannel: Material.G
            roughness: 1
            cullMode: Material.BackFaceCulling
            alphaMode: PrincipledMaterial.Opaque

            MyNewSeat_baseColor {
                id: newSeat_baseColor
                color: "#ffffff"
                heaterOnTex: heaterOn
            }

            Texture {
                id: newSeat_normal
                source: "../../../images/NewSeat_normal.png"
            }

            Texture {
                id: newSeat_occlusionRoughnessMetallic
                source: "../../../images/NewSeat_occlusionRoughnessMetallic.png"
            }

            Texture {
                id: newSeat_baseColor1
                source: "../../../images/CombinedSeat_Heater.png"
                sourceItem: newSeat_baseColor
            }

            Texture {
                id: combinedSeat_Heater
                source: "../../../images/CombinedSeat_Heater.png"
            }
        }
        materials: [
            newSeat_material
        ]
    }
    Model {
        id: seat_back_FrontRight_001
        source: "../CombinedSeat/meshes/combinedSeat_Back.mesh"
        eulerRotation.x: 90-(recline*15)+15
        eulerRotation.z: 0
        eulerRotation.y: 0
        materials: [
            newSeat_material
        ]
    }



    Model {
        id: sphere
        source: "#Sphere"
        materials: sphereMaterial
        DefaultMaterial {
            id: sphereMaterial
            diffuseColor: "#4aee45"
        }
    }

    CombinedSeat_Heat {
        id: combinedSeat_Heat
        x: -0
        y: -0.032
        opacity: 0
        z: 0.20328
        scale.z: 1
        scale.y: 1
        scale.x: 1
    }

    states: [
        State {
            name: "heaterOff"
            when: !heaterOn

        },
        State {
            name: "heaterOn"
            when: heaterOn

            PropertyChanges {
                target: newSeat_material
                emissiveFactor.z: 1
                emissiveFactor.y: 1
                emissiveFactor.x: 1
            }

            PropertyChanges {
                target: combinedSeat_Heat
                opacity: 1
            }

        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {

                PropertyAnimation {
                    target: newSeat_material
                    property: "emissiveFactor.x"
                    duration: 500
                }
                PropertyAnimation {
                    target: newSeat_material
                    property: "emissiveFactor.y"
                    duration: 500
                }
                PropertyAnimation {
                    target: newSeat_material
                    property: "emissiveFactor.z"
                    duration: 500
                }
                PropertyAnimation {
                    target: combinedSeat_Heat
                    property: "opacity"
                    duration: 500
                }
            }
            to: "*"
            from: "*"
        }
    ]

}


