import QtQuick
import Quickshell

Text {
    text: Qt.formatDateTime(clock.date, "ddd MMM d, yyyy hh:mm:ss")
    color: "#F9F6EE"
    horizontalAlignment: Text.AlignHCenter

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
