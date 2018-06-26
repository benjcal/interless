import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Hello World")

    Home {
        id: homeView
        anchors.fill: parent
    }
}
