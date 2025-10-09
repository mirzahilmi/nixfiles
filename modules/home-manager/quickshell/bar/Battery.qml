import QtQuick
import Quickshell.Io

Text {
    font {
        family: "Inter"
        bold: true
        letterSpacing: 0.2
    }
    color: "#F9F6EE"

    text: `󰁹  ${battery_capacity.value}% ${battery_state.value}`.replace(/\n/gm, "")
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

    // text: `󰁹  ${batteryCurrent.text()}% ${batteryState.text()}`.replace(/\n/gm, "")
    // FileView {
    //     id: batteryCurrent
    //     path: Qt.resolvedUrl("/sys/class/power_supply/BAT0/capacity")
    //     blockLoading: true
    //     watchChanges: true
    //     onFileChanged: this.reload()
    // }
    //
    // FileView {
    //     id: batteryState
    //     path: Qt.resolvedUrl("/sys/class/power_supply/BAT0/status")
    //     blockLoading: true
    //     watchChanges: true
    //     onFileChanged: this.reload()
    // }
}
