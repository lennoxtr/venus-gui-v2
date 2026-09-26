import QtQuick
import QtQuick.Controls
import Victron.VenusOS

Item {
    id: root
    property string floatswitchserviceString
    property string floatswitchdeviceName

    required property Item fillTarget
    required property string imgsource
    required property var imgCoordsScaling
    required property var btnCoordsScaling

    required property real img_width
    
    anchors.fill: fillTarget

    Rectangle {
        id: buttonConnector

        // Circle center
        readonly property real cx: floatSwitchImage.x + floatSwitchImage.width / 2
        readonly property real cy: floatSwitchImage.y + floatSwitchImage.height / 2
        readonly property real centerOfButton_y: floatSwitchButton.y + floatSwitchButton.height / 2

        width: 5
        x: cx  - width / 2
        y: Math.min(cy, centerOfButton_y)
        height: Math.abs(centerOfButton_y - cy)
        color: Theme.color_critical_background
        antialiasing: true
    }

    Image {
        id: floatSwitchImage
        source: root.imgsource

        width: img_width
        height: floatSwitchImage.width
        x: root.imgCoordsScaling.x * root.width - width/2
        y: root.imgCoordsScaling.y * root.height - height/2
        mipmap: true

        MouseArea {
            anchors.fill: parent

            onClicked: {
                console.log("Float Switch ", root.floatswitchdeviceName, " Clicked")
            }
        }

        Rectangle {
            id: pulse
            z: -2                                   
            anchors.centerIn: parent
            width: circle.width                    
            height: width
            radius: width / 2
            color: "transparent"
            border.color: Theme.color_critical_background
            border.width: 3
            antialiasing: true

            ParallelAnimation {
                running: pulse.visible
                loops: Animation.Infinite

                NumberAnimation {
                    target: pulse; property: "scale"
                    from: 1.0; to: 1.8
                    duration: 800
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    target: pulse; property: "opacity"
                    from: 0.9; to: 0.0
                    duration: 800
                    easing.type: Easing.OutCubic
                }
            }
        }


        Rectangle {
            id: circle
            anchors.centerIn: parent
            width: root.img_width * 1.45
            height: width
            radius: width / 2
            color: "white"
            z: -1

            border.color: "red"
            border.width: 3
        }
    }

    Button {
        id: floatSwitchButton

        width: implicitWidth
        height: implicitHeight
        radius: Theme.geometry_toastNotification_radius * 2
                
        //leftInset: Theme.geometry_statusBar_spacing / 2
		//rightInset: Theme.geometry_statusBar_spacing / 2
		topInset: Theme.geometry_statusBar_spacing
		bottomInset: Theme.geometry_statusBar_spacing

	    leftPadding: Theme.geometry_silenceAlarmButton_horizontalPadding
	    //rightPadding: Theme.geometry_silenceAlarmButton_horizontalPadding
	    defaultBackgroundHeight: Theme.geometry_notificationsPage_snoozeButton_height
	            
        flat: false
	    backgroundColor: Theme.color_critical_background
	    borderWidth: 0
	    icon.source: "qrc:/images/icon_alarm_snooze_24.svg"

        x: root.btnCoordsScaling.x * root.width - width/2
        y: root.btnCoordsScaling.y * root.height - height/2
	            
        text: root.floatswitchdeviceName

	    // ensure highlight border can be seen against critical backgroundColor
	    KeyNavigationHighlight.margins: -(4 * Theme.geometry_button_border_width)
        onClicked: {
            console.log("Button Clicked")
        }
    }
}