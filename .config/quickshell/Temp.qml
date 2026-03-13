import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
   id:     tempPill

   property int pillHeight: 24
   property color bgColor: "#cc1a1b26"
  property int pillRadius: 8
  property int padH: 6
  property string fontFamily: "CaskaydiaCoveNF"
  property int fontSize: 14
  property color colTemp: "#fc8b47"
  
  height: pillHeight
  Layout.preferredWidth:  tempIcon.implicitWidth + root.padH * 2
  radius: pillRadius
  color:  bgColor

                property int cpuTemp: 0

                FileView {
                    id: tempFile
                    path: "/sys/class/hwmon/hwmon2/temp2_input"
                    watchChanges: false
                    onLoaded: tempPill.cpuTemp = Math.round(parseInt(text())/1000)
                }

                Timer {
                    interval: 2000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: tempFile.reload()
                }

                Text {
                    id:             tempIcon
                    anchors.centerIn: parent
                    text:           tempPill.cpuTemp + "°C "
                    color:          colTemp
                    font.family:    fontFamily
                    font.pixelSize: fontSize
                    topPadding:     1
                }
            }
