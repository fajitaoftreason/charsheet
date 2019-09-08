import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 1.1

ApplicationWindow {
    id: window
    visible: true
    visibility: "FullScreen"

    width: 940
    height: 940
    title: qsTr("Mogak")

//    Skaamos {
    Mogak {
        anchors.fill: parent
        anchors.topMargin: 20
    }

    Button {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10
        text: "toggle fullscreen"
        onClicked:
        {
            switch (window.visibility)
            {
            case Window.Windowed:
                window.visibility = Window.FullScreen;
                break;
            case Window.FullScreen:
                window.visibility = Window.Windowed;
                break;
            }
        }
    }
}
