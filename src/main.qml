import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: mainWindow
    visible: true
    width: 1920
    height: 1080
    title: "Interless"

    // --START StackView
    StackView {
        id: mainStack
        initialItem: "qrc:/Home.qml"
        focus: true
        anchors.fill: parent

        // --START Background Image
        Image {
            anchors.fill: parent
            source: "qrc:/images/background.jpg"
        }
        // --END Background Image

        // --START Handle keys
        Keys.onPressed: {
            /****** Listen here globaly for home key or back and modify the stack accordingly ******/
            switch (event.key) {
            case Qt.Key_Backspace:
                // Handle here going up in the stack
                console.log("go back")
                mainStack.pop()
                break
            case Qt.Key_Home:
                // handle here going to the home screen
                console.log("go home")
                mainStack.push(home)
                break

            case Qt.Key_Return:
                if (mainStack.currentItem.objectName === "Home") {
                    var currButtonName = mainStack.currentItem.currButtonName.children[0].children[1].text;
                 console.log(currButtonName)
                    if (currButtonName === "Channels") {
                        mainStack.push(channels)
                    }

                    if (currButtonName === "Playlists") {
                        console.log('ss')
                        mainStack.push(vid)
                    }
                }
                break
            case Qt.Key_Escape:
                // handle here going to the home screen
                Qt.quit()
                break
            default:
                break
            }
        }
        // --START Handle keys
    }

    Component {
        id: channels
        Channels {}
    }

    Component {
        id: home
        Home {}
    }

    Component {
        id: vid
        Vidds {}
    }

    // --END StartView
}
