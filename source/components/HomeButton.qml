import QtQuick 2.9


Item {
    property alias icon: icon.text
    property alias name: name.text

    id: homeButton
    width: 200
    height: 200

    FontLoader {
        id: iconFont
        source: "qrc:/fonts/Simple-Line-Icons.ttf"

    }

    FontLoader {
        id: textFont
        source: "qrc:/fonts/Sunflower-Light.ttf"
        name: "Sunflower"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: icon
            font.family: iconFont.name
            font.pixelSize: 80
            color: "white"

            text: "ICON?"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: name
            font.family: textFont.name
            font.pixelSize: 24
            color: "white"

            text: "NAME?"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}

