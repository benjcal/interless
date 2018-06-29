import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: mainWindow
    visible: true
    width: 1920
    height: 1080
    title: "Interless"

    // START StackView
    StackView {
        id: mainStack
        initialItem: view1
        focus: true
        anchors.fill: parent

        // START Background Image
        Image {
            anchors.fill: parent
            source: "qrc:/images/background.jpg"
        }
        // END Background Image

        Keys.onPressed: {
            handleKeys(event, mainStack)
        }

        function handleKeys(e, stack) {
            if (e.key === Qt.Key_1) {
                stack.push(view1)
            }
            if (e.key === Qt.Key_2) {
                stack.push(view2)
            }
            if (e.key === Qt.Key_3) {
                stack.push(view3)
            }
            if (e.key === Qt.Key_Backspace) {
                stack.pop()
            }
            if (e.key === Qt.Key_Q) {
                Qt.quit()
            }
        }
    }
    // END StartView


    Component {
        id: view2
        Home {
        }
    }


    Component {
        id: view1
        // START ListView
        ListView {
            anchors.fill: parent
            model: model1
            delegate: Text {
                text: iconCode + ": " + iconName
            }
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            Keys.onPressed: {
                if (event.key === Qt.Key_1) {
                    mainStack.push(view2)
                }
                if (event.key === Qt.Key_2) {
                    mainStack.push(view3)
                }

            }

        }
        // END ListView
    }



    Component {
        id: view3
        Rectangle {
            color: "red"
            anchors.fill: parent
        }
    }




    ListModel {
        id: model1
        ListElement { iconCode: "\ue011"; iconName: "Channels" }
        ListElement { iconCode: "\ue067"; iconName: "Playlists" }
        ListElement { iconCode: "\ue619"; iconName: "Schedule" }
        ListElement { iconCode: "\ue06e"; iconName: "Preference" }
        ListElement { iconCode: "\ue05d"; iconName: "Help" }
    }

}
