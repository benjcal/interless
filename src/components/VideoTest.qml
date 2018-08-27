import QtQuick 2.9
import QtMultimedia 5.9

Rectangle {
    width: 1920
    height: 1080

    color: "black"

    Video {
        id: video
        source: "file:///var/vids/28F000002.mp4"

        anchors.fill: parent

        autoPlay: true
        focus: true

    }

}




