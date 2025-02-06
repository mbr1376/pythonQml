import QtQuick
import QtQuick3D
Node {
    id: sUVRoot
    Model {
        id: sUV_Dashboard_low_002
        source: "meshes/sUV_Dashboard_low_002.mesh"
        scale.z: 1
        scale.y: 1
        scale.x: 1

        PrincipledMaterial {
            id: knob_material
            specularTint: 1
            roughness: 0.9
            specularReflectionMap: piecenb41
            baseColor: "#242424"
            specularAmount: 0.8
            lightProbe: dashboard_hdr
            metalness: 0.4
            normalMap: Texture {
                source: "maps/SUV_Knobs_Knob_Normal.png"
                generateMipmaps: true
                mipFilter: Texture.Linear
            }
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque

            Texture {
                id: piecenb41
                source: "../../../images/outrun_hdri_sandi006.hdr"
                mappingMode: Texture.LightProbe
            }
        }

        PrincipledMaterial {
            id: screen_material
            specularReflectionMap: piecenb41
            specularTint: 0.5
            specularAmount: 0.1
            roughness: 0.3
            metalness: 0.3
            lightProbe: dashboard_hdr
            baseColor: "#080808"
            cullMode: Material.NoCulling
            alphaMode: PrincipledMaterial.Opaque

            Texture {
                id: dashboard_hdr
                source: "../../../images/Car_Inside_HDRI.hdr"
                positionV: 3.2
                positionU: 2.9
                scaleV: 0.5
                scaleU: 0.5
                mappingMode: Texture.LightProbe
            }
        }
        materials: [
            knob_material,
            screen_material
        ]
    }
}
