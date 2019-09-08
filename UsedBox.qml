import QtQuick 2.0

Rectangle {
    property bool used: false
    property string optionalText: ""
    property string availableColor: "#98FB98"
    property int size: 60

    id: root
    color: used ? "#F8F8F8" : availableColor
    width: size
    height: size
    border.width: 1
    radius: 4

    Behavior on color { ColorAnimation { duration: 200 } }
    MouseArea {
        anchors.fill: parent
        onClicked: used = !used
    }

    Text {
        anchors.centerIn: parent
        text: used ? "X" : optionalText
        font.pointSize: 12
    }

}
