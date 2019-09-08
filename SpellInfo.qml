import QtQuick 2.13
import QtQuick.Layouts 1.13

Rectangle {
    id: root
    property string spellName;
    property string details;
    property bool expanded: false;

    property alias statusTracker: status;

    color: "transparent"
    width: expanded ? 400 : spellTitle.width
    height: expanded ? spellTitle.height + detailsBlob.height + 8 : spellTitle.height

    Behavior on height { PropertyAnimation { duration: 500 } }
    Behavior on width { PropertyAnimation { duration: 500 } }
    MouseArea
    {
        anchors.fill: parent
        onClicked: { expanded = !expanded }
    }

    Rectangle
    {
        id: spellTitle
        property int padding: 6
        height: titleText.paintedHeight + padding*2
        width: titleText.paintedWidth + padding*2

        border.width: 1
        border.color: "grey"
        color: "#F8F8F8"
        Text {
            id: titleText
            text: spellName
            font.pointSize: 13
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: spellTitle.left
            anchors.margins: spellTitle.padding
        }
    }

    Rectangle {
        id: status
        height: 30
        width: 30
        color: "transparent"
        anchors {
            left: spellTitle.right
            verticalCenter: spellTitle.verticalCenter
            margins: 6
        }
    }

    Rectangle
    {
        id: detailsBackground
        width: detailsBlob.width
        height: detailsBlob.height

        color: "#F5F5F5"
        border.width: 1
        border.color: "#888888"
        visible: (opacity != 0)
        opacity: root.expanded ? 1 : 0

        anchors {
            left: parent.left
            right: parent.right
            top: spellTitle.bottom
        }

        Text {
            id: detailsBlob
            visible: (opacity != 0)
            opacity: root.expanded ? 1 : 0
            width: root.width
            padding: 8

            text: details
            wrapMode: Text.WordWrap
            textFormat: Text.StyledText

            font.pointSize: 10

            Behavior on opacity { PropertyAnimation { duration: 500 } }
        }
    }
}
