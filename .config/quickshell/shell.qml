import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

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
                    topPadding:     1
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
                    topPadding:     1
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


            Cpu {
                pillHeight:  root.pillHeight
                bgColor:     root.bgColor
                radius:      root.radius
                padH:        root.padH
                fontFamily:  root.fontFamily
                fontSize:    root.fontSize
                colCpu:      root.colCpu
            }

            Ram {
                pillHeight:  root.pillHeight
                bgColor:     root.bgColor
                radius:      root.radius
                padH:        root.padH
                fontFamily:  root.fontFamily
                fontSize:    root.fontSize
                colRam:      root.colRam
                parentWindow: root
            }

            Temp {
                pillHeight:  root.pillHeight
                bgColor:     root.bgColor
                radius:      root.radius
                padH:        root.padH
                fontFamily:  root.fontFamily
                fontSize:    root.fontSize
                colTemp:     root.colTemp
            }
                        
            Backlight {
                pillHeight:  root.pillHeight
                bgColor:     root.bgColor
                radius:      root.radius
                padH:        root.padH
                fontFamily:  root.fontFamily
                fontSize:    root.fontSize
                accentColor: root.colLight
            }

            
            Network {
                pillHeight:  root.pillHeight
                bgColor:     root.bgColor
                radius:      root.radius
                padH:        root.padH
                fontFamily:  root.fontFamily
                fontSize:    root.fontSize
                colNetwork:  root.colNetwork
                parentWindow: root
            }


            
            // Volume
            Rectangle {
                id:     volumePill
                height: root.pillHeight
                Layout.preferredWidth:  volumeIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             volumeIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colVolume
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                    topPadding:     1
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
                Layout.preferredWidth:  batteryIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             batteryIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colBattery
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                    topPadding:     1
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
                Layout.preferredWidth:  powerIcon.implicitWidth + root.padH * 2 + 2
                radius: root.radius
                color:  root.bgColor

                Text {
                    id:             powerIcon
                    anchors.centerIn: parent
                    text:           ""
                    color:          root.colPower
                    font.family:    root.fontFamily
                    font.pixelSize: root.fontSize
                    topPadding:     1
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
