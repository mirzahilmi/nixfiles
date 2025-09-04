import QtQuick
import Quickshell.Services.Pipewire

Text {
    id: root
    text: `   ${volume}%`
    font.family: "Inter"
    color: "#F9F6EE"

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property string volume: Pipewire.ready ? `${Math.floor(sink.audio.volume * 100)}` : ""

    PwObjectTracker {
        objects: [root.sink]
    }
}
