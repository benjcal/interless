import QtQuick 2.9

// Sample for double list with changeable focus!
FocusScope {
    objectName: "Home"
    property alias currButtonName: buttons.currentItem

    // --START Logo
    Image {
        source: "qrc:/images/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        width: 400
        y: 60
        fillMode: Image.PreserveAspectFit
    }
    // --END Logo

    // --Start Icons
    ListView {
        id: buttons
        focus: true

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 300
        }
        width: 5 * 300 - 100
        spacing: 100


        orientation: ListView.Horizontal
        model: iconList
        delegate: homeButton

        keyNavigationEnabled: true

        highlight: Rectangle { color: "#30FFFFFF"; radius: 20 }
        highlightMoveDuration: 400
    }
    // --END Icons

    ListModel {
        id: iconList
        ListElement { iconCode: "\ue011"; iconName: "Channels" }
        ListElement { iconCode: "\ue067"; iconName: "Playlists" }
        ListElement { iconCode: "\ue619"; iconName: "Schedule" }
        ListElement { iconCode: "\ue06e"; iconName: "Preference" }
        ListElement { iconCode: "\ue05d"; iconName: "Help" }
    }


    Component {
        id: homeButton

        Item {
            width: 200
            height: 200

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    font.family: iconFont.name
                    font.pixelSize: 80
                    color: "white"

                    text: iconCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: aabc
                    font.family: textFont.name
                    font.pixelSize: 24
                    color: "white"

                    text: iconName
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    // --START Fonts
    FontLoader {
        id: iconFont
        source: "qrc:/fonts/Simple-Line-Icons.ttf"
    }
    FontLoader {
        id: textFont
        source: "qrc:/fonts/Sunflower-Light.ttf"
    }
    // --END Fonts

}
