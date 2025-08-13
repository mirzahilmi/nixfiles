pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    readonly property string battery: `${battery_capacity.value}% ${battery_state.value}`.replace(/\n/gm, "")

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

    // // idk why these dont works
    // FileView {
    //     id: battery_capacity
    //     path: "/sys/class/power_supply/BAT0/capacity"
    //     watchChanges: true
    //     onFileChanged: reload()
    // }
    //
    // FileView {
    //     id: battery_state
    //     path: "/sys/class/power_supply/BAT0/status"
    //     watchChanges: true
    //     onFileChanged: reload()
    // }
}
