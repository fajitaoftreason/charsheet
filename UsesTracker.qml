import QtQuick 2.0

Rectangle {
    id: root
    property int uses;
    property string titleText;
    property string iconText;
    property string availableColor: "#98FB98"

    width: 200
    height: title.height + useRectangles.height + 6

    Rectangle
    {
        id: title
        height: 40
        width: parent.width
        border.width: 1
        color: "light grey"
        Text {
            text: titleText
            font.pointSize: 13
            font.bold: true
            anchors.centerIn: parent
            horizontalAlignment: Text.Center
        }
    }

    Grid
    {
        id: useRectangles
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: title.bottom
        anchors.topMargin: 6
        columns: 3
        rows: Math.ceil(uses/3)

        spacing: 2
        Repeater {
            model: uses
            UsedBox {
                availableColor: root.availableColor
                optionalText: iconText
            }
        }
    }
}
