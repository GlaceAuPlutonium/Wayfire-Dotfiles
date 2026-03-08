import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    anchors { top: true; left: true; right: true }
    implicitHeight: barHeight
    color: "transparent"

    // =========================================================================
    //  STYLE — Modify here to change everything
    // =========================================================================

    // Bar height
    readonly property int   barHeight:    32

    // Main rectangles properties
    readonly property color bgColor:      "#cc1a1b26"
    readonly property int   radius:       8
    readonly property int   pillHeight:   24
    readonly property int   pillSpacing:  5   // Pill spacing
    readonly property int   padH:         6   // Horizontal padding

    // Font
    readonly property string fontFamily:  "CaskaydiaCoveNF"
    readonly property int    fontSize:    14

    // Text colors
    readonly property color colPower:    "#fa3258"
    readonly property color colBattery:  "#9ece6a"
    readonly property color colVolume:   "#ff007c"
    readonly property color colNetwork:  "#6595fc"
    readonly property color colLight:    "#c6cff5"
    readonly property color colTemp:     "#fc8b47"
    readonly property color colRam:      "#7dcfff"
    readonly property color colCpu:      "#a778ff"

    readonly property color colClock:    "#7dcfff"
    
    readonly property color colLauncher: "#8cd158"

    // =========================================================================
    //  MAIN LAYOUT
    // =========================================================================
    RowLayout {
        anchors { fill: parent; leftMargin: 5; rightMargin: 3 }
        spacing: 0

        // -- Left ----------------------------------------------------------
        RowLayout {
            spacing:          root.pillSpacing
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            // Launcher (wofi)
            Rectangle {
                id:     wofiPill
                height: root.pillHeight
                width:  wofiIcon.implicitWidth + root.padH * 3
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             wofiIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colLauncher
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wofi", "-n", "--show", "drun"])
                }
            }
        }

        // -- CENTER ----------------------------------------------------------
        Item {
            Layout.fillWidth: true

            // Clock
            Rectangle {
                id:     clockPill
                anchors.centerIn: parent
                height: root.pillHeight
                width:  clockLabel.implicitWidth + root.padH * 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             clockLabel
                    anchors.centerIn: parent
                    text:           "  " + Qt.formatDateTime(new Date(), "HH:mm")
                    color:          root.colClock
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                Timer {
                    interval:    1000
                    running:     true
                    repeat:      true
                    onTriggered: clockLabel.text = "  " + Qt.formatDateTime(new Date(), "HH:mm")
                }
            }
        }

        // -- RIGHT ----------------------------------------------------------
        RowLayout {
            spacing:          root.pillSpacing
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            // CPU
            Rectangle {
                id:     cpuPill
                height: root.pillHeight
                width:  cpuText.implicitWidth + root.padH * 2
                radius: root.radius
                color:  root.bgColor

                property int cpuUsage:  0
                property int lastIdle:  0
                property int lastTotal: 0

                Process {
                    id:      cpuReader
                    command: ["sh", "-c", "head -1 /proc/stat"]
                    stdout: SplitParser {
                        onRead: data => {
                            if (!data) return
                            var p     = data.trim().split(/\s+/)
                            var idle  = parseInt(p[4]) + parseInt(p[5])
                            var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                            if (cpuPill.lastTotal > 0)
                                cpuPill.cpuUsage = Math.round(100 * (1 - (idle - cpuPill.lastIdle) / (total - cpuPill.lastTotal)))
                            cpuPill.lastIdle  = idle
                            cpuPill.lastTotal = total
                        }
                    }
                }

                Timer {
                    interval:         2000
                    running:          true
                    repeat:           true
                    triggeredOnStart: true
                    onTriggered:      cpuReader.running = true
                }

                Text {
                    id:             cpuText
                    anchors.centerIn: parent
                    text:           cpuPill.cpuUsage + "% "
                    color:          root.colCpu
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }
            }

            
            // RAM
            Rectangle {
                id:     ramPill
                height: root.pillHeight
                width:  ramIcon.implicitWidth + root.padH * 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             ramIcon
                    anchors.centerIn: parent
                    text:           "56% "
                    color:          root.colRam
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }
            }
            
            // Temp
            Rectangle {
                id:     tempPill
                height: root.pillHeight
                width:  tempIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             tempIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colTemp
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }
            }
            
            // Backlight
            Rectangle {
                id:     lightPill
                height: root.pillHeight
                width:  lightIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             lightIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colLight
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wlogout"])
                }
            }
            
            // Network
            Rectangle {
                id:     networkPill
                height: root.pillHeight
                width:  networkIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             networkIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colNetwork
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wlogout"])
                }
            }
            
            // Volume
            Rectangle {
                id:     volumePill
                height: root.pillHeight
                width:  volumeIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             volumeIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colVolume
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wlogout"])
                }
            }

            // Battery
            Rectangle {
                id:     batteryPill
                height: root.pillHeight
                width:  batteryIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             batteryIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colBattery
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wlogout"])
                }
            }

            // Power (wlogout)
            Rectangle {
                id:     powerPill
                height: root.pillHeight
                width:  powerIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             powerIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colPower
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape:  Qt.PointingHandCursor
                    onClicked:    Quickshell.execDetached(["wlogout"])
                }
            }

            
        }
    }
}
