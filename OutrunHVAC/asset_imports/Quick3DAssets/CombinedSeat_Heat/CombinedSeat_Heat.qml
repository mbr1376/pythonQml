import QtQuick
import QtQuick3D
Node {
    id: empty
    scale.x: 100
    scale.y: 100
    scale.z: 100
    Model {
        id: combinedSeat_Heat
        y: -0.0199864
        z: 0.405524
        source: "meshes/combinedSeat_Heat.mesh"

        PrincipledMaterial {
            id: heater_material
            lighting: PrincipledMaterial.NoLighting
            baseColorMap: Texture {
                source: "maps/Heater_Color.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            opacityChannel: Material.A
            roughness: 0.5
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
        materials: [
            heater_material
        ]
    }
}
