import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    id: root
    property int maxHP;
    property int currentHP;
    property int maxPossibleDamage: -currentHP
    property int maxPossibleHeal: maxHP - currentHP

    Component.onCompleted: currentHP = maxHP

    border.width: 1
    border.color: "black"
    color: "light grey"

    // HP Bar Red
    Rectangle {
        id: redHP
        anchors {
            margins: 1
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width * (currentHP/maxHP)
        color: "dark red"

        Behavior on width { PropertyAnimation { duration: 500 } }

    }

    Text {
        anchors.verticalCenter: redHP.verticalCenter

        property var threshHold: 0.15

        // centered in Red HP
        anchors.horizontalCenter: (currentHP/maxHP) > threshHold ? redHP.horizontalCenter : undefined

        // Beside Red HP
        anchors.left: (currentHP/maxHP) > threshHold ? undefined : redHP.right
        anchors.leftMargin: (currentHP/maxHP) > threshHold ? 0 : 4

        color: (currentHP/maxHP) > threshHold ? "white" : "black"
        text: currentHP + " / " + maxHP
        horizontalAlignment: (currentHP/maxHP) > threshHold ? Text.Center : Text.Left
        font.pointSize: 16
        font.bold: true
    }

    // MouseArea
    MouseArea
    {
        anchors.fill: parent
        onClicked: {hpAdjustor.visible = !hpAdjustor.visible;}
    }

    Rectangle
    {
        id: hpAdjustor
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
            from: maxPossibleDamage
            to: maxPossibleHeal

            Text {
                anchors.centerIn: parent
                text: Math.floor(dial.value + 0.1)
                font.pointSize: 14
                color: {
                    if (dial.value > 0)
                        return "green"
                    if (dial.value < 0)
                        return "red"
                    return "black"
                }
            }
        }

        Rectangle {
            anchors.horizontalCenter: hpAdjustor.horizontalCenter
            anchors.bottom: hpAdjustor.bottom
            anchors.bottomMargin: 4

            opacity: (Math.floor(dial.value + 0.1) == 0) ? 0.0 : 1
            height: 50
            width: 90
            color: (dial.value > 0) ? "dark green" : "dark red"

            Behavior on color { ColorAnimation { duration: 500 } }
            Behavior on opacity { PropertyAnimation { duration: 500 } }

            z: 2
            Text {
                anchors.centerIn: parent
                horizontalAlignment: Text.Center
                font.pointSize: 16
                text: (dial.value > 0) ? "Heal" : "Hurt"
                color:"white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.currentHP += Math.floor(dial.value + 0.1);
                    hpAdjustor.visible = !hpAdjustor.visible
                    dial.value = 0;
                }
            }
        }
    }
}
