// CPU
Rectangle {
    id:     cpuPill
    height: root.pillHeight
    width:  cpuRow.implicitWidth + root.padH * 2
    radius: root.radius
    color:  root.bgColor

    // -- Lecture /proc/stat --------------------------------------------------
    // /proc/stat ligne 1 : "cpu  user nice system idle iowait irq softirq ..."
    // Usage = 1 - (delta_idle / delta_total)

    property var _prev: null   // snapshot précédent {idle, total}
    property int cpuUsage: 0   // valeur affichée en %

    FileView {
        id:   procStat
        path: "/proc/stat"
        // on relit le fichier à chaque tick du timer
    }

    Timer {
        interval: 2000
        running:  true
        repeat:   true
        triggeredOnStart: true
        onTriggered: {
            procStat.reload()

            // Récupère la première ligne "cpu ..."
            var line = procStat.text.split("\n")[0]
            var fields = line.trim().split(/\s+/)
            // fields[0] = "cpu", [1]=user [2]=nice [3]=system [4]=idle
            // [5]=iowait [6]=irq [7]=softirq [8]=steal
            var idle  = parseInt(fields[4]) + parseInt(fields[5])  // idle + iowait
            var total = 0
            for (var i = 1; i <= 8; i++) total += parseInt(fields[i])

            if (cpuPill._prev !== null) {
                var dIdle  = idle  - cpuPill._prev.idle
                var dTotal = total - cpuPill._prev.total
                cpuPill.cpuUsage = dTotal > 0
                    ? Math.round((1 - dIdle / dTotal) * 100)
                    : 0
            }

            cpuPill._prev = { idle: idle, total: total }
        }
    }

    // -- Affichage -----------------------------------------------------------
    Row {
        id:               cpuRow
        anchors.centerIn: parent
        spacing:          4

        Text {
            text:           ""
            color:          root.colCpu
            font.family:    root.fontFamily
            font.pixelSize: root.fontSize
        }
        Text {
            text:           cpuPill.cpuUsage + "%"
            color:          root.colFg
            font.family:    root.fontFamily
            font.pixelSize: root.fontSize
        }
    }
}
