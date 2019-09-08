import QtQuick 2.0

Rectangle {
    property string attackName;
    property string damageDice;
    property string footNote;
    property int proficiencyBonus;
    property int statBonus;

    height: title.height + thefoot.height
    width: 200
    Row
    {
        id:theRow
        spacing: 4
        Rectangle
        {
            id: title
            property int padding: 6
            height: titleText.paintedHeight + padding*2
            width: titleText.paintedWidth + padding*2

            border.width: 1
            border.color: "grey"
            color: "#F8F8F8"
            Text {
                id: titleText
                text: attackName
                font.pointSize: 13
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: title.left
                anchors.margins: title.padding
            }
        }

        Text {
            id: attackDetails
            text: "+" + (proficiencyBonus + statBonus) + " : " + damageDice + "+" + statBonus
            font.pointSize: 12
            anchors.verticalCenter: title.verticalCenter
        }
    }

    Text {
        id:thefoot
        text: "    *" + footNote
        font.pointSize: 10
        anchors.top: theRow.bottom
    }
}
