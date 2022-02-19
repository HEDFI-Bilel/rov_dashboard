import QtQuick 2.3
import QtQuick.Window 2.2
import QtMultimedia 5.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQml 2.0
Item {visible: true
    //width: Screen.width
    //height: Screen.height
    width: Screen.height/2
    height: Screen.width-200
    Video {
        id: video
        width : 800
        height : 600
        source: "video.mp4"
        anchors.fill : parent


        /*MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                video.play()
            }*/

            Switch {
                id: switch1
                x: 43
                y: 39
                opacity: 1
                //text: qsTr("Switch")
                onClicked:{
                    if (switch1.position==1.0)
                    {video.play()
                        video.fillMode}
                    else
                        video.stop()

                    console.log( switch1.position)}
            }

            Switch {
                id: switch2
                x: 240
                y: 33
                //text: qsTr("Switch")
                onClicked:{
                    if (switch2.position==1.0){
                       console.log( switch2.position)
                        console.log("strating recording")
                    }
                    else{
                        console.log( switch2.position)
                        console.log("recording finiched")
                    }

                    console.log( switch2.position)}
            }



            Button {
                id: button
                x: 516
                y: 33
                text: qsTr("Button")
                onClicked: {
                id_timer.running=true
                }
            }

            Text {
                id: text1
                x: 613
                y: 568
                width: 166
                height: 16
                text: qsTr("Text")
                font.pixelSize: 12
            }


        focus: true
        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        Keys.onLeftPressed: video.seek(video.position - 5000)
        Keys.onRightPressed: video.seek(video.position + 5000)
    }

    Timer {
          id: id_timer
          repeat: true
          interval: 1000
          running: false

          onTriggered: {
              counnnt++;

              text1.text=qsTr("image captrued")
             // text1.text=qsTr("")
              if (counnnt ==3){
                  text1.text=qsTr("")
                  stop()
              }

          }}
}
