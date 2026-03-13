import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: backlightPill

    property int    pillHeight:  24
    property color  bgColor:     "#cc1a1b26"
    property int    pillradius:  8
    property int    padH:        6
    property string fontFamily:  "CaskaydiaCoveNF"
    property int    fontSize:    14
    property color  accentColor: "#c6cff5"

    readonly property int maxRaw: 3906

    property int rawValue:     0
    property int displayValue: 0  // 0-100, corrected to compensate for hardware inverted values

    height: pillHeight
    Layout.preferredWidth: lightText.implicitWidth + padH * 2
    color: bgColor
    radius: pillRadius

    function iconForLevel(v) {
        var icons = ["", "", "", "", "", "", "", "", ""]
        return icons[Math.min(8, Math.floor(v / 100 * 8))]
    }

    
    // getting the brightness value
    FileView {
        id: backlightFile
        path: "/sys/class/backlight/intel_backlight/brightness"
        watchChanges: true
        onLoaded: {
            backlightPill.rawValue     = parseInt(text().trim())
            backlightPill.displayValue = Math.round(100 * (1 - backlightPill.rawValue / backlightPill.maxRaw))
        }
    }

    Timer {
        interval: 300
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: backlightFile.reload()
    }


    Text {
        id: lightText
        anchors.centerIn: parent
        text:  backlightPill.displayValue + "% " + backlightPill.iconForLevel(backlightPill.displayValue)       
        color: accentColor
        font.family: fontFamily
        font.pixelSize: fontSize
        topPadding:     1
    }

    // -- scrolling --
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        onWheel: wheel => {
            var step = Math.round(backlightPill.maxRaw * 0.01)
            var newRaw = wheel.angleDelta.y < 0
                ? Math.max(0, backlightPill.rawValue - step)
                : Math.min(backlightPill.maxRaw, backlightPill.rawValue + step)
            backlightSetProcess.command = ["sh", "-c", "echo " + newRaw + " > /sys/class/backlight/intel_backlight/brightness"]
            backlightSetProcess.running = true
            backlightPill.rawValue     = newRaw
            backlightPill.displayValue = Math.round(100 * (1 - newRaw / backlightPill.maxRaw))
        }
    }

    Process {
        id: backlightSetProcess
        command: []
    }
}
