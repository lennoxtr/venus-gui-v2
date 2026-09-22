import QtQuick
import QtQuick.Controls
import Victron.VenusOS

Popup {
    id: root
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    anchors.leftMargin: Theme.geometry_page_content_horizontalMargin
    anchors.rightMargin: Theme.geometry_page_content_horizontalMargin
    anchors.topMargin: Theme.geometry_statusBar_height + 20
    anchors.bottomMargin: 2 * Theme.geometry_toastNotification_highlightWidth
                + Theme.geometry_toastNotification_verticalMargin

    modal: false
    closePolicy: Popup.NoAutoClose

    background: Rectangle {
        //width: 200
        //height: 100
        color: "royalblue"
        radius: Theme.geometry_toastNotification_radius
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