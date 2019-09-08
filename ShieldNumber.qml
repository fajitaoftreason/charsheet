import QtQuick 2.0

Rectangle {
    id: root
    property int armorClass: 0
    property int size: 55

    color: "light grey"
    height: size
    width: size
    radius: size/2
    border.width: 1

    Text {
        anchors.centerIn: parent
        text: root.armorClass
        font.pointSize: 14
    }
}
