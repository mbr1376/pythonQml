import QtQuick
import QtQuick3D
Node {
    id: empty
    scale.x: 100
    scale.y: 100
    scale.z: 100
    Model {
        id: combinedSeat_Back
        y: 0.0204493
        z: -0.182291
        rotation: Qt.quaternion(0.798201, 0.602391, 0, 0)
        source: "meshes/combinedSeat_Back.mesh"

        PrincipledMaterial {
            id: newSeat_001_material
            baseColorMap: Texture {
                source: "maps/NewSeat_baseColor.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            metalnessMap: Texture {
                source: "maps/NewSeat_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            metalnessChannel: Material.B
            roughnessMap: Texture {
                source: "maps/NewSeat_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            roughnessChannel: Material.G
            metalness: 1
            roughness: 1
            normalMap: Texture {
                source: "maps/NewSeat_normal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            occlusionMap: Texture {
                source: "maps/NewSeat_occlusionRoughnessMetallic.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            occlusionChannel: Material.R
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            newSeat_001_material
        ]
    }
    Model {
        id: combinedSeat_Base
        y: -0.0199864
        z: 0.405524
        rotation: Qt.quaternion(0.711984, 0.702196, 0, 0)
        source: "meshes/combinedSeat_Base.mesh"
        materials: [
            newSeat_001_material
        ]
    }
}
