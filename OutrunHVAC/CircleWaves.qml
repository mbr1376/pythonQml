import QtQuick

Item {
    id: rootItem

    // Enable this to animate iTime property
    property bool timeRunning: false
    // When timeRunning is false, this can be used to control iTime manually
    property real animatedTime: 0

    property real showState: 0

    NumberAnimation on animatedTime {
        from: 0
        to: 3600
        duration: 3600 * 1000
        loops: Animation.Infinite
        running: timeRunning
    }

    ShaderEffect {
        property real iTime: animatedTime
        readonly property real showState: parent.showState

        vertexShader: 'CircleWaves.vert.qsb'
        fragmentShader: 'CircleWaves.frag.qsb'
        width: parent.width
        height: parent.height
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
