import QtQuick
import QtQuick3D
import Quick3DAssets.CombinedSeat 1.0
import Quick3DAssets.CombinedSeat_Heat 1.0
Rectangle {
    id: newSeat_baseColor
    property bool heaterOnTex: false
    color: "#000000"
    Image {
        id: on
        opacity: 1
        source: "../../../images/CombinedSeat_Heater.png"
    }    Image {
        id: off
        opacity: 1
        source: "../../../images/NewSeat_baseColor.png"
    }
    states: [
        State {
            name: "on"
            when: heaterOnTex

            PropertyChanges {
                target: off
                opacity: 0
            }

            PropertyChanges {
                target: on
                opacity: 1
            }
        },
        State {
            name: "off"
            when: !heaterOnTex

            PropertyChanges {
                target: off
                opacity: 1
            }

            PropertyChanges {
                target: on
                opacity: 0
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: off
                        property: "opacity"
                        duration: 500
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]

}


/*##^##
Designer {
    D{i:0;autoSize:true;height:0;width:0}
}
##^##*/
