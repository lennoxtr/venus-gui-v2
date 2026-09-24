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
        "com.victronenergy.digitalinput.input_1":   { x: 0.65, y: 0.75},
        "com.victronenergy.digitalinput.input_2":  { x: 0.6, y: 0.6},
        "com.victronenergy.digitalinput.input_3":     { x: 0.4, y: 0.5},
        "com.victronenergy.digitalinput.input_4":     { x: 0.4, y: 0.4}
    })

    readonly property var acknowledgeButtonLocationsScaling: ({
        "com.victronenergy.digitalinput.input_1":   { x: 0.55, y: 0.62},
        "com.victronenergy.digitalinput.input_2":  { x: 0.28, y: 0.60},
        "com.victronenergy.digitalinput.input_3":     { x: 0.72, y: 0.66},
        "com.victronenergy.digitalinput.input_4":     { x: 0.88, y: 0.88}
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
            fillMode: Image.PreserveAspectFit
            opacity: 0.6
        }
    }

    Repeater {
        model: [
            "com.victronenergy.digitalinput.input_1",
            "com.victronenergy.digitalinput.input_2",
            "com.victronenergy.digitalinput.input_3",
            "com.victronenergy.digitalinput.input_4"
        ]
 

        delegate: Item {
            id: floatSwitchIndicator

            anchors.fill: background
            readonly property var imgCoordsScaling: root.floatSwitchLocationsScaling[modelData] || { x: 0, y: 0 }
            readonly property var btnCoordsScaling: root.acknowledgeButtonLocationsScaling[modelData] || { x: 0, y: 0 }

            Image {
                id: floatswitchimage
                source: "qrc:/images/float_switch.png"
                width: 0.06 *  root.width
                height: floatswitchimage.width
                fillMode: Image.PreserveAspectFit
                mipmap: true

                x: imgCoordsScaling.x * background.width - width/2
                y: imgCoordsScaling.y * background.height - height/2

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log("Float Switch ", modelData, " Clicked")
                        highlightTimer.restart()
                    }
                }
            }

            Button {
                id: floatSwitchButton

                width: implicitWidth
                height: implicitHeight
                
                leftInset: Theme.geometry_statusBar_spacing / 2
		        rightInset: Theme.geometry_statusBar_spacing / 2
		        topInset: Theme.geometry_statusBar_spacing
		        bottomInset: Theme.geometry_statusBar_spacing

	            leftPadding: leftInset + Theme.geometry_silenceAlarmButton_horizontalPadding + 10
	            rightPadding: rightInset + Theme.geometry_silenceAlarmButton_horizontalPadding
	            defaultBackgroundHeight: Theme.geometry_notificationsPage_snoozeButton_height
	            
                flat: false
	            backgroundColor: Theme.color_critical_background
	            borderWidth: 0
	            icon.source: "qrc:/images/icon_alarm_snooze_24.svg"

                x: btnCoordsScaling.x * background.width - width/2
                y: btnCoordsScaling.y * background.height - height/2
	            
                // TODO: change text
                text: qsTr("Fl Switch ENGINE AFT")

	            // ensure highlight border can be seen against critical backgroundColor
	            KeyNavigationHighlight.margins: -(4 * Theme.geometry_button_border_width)
                onClicked: {
                        console.log("Button Clicked")
                        highlightTimer.restart()
                    }

            }

            Timer {
                id: highlightTimer
                interval: 2000
                repeat: false
            }
        }
    }
}