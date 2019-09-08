import QtQuick 2.0

Rectangle {
    id: root
    property int moveSpeed: 0
    property int size: 35
    color: "light grey"
    height: size
    width: 110
    radius: 4
    border.width: 1


    Text {
        anchors.centerIn: parent
        text: root.moveSpeed + "ft Speed"
        font.pointSize: 14
    }
}

