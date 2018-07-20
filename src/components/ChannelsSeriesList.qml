import QtQuick 2.9
import "../js/lib.js" as JsLib

FocusScope {
    id: root

    anchors.fill: parent


    // HANDLE KEYS
    Keys.onPressed: {
        if (event.key === Qt.Key_Right) {
            JsLib.nextFocus(channelsList, list2, list3)
        }
        if (event.key === Qt.Key_Left) {
            JsLib.prevFocus(channelsList, list2, list3)
        }
    }



    // TOP LOGO
    Image {
        id: logo
        source: "qrc:/images/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        width: 600
        y: 60
        fillMode: Image.PreserveAspectFit
    }


    Row {
        id: row
        spacing: 50

        anchors {
            top: logo.bottom
            bottom: root.bottom
            left: root.left
            right: root.right
        }


        ListView {
            id: channelsList
            width: 600
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            focus: true
            model: channelImages
            delegate: Image {
                source: img
            }
            highlight: channelsList.focus ? channelListHighlight : null
            keyNavigationEnabled: true
        }


        ListView {
            id: list2
            width: 600
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            model: m1
            delegate: Text {
                text: name
                font.pixelSize: 32
                color: "white"
            }
            highlight: list2.focus ? textHighligt : null
            keyNavigationEnabled: true
            onCurrentIndexChanged: console.log('changed selection: ' + list2.currentIndex)
        }

        ListView {
            id: list3
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: list2.right
                right: root.right
            }
            model: m1
            delegate: Text {
                text: name
                font.pixelSize: 32
                color: "white"
            }
            highlight: list3.focus ? textHighligt : null
            keyNavigationEnabled: true
        }

        Component {
            id: textHighligt
            Rectangle { color: "#30FFFFFF"; radius: 5 }
        }

        Component {
            id: channelListHighlight
            Rectangle { color: "#30FFFFFF"; radius: 20 }
        }


    }




    ListModel {
        id: channelImages

        ListElement { img: "qrc:/images/main.png" }
        ListElement { img: "qrc:/images/proc.png" }
        ListElement { img: "qrc:/images/dare.png" }
        ListElement { img: "qrc:/images/int.png" }
        ListElement { img: "qrc:/images/kids.png" }
        ListElement { img: "qrc:/images/lat.png" }
    }


    ListModel {
        id: m1
    }


    Component.onCompleted: JsLib.appendDatatoList(m1)

}
