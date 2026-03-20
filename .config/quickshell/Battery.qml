import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: batteryPill

  property int    pillHeight:   24
  property color  bgColor:      "#cc1a1b26"
  property int    pillRadius:   8
  property int    padH:         6
  property string fontFamily:   "CaskaydiaCoveNF"
  property int    fontSize:     14
  property color  colBattery:   "#9ece6a"
  property var    parentWindow: null

  height: pillHeight
  Layout.preferredWidth: batteryLabel.implicitWidth + padH * 2
  radius: pillRadius
  color:  bgColor

  property var bat: null
  property bool showTime: false

  function findBattery() {
    var devs = UPower.devices.values
    for (var i = 0; i < devs.length; i++) {
      if (devs[i].isLaptopBattery) {
        bat = devs[i]
        return
      }
    }
  }

  Component.onCompleted: findBattery()

  Connections {
    target: UPower.devices
    function onObjectInsertedPost(object, index) { batteryPill.findBattery() }
  }

  readonly property real capacity: bat && bat.ready ? bat.percentage * 100 : 0
  readonly property var  batState: bat && bat.ready ? bat.state : UPowerDeviceState.Unknown

  readonly property string batteryIcon: {
    if (batState === UPowerDeviceState.Charging)     return ""
    if (batState === UPowerDeviceState.PendingDischarge) return ""
    if (batState === UPowerDeviceState.FullyCharged) return ""
    if (capacity >= 80) return ""
    if (capacity >= 60) return ""
    if (capacity >= 40) return ""
    if (capacity >= 20) return ""
    return ""
  }

  readonly property color displayColor: {
    if (batState !== UPowerDeviceState.Charging && batState !== UPowerDeviceState.FullyCharged) {
      if (capacity <= 40) return "#e0af68"
    }
    return colBattery
  }
  
  readonly property string batTime: {
    if (!bat || !bat.ready) return ""
      var t = batState === UPowerDeviceState.Charging ? bat.timeToFull : bat.timeToEmpty
    if (t <= 0) return UPowerDeviceState.toString(batState)
      var h = Math.floor(t / 3600)
      var m = Math.floor((t % 3600) / 60)
    return h + " h " + m + " min"
  }

  
  Text {
    id: batteryLabel
    anchors.centerIn: parent
    text:           batteryPill.showTime
                    ? batteryPill.batTime
                    : Math.round(batteryPill.capacity) + "% " + batteryPill.batteryIcon
    color:          batteryPill.displayColor
    font.family:    fontFamily
    font.pixelSize: fontSize
    topPadding:     2
  }

  ParallelAnimation {
  running: batteryPill.capacity <= 15
  loops: Animation.Infinite
  onRunningChanged: {
    if (!running) {
      batteryLabel.opacity = 1.0
      batteryLabel.color = batteryPill.displayColor
    }
  }

  SequentialAnimation {
    NumberAnimation {
      target: batteryLabel; property: "opacity"
      from: 1.0; to: 0.3; duration: 750; easing.type: Easing.InOutSine
    }
    NumberAnimation {
      target: batteryLabel; property: "opacity"
      from: 0.3; to: 1.0; duration: 750; easing.type: Easing.InOutSine
    }
  }

  SequentialAnimation {
    ColorAnimation {
      target: batteryLabel; property: "color"
      from: "#fd121e"; to: "#fc1728"; duration: 750; easing.type: Easing.InOutSine
    }
    ColorAnimation {
      target: batteryLabel; property: "color"
      from: "#fc1728"; to: "#fd121e"; duration: 750; easing.type: Easing.InOutSine
    }
  }
}

  MouseArea {
    id: batteryHover
    anchors.fill: parent
    hoverEnabled: true
    onEntered: batteryPopup.visible = true
    onExited:  batteryPopup.visible = false
    cursorShape:  Qt.PointingHandCursor
    onPressed: batteryPill.showTime = !batteryPill.showTime
  }

  PopupWindow {
    id: batteryPopup
    visible: false
    anchor.window: batteryPill.parentWindow

    anchor.rect.x: batteryPill.mapToItem(null, 0, 0).x + (batteryPill.width - width) / 2
    anchor.rect.y: (implicitHeight - 0)

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
        text: "Empty in " + batteryPill.batTime
        color:          batteryPill.displayColor
        font.family:    batteryPill.fontFamily
        font.pixelSize: batteryPill.fontSize
      }
    }
  }
}
