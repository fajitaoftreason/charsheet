import QtQuick 2.13
import QtQuick.Layouts 1.13

Rectangle {
    id: root
    property string spellName;
    property string details;
    property bool expanded: false;
    property int minWideness: spellTitle.width;
    property int maxWideness: 400;

    property alias statusTracker: status;

    color: "transparent"
    width: detailsBlob.width
    height: spellTitle.height + detailsBlob.height;
    state: expanded ? "Expanded" : "Collapsed"
    states: [
        State {
            name: "Collapsed"
            PropertyChanges { target: detailsBlob; width: minWideness; height: 0; opacity: 0 }
            PropertyChanges { target: detailsBackground; opacity: 0 }
        },
        State {
            name: "Expanded"
            PropertyChanges { target: detailsBlob; width: maxWideness; height: paintedHeight + padding*2; opacity: 1 }
            PropertyChanges { target: detailsBackground; opacity: 1 }
        }
    ]

    transitions:[
        Transition {
            from: "Collapsed"
            to: "Expanded"
            reversible: true
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation { target: detailsBlob; properties: "width,height"; duration: 400 }
                    PropertyAnimation { target: detailsBackground; property: "opacity"; duration: 300 }
                }
                PropertyAnimation { target: detailsBlob; properties: "opacity"; duration: 150 }
            }
        }
    ]

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
        opacity: 0

        anchors {
            left: parent.left
            right: parent.right
            top: spellTitle.bottom
        }

        Text {
            id: detailsBlob
            visible: (opacity != 0)
            opacity: 0
            width: minWideness
            height: 0
            padding: 8

            text: details
            wrapMode: Text.WordWrap
            textFormat: Text.StyledText

            font.pointSize: 10
        }
    }
}
