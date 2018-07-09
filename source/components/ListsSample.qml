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
        model: m1
        delegate: Text {
            text: name
        }
        highlight: Rectangle { color: "blue"; radius: 5 }
        keyNavigationEnabled: true
    }

    ListModel {
        id: m1
    }

    Component.onCompleted: request()

    function request() {
        var xhr = new XMLHttpRequest()

        xhr.onreadystatechange = function() {

            if(xhr.readyState === XMLHttpRequest.DONE) {

                var json = JSON.parse(xhr.responseText.toString())

                var arr = [1]

                Object.keys(json).forEach(function(k) {

                    var name = json[k].series_title

                    if (arr.indexOf(name) < 0) {
                        arr.push(json[k].series_title)
                    }
                })

                arr.sort()

                arr.forEach(function(e) {
                    m1.append({name: e})
                })
            }
        }
        xhr.open("GET", "http://localhost:3000")
        xhr.send()
    }


    ListView {
        id: list2
        y: 200
        width: 200
        height: 200
        model: m1
        delegate: Text {
            text: name
        }
        highlight: Rectangle { color: "blue"; radius: 5 }
        keyNavigationEnabled: true
    }
    //     END ListView
}
