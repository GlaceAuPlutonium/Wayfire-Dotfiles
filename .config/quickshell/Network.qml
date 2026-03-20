import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: networkPill

  property int    pillHeight:   24
  property color  bgColor:      "#cc1a1b26"
  property int    pillRadius:   8
  property int    padH:         6
  property string fontFamily:   "CaskaydiaCoveNF"
  property int    fontSize:     14
  property color  colNetwork:   "#6595fc"
  property var    parentWindow: null

  height: pillHeight
  Layout.preferredWidth: networkLabel.implicitWidth + padH * 2
  radius: pillRadius
  color:  bgColor

  property string ssid: "..."
  property int signalStrength: 0
  property string ipAddr: "..."
  property bool showSsid: false

  Process {
    id: nmcliProc
    command: ["nmcli", "-t", "-f", "active,ssid,signal", "dev", "wifi"]
    stdout: StdioCollector {
      onStreamFinished: {
        var lines = this.text.trim().split("\n")
        for (var l of lines) {
          if (l.startsWith("yes:")) {
            var parts = l.split(":")
            networkPill.ssid           = parts[1] ? parts[1].trim() : "Disconnected"
            networkPill.signalStrength = parts[2] ? parseInt(parts[2]) : 0
            return
          }
        }
        networkPill.ssid           = "Disconnected"
        networkPill.signalStrength = 0
      }
    }
  }

  Process {
    id: nmcliIpProc
    command: ["nmcli", "-t", "-f", "IP4.ADDRESS", "dev", "show"]
    stdout: StdioCollector {
        onStreamFinished: {
            var lines = this.text.trim().split("\n")
            for (var l of lines) {
                if (l.includes(":")) {
                    var ip = l.split(":")[1].trim()
                    // Vire le /24 ou autre prefix
                    networkPill.ipAddr = ip.split("/")[0]
                    return
                }
            }
            networkPill.ipAddr = "No IP"
        }
    }
  }

  Timer {
    interval: 10000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: {
      nmcliProc.running = true
      nmcliIpProc.running = true
    }
  }

  Text {
    id: networkLabel
    anchors.centerIn: parent
    text:   networkPill.showSsid
            ? networkPill.ssid + " (" + networkPill.signalStrength + "%)"
            : "Network   (" + networkPill.signalStrength + "%)"
    color:          colNetwork
    font.family:    fontFamily
    font.pixelSize: fontSize
    topPadding:     2
  }

  MouseArea {
    id: networkHover
    anchors.fill: parent
    hoverEnabled: true
    cursorShape:  Qt.PointingHandCursor
    onEntered: networkPopup.visible = true
    onExited:  networkPopup.visible = false
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    
    onPressed: (mouse) => {
      if (mouse.button === Qt.LeftButton)
        networkPill.showSsid = !networkPill.showSsid
      else if (mouse.button === Qt.RightButton)
        Quickshell.execDetached(["nm-connection-editor"])
    }
  }

  PopupWindow {
    id: networkPopup
    visible: false
    anchor.window: networkPill.parentWindow

    anchor.rect.x: networkPill.mapToItem(null, 0, 0).x + (networkPill.width - width) / 2
    anchor.rect.y: (implicitHeight - 6)

    implicitWidth:  popupText.implicitWidth + 16
    implicitHeight: popupText.implicitHeight + 10
    color:  "transparent"

    Rectangle {
      anchors.fill: parent
      color:  "#101010"
      radius: 4

      Text {
        id: popupText
        anchors.centerIn: parent
        text:           networkPill.ssid !== "Disconnected"
                          ? networkPill.ipAddr + " 󰩟"
                          : "󰌙 Disconnected"
        color:          "#dce1f5"
        font.family:    networkPill.fontFamily
        font.pixelSize: networkPill.fontSize
      }
    }
  }
}
