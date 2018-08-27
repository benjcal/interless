import QtQuick 2.9
import QtMultimedia 5.9

Video {
    id: video
    source: "http://localhost:8000/oceans.mp4"

    anchors.fill: parent

    focus: true
    Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
    Keys.onLeftPressed: video.seek(video.position - 3000)
    Keys.onRightPressed: video.seek(video.position + 3000)
}
