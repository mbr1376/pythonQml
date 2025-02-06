pragma Singleton
import QtQml

QtObject {

    enum FanDirection {
        FACE_DIRECTION = 1,
        FLOOR_DIRECTION = 2,
        DEFROST_DIRECTION = 4,
        FAN_DIRECTION_MASK = 7
    }

    property real fanSpeed: 2
    property int heaterOnDriver: 0
    property int heaterOnPassenger: 0
    property bool acOn: true
    property bool autoOn: false
    property bool dualOn: false    
    property bool defrostRear: false
    property bool defrostFront: false
    property bool recircOn: false

    property real tempDriverSide: 25
    property real tempPassengerSide: 25

    property int fanDirectionPassenger: 0
    property int fanDirectionDriver: 0
}
