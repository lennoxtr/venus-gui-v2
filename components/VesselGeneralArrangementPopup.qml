import QtQuick
import QtQuick.Controls
import Victron.VenusOS

Popup {
    id: root

    readonly property real sideSpace: Theme.geometry_page_content_horizontalMargin
    readonly property real topSpace: Theme.geometry_statusBar_height
    readonly property real bottomSpace: 2 * Theme.geometry_toastNotification_highlightWidth
                                        + 0.4 * Theme.geometry_toastNotification_verticalMargin

    // No leftMargin/rightMargin/topMargin/bottomMargin: they shrink the popup
    x: sideSpace
    y: topSpace
    width: parent ? parent.width - 2 * sideSpace : 0
    height: parent ? parent.height - topSpace - bottomSpace : 0


    modal: false
    closePolicy: Popup.NoAutoClose

    background: Rectangle {
        //width: 200
        //height: 100
        color: "white"
        border.color: "black"
        border.width: 3
        radius: Theme.geometry_toastNotification_radius * 4
    }

    //Image {
    //    id: vesselGeneralArrangement

    //    anchors.centerIn: parent

    //    width: 700
    //    height: 400

    //    source: "qrc:/images/vessel.svg"

    //    fillMode: Image.PreserveAspectFit
    //} 
}