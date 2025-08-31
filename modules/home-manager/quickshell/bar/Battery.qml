import QtQuick
import Quickshell.Io

Text {
    text: `󰁹 ${battery_capacity.value}% ${battery_state.value}`.replace(/\n/gm, "")
    color: "#F9F6EE"

    Process {
        id: battery_capacity
        property string value
        command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: battery_capacity.value = text
        }
    }

    Process {
        id: battery_state
        property string value
        command: ["cat", "/sys/class/power_supply/BAT0/status"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: battery_state.value = text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            battery_capacity.running = true;
            battery_state.running = true;
        }
    }
}
