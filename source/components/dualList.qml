import QtQuick 2.9

// Sample for double list with changeable focus!
FocusScope {

    Keys.onPressed: {
        if (event.key === Qt.Key_Right) {
            list1.focus = false
            list2.focus = true
        }
        if (event.key === Qt.Key_Left) {
            list1.focus = true
            list2.focus = false
        }
    }

    Image {
        source: "qrc:/images/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        width: 600
        y: 60
        fillMode: Image.PreserveAspectFit
    }

    ListView {
        id: list1
        focus: true
        width: 200
        height: 200
        model: model1
        delegate: Text {
            text: iconCode + ": " + iconName
        }
        highlight: Rectangle { color: "blue"; radius: 5 }
        keyNavigationEnabled: true
    }

    ListView {
        id: list2
        y: 200
        width: 200
        height: 200
        model: model1
        delegate: Text {
            text: iconCode + ": " + iconName
        }
        highlight: Rectangle { color: "blue"; radius: 5 }
        keyNavigationEnabled: true
    }
    // END ListView
}
