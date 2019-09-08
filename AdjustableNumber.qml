import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    id: root
    property int minNumber;
    property int maxNumber;
    property int currentNumber: 15;
    property int size: 30

    color: (currentNumber == 0) ? "light grey" : "gold"
    height: size
    width: size
    radius: 4
    border.width: 1
    z: 1
    Text {
        anchors.centerIn: parent
        text: root.currentNumber
        font.pointSize: 14
    }

    // MouseArea
    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            adjustor.visible = !adjustor.visible;
            dial.value = root.currentNumber;
        }
    }

    Rectangle
    {
        id: adjustor
        visible: false
        anchors.top: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        opacity: 0.8
        height: 250
        width: 250
        border.width: 1
        z: 10

        Dial
        {
            id: dial
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 4

            value: 0
            stepSize: 1
            snapMode: Dial.SnapAlways
            from: minNumber
            to: maxNumber

            Text {
                anchors.centerIn: parent
                text: Math.floor(dial.value + 0.1)
                font.pointSize: 14
            }
        }
        Rectangle {

            anchors.horizontalCenter: adjustor.horizontalCenter
            anchors.bottom: adjustor.bottom
            anchors.bottomMargin: 4

            height: 50
            width: 90
            color: "dark green"

            z: 2
            Text {
                anchors.centerIn: parent
                horizontalAlignment: Text.Center
                font.pointSize: 16
                text: "Apply"
                color:"white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.currentNumber = Math.floor(dial.value + 0.1);
                    adjustor.visible = !adjustor.visible
                }
            }
        }
    }
}
