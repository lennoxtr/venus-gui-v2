import QtQuick
import QtQuick.Controls
import Victron.VenusOS

Popup {
    id: root

    property bool animationEnabled: Global.animationEnabled

    readonly property real sideSpace: Theme.geometry_page_content_horizontalMargin
    readonly property real topSpace: Theme.geometry_statusBar_height
    readonly property real bottomSpace: Theme.geometry_toastNotification_highlightWidth
                                        + 4 * Theme.geometry_toastNotification_verticalMargin

    x: sideSpace
    y: topSpace
    width: parent ? parent.width - 2 * sideSpace : 0
    height: parent ? parent.height - topSpace - bottomSpace : 0

    modal: false
    closePolicy: Popup.NoAutoClose


    readonly property var floatSwitchLocationsScaling: ({
        "com.victronenergy.digitalinput.input_1":   { x: 0.67, y: 0.65},
        "com.victronenergy.digitalinput.input_2":  { x: 0.44, y: 0.65},
        "com.victronenergy.digitalinput.input_3":     { x: 0.2, y: 0.63},
        "com.victronenergy.digitalinput.input_4":     { x: 0.12, y: 0.65}
    })

    readonly property var acknowledgeButtonLocationsScaling: ({
        "com.victronenergy.digitalinput.input_1":   { x: 0.75, y: 0.95},
        "com.victronenergy.digitalinput.input_2":  { x: 0.55, y: 0.3},
        "com.victronenergy.digitalinput.input_3":     { x: 0.28, y: 0.95},
        "com.victronenergy.digitalinput.input_4":     { x: 0.2, y: 0.3}
    })

    background: Rectangle {
        color: "white"
        border.color: "black"
        border.width: 3
        radius: Theme.geometry_toastNotification_radius * 3
        layer.enabled: true
    }

    contentItem: Item {
        Image {
            id: background
            anchors.fill: parent
            source: "qrc:/images/vessel_ga.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.5
            mipmap: true
        }
    }

    Repeater {
        model: [
            "com.victronenergy.digitalinput.input_1",
            "com.victronenergy.digitalinput.input_2",
            "com.victronenergy.digitalinput.input_3",
            "com.victronenergy.digitalinput.input_4"
        ]
 

        delegate: FloatSwitchIcon {
            required property string modelData
            fillTarget: background
            imgsource: "qrc:/images/float_switch.png"
            imgCoordsScaling: root.floatSwitchLocationsScaling[modelData] || ({ x: 0, y: 0 })
            btnCoordsScaling: root.acknowledgeButtonLocationsScaling[modelData] || ({ x: 0, y: 0 })

            service: modelData
            img_width: 0.05 *  root.width
        }
    }
}