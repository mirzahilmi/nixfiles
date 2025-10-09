import QtQuick
import Quickshell

Text {
    text: Qt.formatDateTime(clock.date, "ddd MMM d, yyyy hh:mm:ss")
    font {
        family: "Inter"
        bold: true
        letterSpacing: 0.2
    }
    color: "#F9F6EE"

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
