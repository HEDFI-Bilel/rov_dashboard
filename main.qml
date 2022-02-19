import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import io.smth 1.0
import QtQml 2.12
import QtMultimedia 5.12
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 1280
    height: 705
    title: qsTr("PlaneSIM")
    color: "darkgray"

    Component.onCompleted: showMaximized()

    Material.theme: Material.Dark
    Material.accent: Material.color(Material.Orange)

    FontLoader { id: dseg7; source: "qrc:/fonts/DSEG7-Classic/DSEG7Classic-Bold.ttf" }
    FontLoader { id: dsegdot; source: "qrc:/fonts/lcddot_tr.ttf" }
    property int incrimentorpitct: O
    property int incrimentorroll: 5

    Component {
        id: lcdNumberWithName

        Item {
            height: 40
            width: numberShadow.width
            property alias text: numberText.text
            property string shadow
            property string title
            property real countTemp:0
            property int countPres: 0
            property int countDepth: 0

            property string unit

            Text {
                id: numberShadow //<ariere plan
                anchors.left: sensorName.right; anchors.leftMargin:70
                anchors.verticalCenter: sensorName.verticalCenter


                font {
                    family: dseg7.name
                    pixelSize: parent.height
                }
                color: lcd.darker()
                text: parent.shadow

                Text {
                    id: numberText // sensor value
                    font: parent.font
                }
            }// end number shadow

            Text {
                id:sensorName
                text: parent.title // sensor name
                anchors.left:parent.left
               anchors.verticalCenter: parent.verticalCenter

                //anchors.bottom: numberShadow.top; anchors.bottomMargin: 10
               font.pixelSize:32


            }//end sensor name
                Text {
                    id: valueunit
                    text:parent.unit
                    anchors.left: numberShadow.right;anchors.leftMargin:20
                    anchors.verticalCenter: sensorName.verticalCenter

                   // anchors.bottom: numberShadow.top; anchors.bottomMargin: 10
                    font {family: dsegdot.name
                    pixelSize: 32
                }
                }// valueunit
              /*  Rectangle {
                    width: 20; height: 20
                    anchors.bottom: valueunit.bottom
                    anchors.left: valueunit.right; anchors.leftMargin: 20
                    color: "black"; radius: 4
                }*/


            //test

      Timer {
            id: id_timer
            repeat: true
            interval: 1000
            running: true

            onTriggered: {
                var valtext = lcdTemperature.item.text
                var vatreal =parseFloat(valtext)

                vatreal= vatreal+ 0.1
               // valtext= toString(vatreal)
                vatreal=Math.trunc(vatreal*10)
                vatreal=vatreal/10


                lcdTemperature.item.text =vatreal
                countTemp++
                if (countTemp==10){
                    countTemp=0}


        }
   } }}

    InstrumentBackground {
        id: controlInstrumentsBackground
        x: 0
        anchors.top: speedInstrumentBackground.bottom
        width: 460
        height: 110

        LCDBackground {
            id: lcd
            anchors.verticalCenter: parent.verticalCenter
            width: 440
            height: 70
            anchors.margins: 20
            anchors.centerIn: parent

            color: colorOrange

            Loader {
                id: lcdTemperature
                sourceComponent: lcdNumberWithName
               // anchors.verticalCenter:   parent.verticalCenter
                anchors.left: parent.left; anchors.leftMargin: 15
               anchors.bottom: parent.bottom; anchors.bottomMargin:15
                onLoaded: { item.shadow = "88.8"; item.title = "Temperature";item.unit="°C" ; item.text=17.4}
            }}}
    InstrumentBackground {
        id: controlInstrumentsBackgroundpressurre
        anchors.left: controlInstrumentsBackground.right
        anchors.top: camInstrumentBackground.bottom
        width: 445
        height: 110

        LCDBackground {
            id: lcdpressure
            anchors.verticalCenter: parent.verticalCenter
            width: 405
            height: 70
            anchors.margins: 20
            anchors.centerIn: parent

            color: colorOrange

            Loader {
                id: lcdPressureLoader
                sourceComponent: lcdNumberWithName
               // anchors.verticalCenter:   parent.verticalCenter
                anchors.left: parent.left; anchors.leftMargin: 15
               anchors.bottom: parent.bottom; anchors.bottomMargin:15
                onLoaded: { item.shadow = "88.8"; item.title = "Pressure";item.unit="bar" ; item.text=11.2}
            }}}
    InstrumentBackground {
        id: controlInstrumentsBackgroundDepth
        anchors.left: controlInstrumentsBackgroundpressurre.right
        anchors.top: camInstrumentBackground.bottom

        width: 445
        height: 110

        LCDBackground {
            id: lcdDepth
            anchors.verticalCenter: parent.verticalCenter
            width: 405
            height: 70
            anchors.margins: 20
            anchors.centerIn: parent

            color: colorOrange

            Loader {
                id: lcdDepthLoader
                sourceComponent: lcdNumberWithName
               // anchors.verticalCenter:   parent.verticalCenter
                anchors.left: parent.left; anchors.leftMargin: 15
               anchors.bottom: parent.bottom; anchors.bottomMargin:15
                onLoaded: { item.shadow = "888.8"; item.title = "Depth";item.unit="m" ; item.text=121.2}
            }}}

    InstrumentBackground {
        id: controlInstrumentsBackgroundLight
        anchors.left: controlInstrumentsBackgroundDepth.right
        anchors.top: camInstrumentBackground.bottom

        width: 490
        height: 110

        LCDBackground {
            id: lcdLight
            anchors.verticalCenter: parent.verticalCenter
            width: 405
            height: 70
            anchors.margins: 20
            anchors.centerIn: parent

            color: colorOrange

            Slider {
                id: slider
                x: 42
                y: 15
                width: 330
                height: 40
                value: 0.5
            }}}
    InstrumentBackground {
        id: ahInstrumentBackground
        //anchors.top: controlInstrumentsBackground.bottom; anchors.topMargin: 5
       // anchors.right: mapInstrumentBackground.left; anchors.rightMargin: 5
        width: 460; height: 460
        anchors.top: parent.right; anchors.topMargin: 5

        Rectangle {
            anchors.fill: parent
            anchors.margins: 20
            radius: 10; color: "#111"


        ArtificialHorizon {
            id: artificialHorizon
            width: 320; height: 420
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -10
            roll: incrimentorroll
            pitch:incrimentorpitct
            Timer {
                  id: id_timerÉÉÉ
                  repeat: true
                  interval: 1000
                  running: true

                  onTriggered: {
                      incrimentorpitct++;
                      incrimentorroll++;

                  }
              }
           }
        }
    }
    InstrumentBackground {
        id: speedInstrumentBackground
        x: 0
        //anchors.top: controlInstrumentsBackground.bottom; anchors.topMargin: 5
       anchors.top: ahInstrumentBackground.bottom; anchors.rightMargin: 5
        width: 460; height: 444

        Rectangle {
            anchors.fill: parent
            anchors.margins: 20
            radius: 10; color: "#111"

    Dashboard{
        id:speedid
        width:parent.width
        height: parent.height

        anchors.horizontalCenterOffset: -10

    }
    }
    }
    InstrumentBackground{
        id: camInstrumentBackground
        y: 0
        //anchors.top: controlInstrumentsBackground.bottom; anchors.topMargin: 5
       anchors.left: ahInstrumentBackground.right; anchors.rightMargin: 5
        width:1380; height: 904

        Rectangle {
            anchors.fill: parent
            anchors.margins: 20
            radius: 10; color: "#111"
            Video {
                id: video
                width : 800
                height : 600
                source: "video1.mp4"
                anchors.fill : parent


                /*MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        video.play()
                    }
                }*/
                Switch {
                    id: switch1
                    x: 31
                    y: 8
                    opacity: 1
                    text: qsTr("Camera  ON/OFF")
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
                    x: 386
                    y: 8
                    text: qsTr("Screen Recoording")
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
                    x: 720
                    y: 8
                    text: qsTr("ScreenShot")
                    onClicked: {
                    id_timer.running=true
                    }
                }




            focus: true
            Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)
        }}}

        Timer {
              id: id_timer22
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

            /* Rectangle {
                width: 20; height: 20
                anchors.bottom: lcdTemperature.bottom
                anchors.left: lcdTemperature.right; anchors.leftMargin: 20
                color: "black"; radius: 4
            }*/

             /* Loader {
                id: lcdpression
                sourceComponent: lcdNumberWithName
                anchors.left: lcdTemperature.right; anchors.leftMargin: 250
                anchors.bottom: parent.bottom; anchors.bottomMargin: 30
                onLoaded: { item.shadow = "88"; item.title = "Pressure";item.unit="Pa"  }
            }*/


           /*  Rectangle {
                width: 20; height: 20
                anchors.bottom: lcdpression.bottom
                anchors.left: lcdpression.right; anchors.leftMargin: 20
                color: "black"; radius: 4
            }*/

           /* Loader {
                id: lcdDepth
                sourceComponent: lcdNumberWithName
                anchors.right: parent.right ; anchors.rightMargin: 150
                anchors.bottom: parent.bottom; anchors.bottomMargin: 30
                onLoaded: { item.shadow = "888"; item.title = "Depth";item.unit="Pa"  }
            }*/


           /* Text {
                text: "HDG V/S"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom; anchors.bottomMargin: 25
                font {
                    family: dsegdot.name
                    pixelSize: 32
                }
            }

            Text {
                id: lvlChText
                text: "LVL/CH"
                anchors.right: lcdVerticalSpeed.left
                anchors.bottom: lcdVerticalSpeed.top; anchors.bottomMargin: 10
                font {
                    family: dsegdot.name
                    pixelSize: 32
                }
            }

            Loader {
                id: lcdAltitude
                sourceComponent: lcdNumberWithName
                anchors.right: lvlChText.left
                anchors.bottom: parent.bottom; anchors.bottomMargin: 15
                onLoaded: { item.shadow = "8888"; item.title = "ALT" }
            }

           }
}
    InstrumentBackground {
        id: ligntControlInstrumentsBackground


       // width: 1200
        height: 230
        anchors.right: parent.right
        anchors.left: controlInstrumentsBackground.right
}
}*/

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
