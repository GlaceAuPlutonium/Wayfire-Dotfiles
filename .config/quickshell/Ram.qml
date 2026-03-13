import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
  id:     ramPill
  
  property int pillHeight: 24
  property color bgColor: "#cc1a1b26"
  property int pillRadius: 8
  property int padH: 6
  property string fontFamily: "CaskaydiaCoveNF"
  property int fontSize: 14
  property color colRam: "#7dcfff"

  height: pillHeight
  Layout.preferredWidth:  ramIcon.implicitWidth + root.padH * 2
  radius: pillRadius
  color:  bgColor

  property int ramUsage: 0
  property int ramUsedGiB: 0.0

  FileView {
    id: ramFile
    path: "/proc/meminfo"
    watchChanges: false

    onLoaded: {
      var lines = text().split("\n")
      var total = 0, available = 0
      for (var l of lines) {
        if (l.startsWith("MemTotal:"))     total     = parseInt(l.split(/\s+/)[1])
        if (l.startsWith("MemAvailable:")) available = parseInt(l.split(/\s+/)[1])
      }
      if (total > 0) {
        ramPill.ramUsage = Math.round(100 * (1 - available / total))
        ramPill.ramUsedGiB  = ((total - available) / 1048576 * 10) / 10
      }
    }
  }

  Timer {
    interval: 5000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: ramFile.reload()
  }

  Text {
   id:             ramIcon
   anchors.centerIn: parent
   text:           ramPill.ramUsage + "% "
   color:          colRam
   font.family:    fontFamily
   font.pixelSize: fontSize
   topPadding:     2
  }

    MouseArea {
                    id: ramHover
                    anchors.fill: parent
                    hoverEnabled: true
                    
                    ToolTip {
                        visible: ramHover.containsMouse
                        delay: 500
                        x: 60
                        contentItem: Text {
                            text: ramPill.ramUsedGiB.toFixed(1) + " GiB used"
                            color: "#dce1f5"
                            font.family: fontFamily
                            font.pixelSize: fontSize
                            topPadding: -4
                        }

                        background: Rectangle {
                            color: "#121212"
                            radius: pillRadius - 2
                        }
                    }
                }
            }
