import QtQuick 2.9

Item {
    anchors.fill: parent

    Image {
        anchors.fill: parent
        source: "qrc:/background.jpg"

        Image {
            source: "qrc:/logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 600
            y: 60
            fillMode: Image.PreserveAspectFit
        }
    }




    ListModel {
        id: homeButtonsList
        ListElement { iconCode: "\ue011"; iconName: "Channels" }
        ListElement { iconCode: "\ue067"; iconName: "Playlists" }
        ListElement { iconCode: "\ue619"; iconName: "Schedule" }
        ListElement { iconCode: "\ue06e"; iconName: "Preference" }
        ListElement { iconCode: "\ue05d"; iconName: "Help" }
    }

    Component {
        id: myDelegate
        HomeButton {
            icon: iconCode
            name: iconName
        }
    }


    ListView {
        id: list1
        spacing: 100

        width: 5 * 300 - 100
        focus: true

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 300
        }

        orientation: ListView.Horizontal
        model: homeButtonsList
        delegate: myDelegate

        keyNavigationEnabled: true
        highlight: Rectangle { color: "#30FFFFFF"; radius: 20 }
        highlightMoveDuration: 400

        Keys.onPressed: {
            if (event.key === Qt.Key_Return) {
                console.log('return pressed')
            }

           console.log(this.highlightItem)
        }

    }

}
