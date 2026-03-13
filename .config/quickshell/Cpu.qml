import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
  id:     cpuPill

  property int pillHeight: 24
  property color bgColor: "#cc1a1b26"
  property int pillRadius: 8
  property int padH: 6
  property string fontFamily: "CaskaydiaCoveNF"
  property int fontSize: 14
  property color colCpu: "#a778ff"
  
  height: pillHeight
  Layout.preferredWidth:  cpuText.implicitWidth + root.padH * 2
  radius: pillRadius
  color:  bgColor

  property int cpuUsage:  0
  property int lastIdle:  0
  property int lastTotal: 0

  FileView {
    id: cpuFile
    path: "/proc/stat"
    watchChanges: false
    onLoaded: {
      var line = text().split("\n")[0]
      var p = line.trim().split(/\s+/)
      var idle  = parseInt(p[4]) + parseInt(p[5])
      var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
      if (cpuPill.lastTotal > 0)
        cpuPill.cpuUsage = Math.round(100 * (1 - (idle - cpuPill.lastIdle) / (total - cpuPill.lastTotal)))
      cpuPill.lastIdle  = idle
      cpuPill.lastTotal = total
    }
  }


  Timer {
    interval:         5000
    running:          true
    repeat:           true
    triggeredOnStart: true
    onTriggered:      cpuFile.reload()
  }

  Text {
    id:             cpuText
    anchors.centerIn: parent
    text:           cpuPill.cpuUsage + "% "
    color:          colCpu
    font.family:    fontFamily
    font.pixelSize: fontSize
    topPadding:     2
  }
}
