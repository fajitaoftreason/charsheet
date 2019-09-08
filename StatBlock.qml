import QtQuick 2.0

Rectangle {
    id: root
    property string name;
    property int value;
    property int prociciencyBonus;
    property alias skills: proficientSkillsList;
    property bool expanded: false;

    MouseArea
    {
        anchors.fill:parent
        onClicked: {expanded = !expanded}
    }

    height: 100
    width: proficientSkills.width + statSquare.width

    Rectangle { id: statSquare
        height: 100
        width: 100
        border.width: 1
        color: "light blue"
        Column {
            id: coreStats
            anchors.fill: parent
            anchors.topMargin: 10
            spacing: 10
            Text {
                text: name
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.Center
            }
            Text {
                text: getBonusString();
                font.pointSize: 14
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.Center
            }
            Text {
                text: value
                color: "#707070"
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.Center
            }
        }

    }
    Rectangle { id: proficientSkills
        anchors.left: statSquare.right
        anchors.leftMargin: 0
        border.width: 1
        border.color: "light grey"
        height: 100
        width: 0
        state: expanded ? "Expanded" : "Collapsed"
        Column {
            anchors.fill: parent
            anchors.margins: 4
            spacing: 2

            Text {
                text: "Extra +" + root.prociciencyBonus + " to:"
                font.pointSize: 13
            }

            Repeater {
                id: proficientSkillsList
                Text {
                    text: modelData
                    color: "dark green"
                    font.pointSize: 11
                }
            }
        }

        states: [
            State {
                name: "Collapsed"
                PropertyChanges { target: proficientSkills; width: 0; opacity: 0.0;}
            },
            State {
                name: "Expanded"
                PropertyChanges { target: proficientSkills; width: 130; opacity: 1.0;}
            }
        ]

        transitions: [
               Transition {
                   PropertyAnimation { properties: "width,opacity"; target: proficientSkills; duration: 500}
               }
           ]

    }

    function getBonus()
    {
        return Math.floor((value - 10)/2);
    }

    function getBonusString()
    {
        if (value < 10)
        {
            return getBonus();
        }
        else
        {
            return "+" + getBonus();
        }
    }
}
