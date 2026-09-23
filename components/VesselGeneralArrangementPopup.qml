import QtQuick
import QtQuick.Controls
import Victron.VenusOS

Popup {
    id: root

    anchors.centerIn: parent

    width: 800
    height: 400

    modal: false
    closePolicy: Popup.NoAutoClose

    background: Rectangle {
        //width: 200
        //height: 100
        color: "royalblue"
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